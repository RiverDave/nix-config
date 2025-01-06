# ./nixos/users.nix
{ config, pkgs, ... }:
{
  users.users.riverdave = {
    isNormalUser = true;
    description = "David Rivera";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
    packages = with pkgs; [ ]; # Already defined in packages.nix
  };
}
