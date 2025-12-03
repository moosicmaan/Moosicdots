#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "|"

// Maximum number of Unicode characters that a block can output.
// #define MAX_BLOCK_OUTPUT_LENGTH 45
#define MAX_BLOCK_OUTPUT_LENGTH 350

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
    X("", "$HOME/.config/.scripts/sb-music", 10, 2) \
    X("", "$HOME/.config/.scripts/sb-volume", 0, 8)  \
    X("", "$HOME/.config/.scripts/sb-brightness", 0, 1) \
    X("", "$HOME/.config/.scripts/sb-battery", 60, 6) \
    X("", "$HOME/.config/.scripts/sb-disk", 1800, 3) \
    X("", "$HOME/.config/.scripts/sb-memory", 10, 4) \
    X("", "$HOME/.config/.scripts/sb-loadavg", 600, 5) \
    X("", "$HOME/.config/.scripts/sb-moonphase", 1900, 7) \
    X("", "$HOME/.config/.scripts/sb-doppler", 600, 9) \
    X("", "$HOME/.config/.scripts/sb-forecast", 1900, 11) \
    X("", "$HOME/.config/.scripts/sb-clock", 60, 10)

#endif  // CONFIG_H
