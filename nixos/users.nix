# ./nixos/users.nix
{ config, pkgs, ... }: {
  users.users.riverdave = {
    isNormalUser = true;
    description = "David Rivera";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };
}
