#!/bin/bash

# Define the project name
PROJECT_NAME="msp430-baremetal"

# Function to create a directory if it doesn't exist
create_directory() {
  if [ ! -d "$1" ]; then
    mkdir "$1"
    echo "Created directory: $1"
  fi
}

# Function to create a file with initial content
create_file() {
  if [ ! -f "$1" ]; then
    echo "$2" > "$1"
    echo "Created file: $1"
  fi
}

# Get the name of the current directory
CURRENT_DIR=$(basename "$(pwd)")

# Check if the current directory is the project directory
if [ "$CURRENT_DIR" != "$PROJECT_NAME" ]; then
  # Check if the project directory exists or create it
  create_directory "$PROJECT_NAME"
  cd "$PROJECT_NAME"
fi

# Proceed with setting up subdirectories and files
create_directory "src"
create_directory "include"
create_directory "lib"
create_directory "doc"
create_directory "tools"
create_directory "bin"

# Create initial files
create_file "src/main.c" "// Main program entry point"
create_file "include/hardware.h" "// Hardware-specific configurations"
create_file "doc/README.md" "# Project Overview and Setup Instructions"
create_file "tools/Makefile" "# Makefile for building the project"
create_file ".gitignore" "# Ignore compiled binary files\n/bin/"

echo "Project setup complete in $(pwd)."

