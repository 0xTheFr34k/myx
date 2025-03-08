{ pkgs, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "burpsuite"
      "spotify"
      "obsidian"
      "vagrant"
    ];

}
