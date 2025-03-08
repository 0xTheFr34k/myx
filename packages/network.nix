{ pkgs, ... }: { home.packages = with pkgs; [ rustscan go-exploitdb ]; }
