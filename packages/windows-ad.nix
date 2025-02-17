{pkgs, ...}: {
  home.packages = with pkgs; [
    # windows / AD
    python312Packages.impacket
    arsenal
    neo4j
    bloodhound
    kerbrute
    adidnsdump
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

    # tor
    tor

    # password cracking
    hashcat
    # john

    # pwn
    pwndbg

    # rdp
    freerdp3

  ];
}
