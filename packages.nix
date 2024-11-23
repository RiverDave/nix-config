# ./nixos/packages.nix
{ config, pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Editors and system tools
    vim
    wget
    neofetch
    tmux
    git
    btop

    # Display and window management
    i3
    i3status
    dmenu
    xterm
    picom
    xclip
    foot

    # Multimedia and browsers
    firefox
    chromium
    alacritty
    brightnessctl
    xorg.xev
  ];
}
