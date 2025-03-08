{ pkgs, ... }: {
  home.packages = with pkgs; [
    # proxy
    burpsuite
    httpx
    nuclei

    # fuzzers
    gobuster
    ffuf

    # wordlists
    wordlists

    # cracking
    thc-hydra

    #sql
    sqlmap
    ghauri

  ];
}
