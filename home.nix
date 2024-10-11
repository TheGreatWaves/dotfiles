{ config, pkgs, ... }:

{
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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zellij
    lazygit
    z-lua
    neofetch
    htop
    bat
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
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
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        true-color = true;
      };
    };

    # Note: move this out.
    themes = {
      catppuccin_mocha = let
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
        cursorline = "#2a2b3c";
        secondary_cursor = "#b5a6a8";
        secondary_cursor_normal = "#878ec0";
        secondary_cursor_insert = "#7ea87f";
      in {
        "attribute" = yellow;
        "type" = yellow;
        "type.enum.variant" = teal;
        "constructor" = sapphire;
        "constant" = peach;
        "constant.character" = teal;
        "constant.character.escape" = pink;
        "string" = green;
        "string.regexp" = pink;
        "string.special" = blue;
        "string.special.symbol" = red;
        "comment" = { fg = overlay2; modifiers = ["italic"]; };
        "variable" = text;
        "variable.parameter" = { fg = maroon; modifiers = ["italic"]; };
        "variable.builtin" = red;
        "variable.other.member" = teal;
        "label" = sapphire; # used for lifetimes
        "punctuation" = overlay2;
        "punctuation.special" = sky;
        "keyword" = mauve;
        "keyword.control.conditional" = { fg = mauve; modifiers = ["italic"]; };
        "operator" = sky;
        "function" = blue;
        "function.macro" = mauve;
        "tag" = blue;
        "namespace" = { fg = yellow; modifiers = ["italic"]; };
        "special" = blue; # fuzzy highlight
        "markup.heading.marker" = { fg = peach; modifiers = ["bold"]; };
        "markup.heading.1" = lavender;
        "markup.heading.2" = mauve;
        "markup.heading.3" = green;
        "markup.heading.4" = yellow;
        "markup.heading.5" = pink;
        "markup.heading.6" = teal;
        "markup.list" = mauve;
        "markup.bold" = { modifiers = ["bold"]; };
        "markup.italic" = { modifiers = ["italic"]; };
        "markup.link.url" = { fg = blue; modifiers = [ "italic" "underlined" ]; };
        "markup.link.text" = blue;
        "markup.raw" = flamingo;
        "diff.plus" = green;
        "diff.minus" = red;
        "diff.delta" = blue;

        # User Interface
        # --------------
        "ui.background" = { fg = text; bg = base; };
        "ui.linenr" = { fg = surface1; };
        "ui.linenr.selected" = { fg = lavender; };
        "ui.statusline" = { fg = subtext1; bg = mantle; };
        "ui.statusline.inactive" = { fg = surface2; bg = mantle; };
        "ui.statusline.normal" = { fg = base; bg = lavender; modifiers = ["bold"]; };
        "ui.statusline.insert" = { fg = base; bg = green; modifiers = ["bold"];  };
        "ui.statusline.select" = { fg = base; bg = flamingo; modifiers = ["bold"];  };
        "ui.popup" = { fg = text; bg = surface0; };
        "ui.window" = { fg = crust; };
        "ui.help" = { fg = overlay2; bg = surface0; };

        "ui.bufferline" = { fg = subtext0; bg = mantle; };
        "ui.bufferline.active" = { fg = mauve; bg = base; underline = { color = mauve; style = "line"; }; };
        "ui.bufferline.background" = { bg = crust; };

        "ui.text" = text;
        "ui.text.focus" = { fg = text; bg = surface0; modifiers = ["bold"]; };
        "ui.text.inactive" = { fg = overlay1; };

        "ui.virtual" = overlay0;
        "ui.virtual.ruler" = { bg = surface0; };
        "ui.virtual.indent-guide" = surface0;
        "ui.virtual.inlay-hint" = { fg = surface1; bg = mantle; };
        "ui.virtual.jump-label" = { fg = rosewater; modifiers = [ "bold" ]; };

        "ui.selection" = { bg = surface1; };

        "ui.cursor" = { fg = base; bg = secondary_cursor; };
        "ui.cursor.primary" = { fg = base; bg = rosewater; };
        "ui.cursor.match" = { fg = peach; modifiers = [ "bold" ]; };

        "ui.cursor.primary.normal" = { fg = base; bg = lavender; };
        "ui.cursor.primary.insert" = { fg = base; bg = green; };
        "ui.cursor.primary.select" = { fg = base; bg = flamingo; };

        "ui.cursor.normal" = { fg = base; bg = secondary_cursor_normal; };
        "ui.cursor.insert" = { fg = base; bg = secondary_cursor_insert; };
        "ui.cursor.select" = { fg = base; bg = secondary_cursor; };
        "ui.cursorline.primary" = { bg = cursorline; };
        "ui.highlight" = { bg = surface1; modifiers = ["bold"]; };
        "ui.menu" = { fg = overlay2; bg = surface0; };
        "ui.menu.selected" = { fg = text; bg = surface1; modifiers = ["bold"]; };
        "diagnostic.error" = { underline = { color = red; style = "curl"; }; };
        "diagnostic.warning" = { underline = { color = yellow; style = "curl"; }; };
        "diagnostic.info" = { underline = { color = sky; style = "curl"; }; };
        "diagnostic.hint" = { underline = { color = teal; style = "curl"; }; };
        error = red;
        warning = yellow;
        info = sky;
        hint = teal;
      };
    };
  };

  # Enable bat.
  programs.bat.enable = true;

  # Setting up autojump.
  programs.z-lua = {
    enable = true;
    enableBashIntegration = true;
    enableAliases = true;
  };

  # Setting up zsh.
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "sorin";
    };
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles/#default";
      lg = "lazygit";
      please = "sudo $(fc -ln -1)";
      cat = "bat";
    };
    plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.4.0";
            sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
          };
        }
    ];
    # This is a fix for nixos-wsl, for some reason when using zsh, 
    # sudo is broken because /run/wrappers isn't mounted yet.
    # https://www.reddit.com/r/NixOS/comments/1etw4ip/help_please_wrong_sudo_path_when_zsh_enabled/
    initExtra = ''
    if [[ ! -x "$SHELL" ]]; then
      while [[ ! -x "$SHELL" ]]; do
        sleep 1
      done
      exec "$SHELL"
    fi

    # For autocomplete.
    bindkey '^I'   complete-word       # tab          | complete
    bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

    # start at ~
    cd ~
    '';
  };
}
