# ./nixos/configuration.nix
{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./packages.nix
    ./services.nix
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];

  # Core system settings that don't fit elsewhere
  nix = {
    package = pkgs.nixVersions.stable;
    settings = {
	      experimental-features = [ "nix-command" "flakes" ];
	    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "riverdave" = import ./home.nix;
    };
  };


  # Internationalization
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  system.stateVersion = "24.05";
}

