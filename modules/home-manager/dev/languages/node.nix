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
      pkgs.pnpm
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
    ];
  };
}
