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
    };

    # Input services
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        accelSpeed = "1";
      };
    };

    # Other services
    openssh.enable = true;
  };

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
