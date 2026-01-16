{pkgs, ...}: {
  enable = true;
  oh-my-zsh = {
    enable = true;
    theme = "sorin";
    plugins = [
      "git"
      "gh"
      "gitignore"
      "aliases"
      "git-commit"
    ];
  };
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  # This is a fix for nixos-wsl, for some reason when using zsh,
  # sudo is broken because /run/wrappers isn't mounted yet.
  # https://www.reddit.com/r/NixOS/comments/1etw4ip/help_please_wrong_sudo_path_when_zsh_enabled/
  initContent = ''
    if [[ $(which sudo) != "/run/wrappers/bin/sudo" ]]; then
      while [[ ! -x "$SHELL" ]]; do
        sleep 1
      done
      exec "$SHELL"
    fi

    # For autocomplete.
    bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

    # start at ~
    cd ~
  '';
}
