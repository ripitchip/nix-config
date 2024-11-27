{
  pkgs,
  lib,
  config,
  dream2nix,
  ...
}:
{
  options = {
    # Option to enable Node.js and related tools
    node.enable = lib.mkEnableOption "Enable Node.js and related tools";
  };

  config = lib.mkIf config.node.enable {
    home.packages = [
      pkgs.nodejs_22
      pkgs.prettierd
      pkgs.nodePackages.prettier
      pkgs.node2nix
      pkgs.yarn

      # Include the hello package
      (pkgs.stdenv.mkDerivation {
        name = "hello";
        version = "2.12.1";
        src = builtins.fetchTarball {
          url = "https://ftp.gnu.org/gnu/hello/hello-2.12.1.tar.gz";
          sha256 = "0xw6cr5jgi1ir13q6apvrivwmmpr5j8vbymp0x6ll0kcv6366hnn";
        };
        buildInputs = [
          pkgs.gcc
          pkgs.coreutils
        ];
      })

      # Include the bambu-cli package using dream2nix
      (pkgs.stdenv.mkDerivation {
        pname = "bambu-cli";
        version = "latest"; # You can specify the version if needed
        src = pkgs.fetchFromGitHub {
          owner = "davglass";
          repo = "bambu-cli";
          rev = "398c24057c71fc6bcc5dbd818bdcacc20833f61c"; # revision from nix-prefetch-git
          sha256 = "0nvysrrzzca9ax54v9nxqmk5dizd10zmxna72xi878x5747izmw8"; # sha256 from nix-prefetch-git
        };
        buildInputs = [
          pkgs.nodejs_22
          pkgs.yarn
        ];
        nativeBuildInputs = [ pkgs.gcc ];

        installPhase = ''
          mkdir -p $out/bin
          cp -r * $out/bin
        '';

        meta = with pkgs.lib; {
          description = "CLI tool for managing Bambu tasks";
          license = licenses.mit;
          platforms = platforms.all;
        };
      })
    ];
  };
}
