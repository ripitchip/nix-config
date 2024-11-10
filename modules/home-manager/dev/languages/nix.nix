{ pkgs, lib, config, ... }: {

    home.packages = with pkgs; [
      # format
      nixfmt-rfc-style
    ];
}
