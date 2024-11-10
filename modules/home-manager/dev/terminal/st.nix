{ pkgs, lib, config, ... }: {

  options = { st.enable = lib.mkEnableOption "enables st"; };

  config = lib.mkIf config.st.enable {
    home.packages = with pkgs; [
      (st.overrideAttrs (oldAttrs: rec {
        src = ./st-flexipatch;
        postPatch = ''
          cp -r ${src}/* .
          ${oldAttrs.postPatch}
        '';
      }))
    ];
  };
}
