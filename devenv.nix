{ pkgs, devenv-root, ... }:

{
  packages = with pkgs; [ just sops age just nixfmt nixfmt-rfc-style ];
}
