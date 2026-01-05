# Crimson Shell - Justfile

# Default recipe to display help
default:
    @just --list

current_dir := `pwd`

# Start a new Niri instance for development
run:
    niri &
     
    
    sleep 5
    niri msg action spawn -- bash -c "pkill quickshell; quickshell -p {{current_dir}}/shell.qml"

# Tests the shell locally, doesn't kill any quickshell instance
run-local:
    quickshell -p ./shell.qml

# Kills the other quickshell instances running and use this one to run
run-deploy:
    pkill quickshell
    quickshell -p ./shell.qml
