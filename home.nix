{ config, pkgs, lib, ... }:

{
  imports = [
    ./just/config.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kanagawa";
  home.homeDirectory = "/home/kanagawa";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Set up fonts.
  # fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zellij
    lazygit
    z-lua
    neofetch
    htop
    bat
    nil
    just
    eza
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
  #  /etc/profiles/per-user/kanagawa/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Git configuration.
  programs.git = {
    enable = true;
    userName = "kanagawa";
    userEmail = "ochawinappi@gmail.com";
  };

  # Helix setup.
  programs.helix = import ./helix/config.nix;

  # Enable bat.
  programs.bat.enable = true;

  # Setting up autojump.
  programs.z-lua = {
    enable = true;
    enableBashIntegration = true;
    enableAliases = true;
  };

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      default_layout = "compact";
      default_mode = "locked";
      keybinds.locked = {
        "bind \"Ctrl g\"".SwitchToMode = "Normal";
        "bind \"Alt h\" \"Alt Left\"".MoveFocusOrTab = "Left";
        "bind \"Alt l\" \"Alt Right\"".MoveFocusOrTab = "Right";
        "bind \"Alt j\" \"Alt Down\"".MoveFocusOrTab = "Down";
        "bind \"Alt k\" \"Alt Up\"".MoveFocusOrTab = "Up";
        "bind \"Ctrl t\"".NewTab = null; 
        "bind \"Alt f\"".ToggleFocusFullscreen = {};
        "bind \"Ctrl x\"".CloseTab = {};
        "bind \"Alt r\"" = {
          SwitchToMode = "RenameTab";
          TabNameInput = 0;
        };
      };
    };
  };
  # Setting up zsh.
  programs.zsh = import ./zsh/config.nix { inherit pkgs; };

  # Setting up eza.
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  # Set up global justfile configurations.
  programs.justfile = {
    enable = true;
    enableZshIntegration = true;
    source = lib.concatStrings [
      # Default
      ''
        rebuild profile="default":
            sudo nixos-rebuild switch --flake ~/dotfiles/#{{ profile }}
      '' 

      # If eza is enabled.
      (lib.mkIf config.programs.eza.enable ''
        [no-cd]
        ls:
          @eza

        [no-cd]
        ll:
          @exa -alh

        [no-cd]
        tree:
          @exa --tree
      '').content
    ];
  };
}
