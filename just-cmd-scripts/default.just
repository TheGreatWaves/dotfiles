default: commands

rebuild profile="default":
  @echo "Building target profile: {{ profile }}"
  @sudo nixos-rebuild switch --flake ~/dotfiles/#{{ profile }}

commands:
  @just -g --list

please:
  @sudo $(fc -ln -1)
