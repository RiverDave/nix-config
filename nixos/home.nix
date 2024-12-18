# config,
{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "riverdave";
  home.homeDirectory = "/home/riverdave";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" "DejaVuSansMono" "Iosevka" ]; })
    # nerdfonts

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/riverdave/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk}";
    EDITOR = "nvim";
  };

  # Special config files

  home.file.".config/i3status/config".text = ''
    general {
        colors = true
        interval = 5
    }

    order += "disk /"
    order += "memory"
    order += "battery all"
    order += "tztime local"



    disk "/" {
        format = "SPACE AVAILABLE: %avail"
    }

    memory {
        format = "RAM USED: %used"
    }

    battery all {
        format = "BAT: %status %percentage"
    }

    tztime local {
        format = "%V %A %e.%B   %H:%M:%S"
    }
  '';

  # Let Home Manager install and manage itself..
  programs.home-manager.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "David Rivera";
      userEmail = "davidriverg@gmail.com";

    };

    emacs = {
      enable = true;
      package = pkgs.emacs; # replace with pkgs.emacs-gtk if desired
    };

    bash = {
      enable = true;

      # TODO:: Still need to figure out how to export dirs/binaries to path...
      # initExtra = ''
      # ./$HOME/flakes/init-session-vars.sh
      #
      # '';

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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

  };

}
