{pkgs, ...}: {
  home.packages = with pkgs; [
    # proxy
    burpsuite
    httpx
    nuclei

    # fuzzers
    gobuster
    ffuf

    #wordlists
    wordlists

  # (pkgs.wordlists.override { lists = with pkgs; [ rockyou ] })
  ];
}
