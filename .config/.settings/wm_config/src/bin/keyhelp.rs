use serde::Deserialize;
use std::fs::File;
use std::io::{self, Write};
use std::process::{Command, Stdio};

// Define a struct to match the JSON structure
#[derive(Deserialize, Debug)]
struct Bind {
    modmask: i32,
    key: String,
    arg: Option<String>,
    description: String,
}

fn map_modmask(modmask: i32) -> &'static str {
    match modmask {
        64 => "M",
        65 => "M-S",
        68 => "M-C",
        12 => "C-A",
        72 => "M-A",
        0 => "",
        _ => "Unknown", // Fallback for unexpected values
    }
}

fn main() -> io::Result<()> {
    // Execute `hyprctl binds -j` and capture the output
    let output = Command::new("hyprctl")
        .arg("binds")
        .arg("-j")
        .stdout(Stdio::piped())
        .output()
        .expect("Failed to execute hyprctl");

    // Convert the output to a string
    let json_output = String::from_utf8_lossy(&output.stdout);

    // Parse the JSON output
    let mut binds: Vec<Bind> = serde_json::from_str(&json_output).expect("Failed to parse JSON");

    // Filter out binds with `arg` that is `null` or a string from "0" to "10"
    binds.retain(|bind| {
        if let Some(arg) = &bind.arg {
            !matches!(
                arg.as_str(),
                "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "10"
            )
        } else {
            false
        }
    });

    // Sort the binds by the `arg` field
    binds.sort_by(|a, b| a.arg.cmp(&b.arg));

    // Create a new .txt file to store the results
    let mut file = File::create("/home/moosicmaan/.config/.settings/wm_config/binds.txt")?;

    // Write the desired fields to the file
    for bind in binds {
        let modmask_str = map_modmask(bind.modmask);
        let arg = bind.arg.as_deref().unwrap_or("N/A"); // Use "Unknown" if arg is None
        writeln!(file, "Keys: {}-{} ({})", modmask_str, bind.key, arg)?;
        writeln!(file, "Description: {}", bind.description)?;
        writeln!(file, "-----------------------------")?;
    }

    println!("File 'binds.txt' has been created successfully.");
    Ok(())
}
