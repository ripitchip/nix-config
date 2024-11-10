{ pkgs, lib, config, ... }: {

    home.packages = with pkgs; [
      cascadia-code
      nerdfonts
     (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];

}
