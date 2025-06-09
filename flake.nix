{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, spicetify-nix, catppuccin, ... } @inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [
        ./system-config/configuration.nix

        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            users.mooney.imports = [
              ./home-manager/home.nix
              catppuccin.homeModules.catppuccin
              spicetify-nix.homeManagerModules.spicetify
            ];

            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}
