# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  config,
  lib,
  pkgs,
  ...
}: {
  wsl.enable = true;
  wsl.defaultUser = "kanagawa";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Enable flakes.
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.extraOptions = ''
    warn-dirty = false
  '';

  # Automatically set the timezone.
  # For some reason this doesn't work on WSL, fix then uncomment.
  # services.automatic-timezoned.enable = true;
  # Manually set timezone for now.
  time.timeZone = "Asia/Jakarta";

  # Enabling the zsh shell.
  programs.zsh.enable = true;

  # Setting up user.
  # Note: Don't forget to create the user!
  users.users.kanagawa = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "networkmanager"]; # Enable sudo for the user.
    shell = pkgs.zsh;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    git
    helix
    zsh # Everyone loves zsh. :)
  ];
}
