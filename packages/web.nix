{pkgs, ...}: {
  home.packages = with pkgs; [

    burpsuite
    httpx
    nuclei
  ];
}
