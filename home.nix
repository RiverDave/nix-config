# home.nix
{ config, pkgs, ... }: {
  home.username = "riverdave";
  home.homeDirectory = "/home/riverdave";

  home.packages = with pkgs; [
    htop
    ripgrep
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake .#";
    };
  };

  home.stateVersion = "23.11";
}
