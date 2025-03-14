alias n := build-switch-nixos
alias h := build-switch-homemanager
alias all := build-switch-nix-and-homemanager

hostname := `hostname`
user := `whoami`

default:
  @just --list

# Build and switch nixos config 
# sudo nixos-rebuild switch --flake '.#{{ machine }}' 
build-switch-nixos machine=hostname:
  nh os switch .

# Build and switch home-manager config
# home-manager switch --flake '.#{{ user }}@{{ machine }}'
build-switch-homemanager machine=hostname user=user :
  nh home switch .

# sudo nixos-rebuild switch --flake '.#{{ machine }}' 
# home-manager switch --flake '.#{{ user }}@{{ machine }}'
build-switch-nix-and-homemanager machine=hostname user=user :
  nh os switch .
  nh home switch .

# Update all flake inputs
upp:
  nix flake update

# Update target flake input
up *targets:
  nix flake update {{ targets }}

# Garbage collect
# sudo nix-collect-garbage --delete-old
gc:
  nh clean all

# Garbage collect
fmt:
  nix fmt
