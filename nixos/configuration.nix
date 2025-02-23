# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  # nix.extraOptions = ''
  #   trusted-users = root freak
  # '';
  programs.nix-ld.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  programs.nix-ld.libraries = with pkgs; [


    # Add any missing dynamic libraries for unpackaged programs

    # here, NOT in environment.systemPackages

  ];
programs.gnome-terminal.enable = true;
  xdg.mime.defaultApplications = {
    "application/pdf" = "brave.desktop";
  };
  nix.settings.trusted-users = [ "root" "freak" ];
  # Firmware Updater
  networking.extraHosts =
  ''
    127.0.0.1 other-localhost
    192.168.56.22  castelblack.north.sevenkingdoms.local  castelblack
    192.168.56.11  winterfell.north.sevenkingdoms.local   winterfell    north.sevenkingdoms.local
    192.168.56.10  kingslanding.sevenkingdoms.local       kingslanding  sevenkingdoms.local
  '';
  services.fwupd.enable = true;

  programs.wireshark.enable = true;

  # services.openssh.enable = true;
  # virtualisation.libvirtd.enable = true; # For VMs using virt-manager.

  # virtualisation.containers.enable = true;
  # virtualisation = {
  #   podman = {
  #     enable = true;
  #     dockerCompat = true;     
  #     # Required for containers under podman-compose to be able to talk to each other.
  #     defaultNetwork.settings.dns_enabled = true;
  #   };
  # };
  users.defaultUserShell = pkgs.zsh;

  environment.localBinInPath = true;
  # Bootloader.
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
      experimental-features = ["nix-command" "flakes"];
    };
  };
  networking.hostName = "pwnix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  virtualisation.docker.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
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
  services.xserver.videoDrivers = [ "amdgpu" "radeon" "cirrus" "vesa" "nouveau" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services = {
    kanata = {
      enable = true;
      keyboards.internalKeyboard = {
        extraDefCfg = "process-unmapped-keys yes";
        config = builtins.readFile /home/freak/.config/kanata/config.kbd;
      };
    };
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
services.xserver.displayManager.startx.enable = true;
networking.firewall.allowedTCPPorts = [ 6000 ]; # Allow X server
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  # hardware.opengl.enable = true;
  hardware.graphics.enable = true;
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.freak = {
    isNormalUser = true;
    description = "freak";
    extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "wireshark" "docker"];
    packages = with pkgs; [
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    home-manager
  ];
  security.krb5.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
