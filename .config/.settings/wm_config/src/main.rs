use serde::{Deserialize, Serialize};
use std::fs::File;
use std::io::{self, Write};
use std::process::{Command, Stdio};

#[derive(Deserialize)]
struct Bind {
    modmask: i32, // Keep as i32 during deserialization
    key: String,
    submap: String,
    dispatcher: String,
    // arg: Option<String>,
    arg: String,
    description: String,
}

// Struct for serialization
#[derive(Serialize)]
struct SerializedBind {
    modmask: String, // This will hold the string after conversion
    key: String,
    submap: String,
    dispatcher: String,
    // arg: Option<String>,
    arg: String,
    description: String,
}

fn map_modmask(modmask: i32) -> &'static str {
    match modmask {
        12 => "C-A",
        64 => "M",
        65 => "M-S",
        68 => "M-C",
        72 => "M-A",
        0 => ",",
        _ => "Unknown", // Fallback for unexpected values
    }
}

fn main() -> io::Result<()> {
    let output = Command::new("hyprctl")
        .arg("binds")
        .arg("-j")
        .stdout(Stdio::piped())
        .output()
        .expect("Failed to execute hyprctl");

    let json_output = String::from_utf8_lossy(&output.stdout);
    let binds: Vec<Bind> = serde_json::from_str(&json_output).expect("Failed to parse JSON");

    // Process the binds and convert modmask to string
    let mut serialized_binds: Vec<SerializedBind> = Vec::new();

    for bind in binds {
        // Convert modmask to string
        let modmask_str = map_modmask(bind.modmask).to_string();

        // Add to the new vector for serialization
        serialized_binds.push(SerializedBind {
            modmask: modmask_str,
            key: bind.key.clone(),
            submap: bind.submap.clone(),
            dispatcher: bind.dispatcher.clone(),
            // arg: bind.arg.clone(),
            arg: bind.arg.clone(),
            description: bind.description.clone(),
        });
    }

    // Filter out binds with `arg` that is `null` or a string from "0" to "10"
    // serialized_binds.retain(|bind| {
    //     if let Some(arg) = &bind.arg {
    //         !matches!(
    //             arg.as_str(),
    //             "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "10"
    //         )
    //     } else {
    //         false
    //     }
    // });

    // Sort the remaining binds by the `arg` field
    // serialized_binds.sort_by(|a, b| a.arg.as_ref().unwrap().cmp(b.arg.as_ref().unwrap()));

    // Serialize the filtered and sorted binds to JSON
    let json_data =
        serde_json::to_string_pretty(&serialized_binds).expect("Failed to serialize JSON");

    // Write the JSON data to a file
    let mut file = File::create("binds.json")?;
    file.write_all(json_data.as_bytes())?;

    println!("File 'binds.json' has been created successfully.");
    Ok(())
}
