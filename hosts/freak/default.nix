# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ lib, pkgs, nixos-hardware, config, inputs, ... }: {

  imports = [ ./hardware-configuration.nix ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  programs.nix-ld.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  programs.gnome-terminal.enable = true;
  xdg.mime.defaultApplications = { "application/pdf" = "brave.desktop"; };
  nix.settings.trusted-users = [ "root" "freak" ];
  networking.extraHosts = ''
    127.0.0.1 other-localhost
    192.168.56.22  castelblack.north.sevenkingdoms.local  castelblack
    192.168.56.11  winterfell.north.sevenkingdoms.local   winterfell    north.sevenkingdoms.local
    192.168.56.10  kingslanding.sevenkingdoms.local       kingslanding  sevenkingdoms.local
  '';
  services.fwupd.enable = true;

  programs.wireshark.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.localBinInPath = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  networking.hostName = "pwnixos";

  virtualisation.docker.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Casablanca";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  services.xserver.videoDrivers =
    [ "amdgpu" "radeon" "cirrus" "vesa" "nouveau" ];

  services.xserver.enable = true;
  services = {
    kanata = {
      enable = true;
      keyboards.internalKeyboard = {
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
           (defsrc
              caps
              i
              j
              k
              l
              u
              o
              a
              c
              v
              x
              t
              r
              d
              f
              e
              w
              s
              bspc
          )

          (defalias 
              ctrlSpace C-spc ;; Ctrl+Space
              capsmob (tap-hold 200 200 @ctrlSpace (layer-toggle mob)) ;; 'caps' does nothing when tapped, activates 'mob' layer when held
          )

          (deflayer default
              @capsmob    ;; 'capsmob' functionality
              i          ;; Default action for 'i' key
              j          ;; Default action for 'j' key
              k          ;; Default action for 'k' key
              l          ;; Default action for 'l' key
              u
              o
              a
              c
              v
              x
              t
              r
              d
              f
              e
              w
              s
              bspc
          )

          (deflayer mob
              -
              up        ;; 'i' as Up arrow
              left      ;; 'j' as Left arrow
              down      ;; 'k' as Down arrow
              right     ;; 'l' as Right arrow
              esc
              bspc
              C-a
              C-S-c
              C-S-v
              C-x
              C-t
              C-r
              C-d
              C-f
              C-e
              C-w
              C-s
              C-bspc
          )
        '';
      };
    };
  };

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.startx.enable = true;
  networking.firewall.allowedTCPPorts = [ 6000 ]; # Allow X server

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.freak = {
    isNormalUser = true;
    description = "freak";
    extraGroups =
      [ "networkmanager" "wheel" "input" "libvirtd" "wireshark" "docker" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [ vim home-manager ];
  security.krb5.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "24.11"; # Did you read the comment?
}
