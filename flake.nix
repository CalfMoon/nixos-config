{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1&rev=efb50993780079460b0cbed1363e2166a2de1d9f";
    # split-monitor-workspaces = {
    #   url = "github:Duckonaut/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, catppuccin, ... } @inputs: {
    nixosConfigurations.nixDesktop = nixpkgs.lib.nixosSystem {
      specialArgs = let
          system = "x86_64-linux";
        in {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
          };
          inherit inputs;
        };

      modules = [
        ./system-config
        ./system-config/desktop



        catppuccin.nixosModules.catppuccin
        inputs.nur.modules.nixos.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            users.mooney.imports = [
              ./home-manager
              ./home-manager/desktop
              catppuccin.homeModules.catppuccin
              inputs.spicetify-nix.homeManagerModules.spicetify
            ];

      extraSpecialArgs = let
          system = "x86_64-linux";
        in {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
          };
          inherit inputs;
        };
          };
        }
      ];
    };
  };
}
