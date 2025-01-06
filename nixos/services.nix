{ config, ... }:
{
  # X11 and display services
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
        options = "repeat_rate=100 repeat_delay=125";
      };
      windowManager.i3.enable = true;
      displayManager.lightdm.enable = true;
      displayManager.sessionCommands = ''
        xrandr --output DP-1 --right-of LVDS-1 --mode 2560x1440
      '';
    };

    # Input services
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        accelSpeed = "1";
      };
    };

    emacs = {
      enable = true;
    };

    upower = {
      enable = true;
    };

    # Other services
    openssh.enable = true;
    blueman.enable = true;

  };

  services.pipewire.enable = false;

  # Programs & related config
  programs = {

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        nixs = "sudo nixos-rebuild switch --flake .#";
        nixt = "sudo nixos-rebuild test --flake .#";
        nixd = "nix-collect-garbage -d";
        vi = "nvim";

        # git stuff
        gst = "git status";
        gc = "git commit";
        gp = "git push";
        gaa = "git add .";



      };
    };

    mtr.enable = true;
    nm-applet.enable = true; # nm front-end!

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    light.enable = true;
  };
}
