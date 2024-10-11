{
  # Enable helix.
  enable = true;

  # Set helix as the default editor. (As one should)
  defaultEditor = true;

  themes = import ./theme/catppuccin_mocha.nix;

  # Editor settings.
  settings = {
    theme = "catppuccin_mocha";

    editor = {
      true-color = true;
      line-number = "relative";
      auto-format = true;
      color-modes = true;
      completion-replace = true;
      soft-wrap.enable = true;
      indent-guides.render = true;
      statusline.right = [ "diagnostics" "selections" "position" "position-percentage" "file-encoding" ];
    };

    keys.normal = {
      C-w = "save_selection";
      C-s = ":w!";
      V = [ "goto_first_nonwhitespace" "extend_to_line_end" ];
      D = [ "ensure_selections_forward" "extend_to_line_end" "trim_selections" ];
      x = "extend_line";
      a = [ "append_mode" "collapse_selection" ];
      i = [ "insert_mode" "collapse_selection" ];
      C-j = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
      C-k = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
    };

    keys.select = {
      ";" = [ "collapse_selection" "normal_mode" ];
      A-j = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
      A-k = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
    };

    keys.insert = {
      "C-[" = "normal_mode";
      A-x = "normal_mode";
      C-s = ":w";
    };
  };
}
