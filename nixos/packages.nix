# ./nixos/packages.nix
{ config, pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System wide packages
  # for home based packages check home.nix
  environment.systemPackages = with pkgs; [
    # Editors and system tools
    vim
    neovim
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
    pulseaudio
    ungoogled-chromium
    alacritty
    kitty
    brightnessctl
    spotify-player
    ripgrep
    thunderbird-unwrapped
    teams-for-linux
    direnv
    libreoffice
    bluetuith
    flameshot
    pcmanfm
    emacs
    arandr

    # keystroke tracker
    xorg.xev


    # core utils

    unzip
    bison
    flex
    fontforge
    makeWrapper
    pkg-config
    gnumake
    gcc
    libiconv
    autoconf
    automake
    libtool # freetype calls glibtoolize
    python3 # freetype calls glibtoolize

    # This is for nvim to work correctly (dependencies :( )
    nodejs

    # Lsp's (I love Neovim)
    nil


  ];
}
