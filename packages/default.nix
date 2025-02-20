{pkgs, ...}: {
  imports = [
    ./zsh/zsh.nix
    ./utils.nix
    ./web.nix
    ./windows-ad.nix
    ./allowUnfreePredicate.nix
    ./desktop.nix
    ./network.nix
  ];

  home.packages = with pkgs; [
    python312
    python312Packages.pip
    stdenv.cc.cc.lib
    go
    gcc
    (pkgs.callPackage ./john.nix { })
  ];

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "0xthefr34k";
    userEmail = "tayayassine6@live.fr";
  };
}
