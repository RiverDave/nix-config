# ./nixos/hardware.nix
{ config, pkgs, ... }: {
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };

    trackpoint.sensitivity = 255;
  };

  nixpkgs.config.pulseaudio = true;
}

