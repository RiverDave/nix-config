# ./nixos/boot.nix
{ config, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}
