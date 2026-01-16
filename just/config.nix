{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.justfile;
in {
  options.programs.justfile = {
    enable = mkEnableOption "Enable global just commands.";

    package = mkOption {
      type = types.package;
      default = pkgs.just;
      defaultText = literalExpression "pkgs.just";
      description = "The package to use for just.";
    };

    file = mkOption {
      default = ".justfile";
      type = types.str;
      description = "Name of the global justfile.";
    };

    source = mkOption {
      default = "";
      type = types.lines;
      description = "justfile commands.";
    };

    enableZshIntegration = mkOption {
      default = true;
      type = types.bool;
      description = "Enable Zsh integration.";
    };
  };

  config = mkIf cfg.enable {
    home.file.".justfile".text = cfg.source;

    programs.zsh.initContent = mkIf cfg.enableZshIntegration ''
      # Add just recipes.
      for recipe in `just -f ~/${cfg.file} --summary`; do
        alias $recipe="just -f ~/${cfg.file} -d. $recipe"
      done
    '';
  };
}
