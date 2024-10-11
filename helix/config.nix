{
  # Enable helix.
  enable = true;

  # Set helix as the default editor.
  defaultEditor = true;

  # Editor settings.
  settings = {
    theme = "catppuccin_mocha";
    editor = {
      true-color = true;
    };
  };

  themes = import ./theme/catppuccin_mocha.nix;
}
