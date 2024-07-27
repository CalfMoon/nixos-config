{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1&rev=a0be3de0e89f42b98d00bf0d87ad10af843d58d6";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... } @inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      system = "x86_64-linux";
      modules = [
        ./system-config/configuration.nix
        catppuccin.nixosModules.catppuccin

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            users.mooney.imports = [
              ./home-manager/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];

            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}
