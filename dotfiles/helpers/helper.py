#!/usr/bin/env python3

import os
import subprocess

CONFIG_PATH = os.path.expanduser("~/.config/dockerfiles")

def list_dirs(path):
    return [d for d in os.listdir(path) if os.path.isdir(os.path.join(path, d))]

def build_docker(dockerfile_path, tag):
    """Builds a Docker image from the given Dockerfile path."""
    if not os.path.exists(dockerfile_path):
        print(f"Error: No Dockerfile found in {dockerfile_path}")
        return

    command = f"docker build -t {tag} -f {dockerfile_path} ."
    print(f"Running: {command}")
    subprocess.run(command, shell=True, check=True)

def main():
    if not os.path.exists(CONFIG_PATH):
        print(f"Error: {CONFIG_PATH} does not exist.")
        return

    dirs = list_dirs(CONFIG_PATH)
    
    if not dirs:
        print("No directories found.")
        return

    # Add an "All" option
    choices = ["All"] + dirs

    print("Select a directory (or type 'All' to build all):")
    for idx, choice in enumerate(choices, start=1):
        print(f"{idx}. {choice}")
    
    choice_idx = input("Enter the number corresponding to your choice: ").strip()
    try:
        choice_idx = int(choice_idx)
        if 1 <= choice_idx <= len(choices):
            chosen_dir = choices[choice_idx - 1]
        else:
            print("Invalid selection.")
            return
    except ValueError:
        print("Invalid input.")
        return

    if chosen_dir == "All":
        for dir_name in dirs:
            dockerfile_path = os.path.join(CONFIG_PATH, dir_name, "Dockerfile")
            build_docker(dockerfile_path, f"kalilinux-{dir_name}")
    else:
        dockerfile_path = os.path.join(CONFIG_PATH, chosen_dir, "Dockerfile")
        build_docker(dockerfile_path, "kalilinux")

if __name__ == "__main__":
    main()

