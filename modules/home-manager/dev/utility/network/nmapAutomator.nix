{ pkgs, ... }:

let
  nmapAutomator = pkgs.stdenv.mkDerivation {
    name = "nmap-automator";
    version = "1.0";

    src = pkgs.fetchgit {
      url = "https://github.com/21y4d/nmapAutomator.git";
      rev = "HEAD"; # or a specific commit hash, if desired
      sha256 = "HwBvhFvGVY5q0C62XjNalQUaX7y24B1Vt8UqAIHp8/g=";
    };

    buildInputs = [ pkgs.bash ];

    installPhase = ''
      mkdir -p $out/bin
      cp nmapAutomator.sh $out/bin/nmap-automator
      chmod +x $out/bin/nmap-automator
    '';

    meta = {
      description = "A simple nmap automation script";
      homepage = "https://github.com/21y4d/nmapAutomator";
      licenses = [ pkgs.licenses.mit ];
    };
  };
in
{
  home.packages = [ nmapAutomator ];
}
