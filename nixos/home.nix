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
      nup = "sudo nixos-rebuild switch --flake .#";
      nts = "sudo nixos-rebuild test --flake .#";
    };
  };

  home.stateVersion = "23.11";
}
