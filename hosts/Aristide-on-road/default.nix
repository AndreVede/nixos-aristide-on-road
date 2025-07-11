# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, nixosModules, userConfig, inputs, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # modules
      "${nixosModules}/common"
      # virt
      "${nixosModules}/virtualisation/waydroid"
      "${nixosModules}/virtualisation/docker"
      "${nixosModules}/virtualisation/virt-manager"
      # desktop
      "${nixosModules}/desktop/cinnamon"
      # services
      "${nixosModules}/services/autoupgrade-native"
      "${nixosModules}/services/printer"
      "${nixosModules}/services/minidlna"
      # programs
      "${nixosModules}/programs/3d"
      "${nixosModules}/programs/design"
      "${nixosModules}/programs/meetings"
      "${nixosModules}/programs/multimedia"
      "${nixosModules}/programs/video-montage"
      # hardware
      "${nixosModules}/hardware/graphics"
    ];

  # Security Layer
  # Firewall
  networking.firewall = {
    # enable or disable firewall
    enable = true;

    # Open ports in the Firewall
    # allowedTCPPorts = [];
    # allowedUDPPorts = [];
  };

  # Enable the OpenSSH daemon. (disable it if no use)
  services.openssh = {
    enable = false;
    #settings = {
    #  X11Forwarding = true;
    #  PermitRootLogin = "no"; # disable root login
    #  PasswordAuthentication = false; # disable password login
    #};
    #openFirewall = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
