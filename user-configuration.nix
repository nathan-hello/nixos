{ inputs, pkgs, ... }:

{
  imports = [ ];
  users.users.nate = {
    isNormalUser = true;

    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.

    packages = with pkgs; [
      firefox
      spotify
      (discord.override { withVencord = true; })

      keepassxc
      alacritty
      ffmpeg
      tree
      feh
      eza
      gh
    ];
  };



}

