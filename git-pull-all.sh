#!/bin/bash

# Funktion, um in Git-Repository-Unterordnern git pull auszuführen
function git_pull_in_subfolders() {
    local start_dir="$1"

    find "$start_dir" -type d -name ".git" -exec sh -c "cd {}; cd ..; pwd; git fetch; git pull" \;
}

# Startverzeichnis
start_dir="/projects/teclify/extern/bdk/training"

# Ausführung der Funktion
git_pull_in_subfolders "$start_dir"
