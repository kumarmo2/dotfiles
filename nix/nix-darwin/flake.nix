{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
          pkgs.nixd
          pkgs.tmux
          pkgs.neovim
          pkgs.fastfetch
          pkgs.zoxide
          pkgs.fzf
          pkgs.nodejs
          pkgs.go
          pkgs.eza
          pkgs.lazygit
          pkgs.pi-coding-agent
          pkgs.ripgrep
          pkgs.dotnet-sdk_10
          pkgs.awscli2
          pkgs.yarn
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;
      environment.shells = [ pkgs.fish ];

      system.activationScripts.postActivation.text = ''
          dscl . -create /Users/kumarmo2 UserShell /run/current-system/sw/bin/fish
          '';

      # use touchId in terminal
      security.pam.services.sudo_local.touchIdAuth = true;

# Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#kumarmo2
    darwinConfigurations."kumarmo2" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
