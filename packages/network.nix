{pkgs, ...}: {
  home.packages = with pkgs; [
    nmap
    rustscan
    ligolo-ng
  ];
}

