# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./kernel.nix      
      ./networking.nix
      ./users.nix
      ./cfg.nix
      ./pkgs.nix
    ];

  boot = {
    # Use the gummiboot efi boot loader.
    loader = {
      grub.enable = false;
      systemd-boot.enable = true;
      timeout = 1;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "zfs" ];
    tmpOnTmpfs = true;
    #cleanTmpDir = true;
  };

  hardware = {
    enableAllFirmware = true;
    cpu = {
      amd = {
        updateMicrocode = true;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      bash
      wget
      curl
      git
      sysstat
      gawk
      smartmontools
      tcpdump
      traceroute
      emacs26-nox
      htop
      unzip
      p7zip
      unrar
      iptables
      efibootmgr
      usbutils
      pciutils
      ntfs3g
      ranger
      w3m
      nox
      nixops
      manpages
      #lsof
      lshw
      lm_sensors
      iotop
      motion
      iptables
      dmidecode
      bc
      arp-scan
      ascii
      diffstat
      gcc
      hdparm
      gnumake
      nix-bash-completions
      nix-serve
      v4l_utils
      nix-diff
      nix-top
      nix-script
      nixops
      nix-prefetch-git
      sysdig
      nfs-utils
      sysfsutils
    ];
    sessionVariables = {
      EDITOR = "emacs";
    };
  };

  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
  nixpkgs.config.allowUnfree = true;
  nix.autoOptimiseStore = true;
}
