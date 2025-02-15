{ pkgs,...}: {

  imports = [
    ./zsh
  ];

  # example of how to allow unfree softwares
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem ( pkgs.lib.getName pkg) [
      "discord"
      "adreaper"
  ];

  home.packages = with pkgs; [
    # utils
    bat
    # kanata
    direnv
    nix-ld
    devenv
    python312
    python312Packages.pip
    stdenv.cc.cc.lib
    pipx
    openssl
    uv
    tmux
    btop
    lunarvim
    moreutils
    pwndbg
    lazygit
    xsel
    cargo
    pyenv
    (pkgs.callPackage ./alacritty { })

    #fonts
    nerd-fonts.jetbrains-mono

    # windows / AD
    python312Packages.impacket
    arsenal
    (pkgs.callPackage ./neo4j {})
    bloodhound
    kerbrute
    adidnsdump
    adreaper
    bloodhound-py
    breads-ad
    certi
    certipy
    certsync
    coercer
    donpapi
    enum4linux
    enum4linux-ng
    erosmb
    evil-winrm
    go365
    gomapenum
    kerbrute
    knowsmore
    lil-pwny
    nbtscan
    nbtscanner
    offensive-azure
    python3Packages.lsassy
    python3Packages.pypykatz
    rdwatool
    smbmap
    smbscan

    # ldap
    python3Packages.ldapdomaindump
    hekatomb
    msldapdump
    ldapmonitor
    ldapdomaindump
    ldapnomnom
    ldeep
    silenthound

    # proxy chains
    ligolo-ng


  ];

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "0xthefr34k";
    userEmail = "tayayassine6@live.fr";
  };
}
