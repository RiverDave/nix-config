{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, rust-overlay, emacs-overlay, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
        rust-overlay.overlays.default
        emacs-overlay.overlays.default
        ];
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        inherit system;
        modules = [
          ./nixos/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      devShells.${system} = {
        python = pkgs.mkShell {
          buildInputs = with pkgs; [
            (python3.withPackages (ps: with ps; [
              pip
              virtualenv
              black
              pylint
              pytest
            ]))
          ];

          shellHook = ''
            if [ ! -d .venv ]; then
              echo "Creating new Python virtual environment..."
              python -m venv .venv
            fi
            source .venv/bin/activate
            echo "Python development environment loaded"
          '';
        };

        rust = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Rust toolchain
            (rust-bin.stable.latest.default.override {
              extensions = [ "rust-src" "rust-analyzer" ];
            })
            cargo-edit
          ];

          shellHook = ''
            echo "Rust development environment loaded"
          '';
        };
      };
    };
}
