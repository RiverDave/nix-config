{ config, ... }: {
  # X11 and display services
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
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

    # Other services
    openssh.enable = true;
    blueman.enable = true;



  };

  services.pipewire.enable = false;



  # Programs
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    light.enable = true;
  };
}
