{pkgs, ...}: {
  home.packages = with pkgs; [
    nmap
    rustscan
    ligolo-ng

    # metasploit
    metasploit

    # exploit-db
    go-exploitdb
    # exploitdb

    # pwn
    # pwntools
  ];
}
