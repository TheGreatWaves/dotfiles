{ pkgs, ... }: 

{
  enable = true;
  oh-my-zsh = {
    enable = true;
    theme = "sorin";
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
  if [[ $(which sudo) != "/run/wrappers/bin/sudo" ]]; then
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
}
