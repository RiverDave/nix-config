# ./nixos/packages.nix
# config,
{ pkgs, ... }:
{
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
    zsh

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
    brave
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
    obsidian
    ispell
    jdk
    cmake
    pandoc
    pavucontrol

    # keystroke tracker for keybinding purposes
    xorg.xev

    # core utils

    unzip
    bison
    flex
    clang-tools
    lldb
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
    qutebrowser
    lazygit

    # This is for nvim to work correctly (dependencies :( )
    nodejs

    # Lsp's (Meant for Neovim)
    nil # nix lsp
    nixfmt-rfc-style # nix fmtter
    lua-language-server
    stylua


    zoom-us
    obs-studio

  ];

  fonts.packages = with pkgs; [

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.iosevka
    nerd-fonts.sauce-code-pro

  ];
}
