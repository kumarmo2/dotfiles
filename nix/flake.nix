{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    zenBrowser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kmonad = {
        url = "github:kmonad/kmonad?dir=nix";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, kmonad, ... } @ inputs : {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs; };
        modules = [ ./configuration.nix kmonad.nixosModules.default ];
    };  
  };
}

