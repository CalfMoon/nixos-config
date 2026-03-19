{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... } @inputs: {
    nixosConfigurations.nixDesktop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

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

            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}
