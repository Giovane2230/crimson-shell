# Crimson Shell - Justfile

# Default recipe to display help
default:
    @just --list

# Start a new Niri instance for development
run:
    niri &
    sleep 5
    niri msg action spawn -- bash -c "pkill quickshell; quickshell"
