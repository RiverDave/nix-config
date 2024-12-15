# ./nixos/hardware.nix
{ config, pkgs, ... }:
{
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };

    trackpoint.sensitivity = 255;
    bluetooth.enable = true;
  };

  nixpkgs.config.pulseaudio = true;
}
