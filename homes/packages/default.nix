{ pkgs, ... }: {

  # example of how to allow unfree softwares

  nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem ( pkgs.lib.getName pkg) [
      "discord"
      "adreaper"
    ];

  home.packages = with pkgs; [
    # utils
    tmux
    btop
    fzf lunarvim moreutils
    pwndbg
    git
    lazygit
    xsel
    cargo
    zsh
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



programs.zsh = {
  enable = true;
  enableCompletion = true;
  syntaxHighlighting.enable = true;

  initExtra = ''
    # source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    vipe_pipe_exec() {
      local original_buffer="$BUFFER"
      BUFFER=""
      local edited_content
      edited_content=$(echo "$original_buffer" | vipe)
      zle -U "$edited_content"
    }
    zle -N vipe_pipe_exec
    bindkey '^E' vipe_pipe_exec
  '';

  shellAliases = {
    update  = "home-manager switch";
    xcopy   = "xsel --clipboard --input <";
    xpaste  = "xsel --clipboard --output >";
    xshow   = "xsel --clipboard --output";
    a       = "arsenal";
  };
  history.size = 10000;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "z" "tmux"];
    theme = "robbyrussell";
  };
  };

}
