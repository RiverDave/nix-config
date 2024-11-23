# ./nixos/networking.nix
{ config, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    
    # Uncomment if needed
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  time.timeZone = "America/New_York";
}
