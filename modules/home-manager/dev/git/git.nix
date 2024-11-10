{ pkgs, lib, config, ... }: {
  programs.git = {
    enable = true;
    userEmail = "thomasderudder@sfr.fr";
    userName = "Thomas Derudder";
  };
}
