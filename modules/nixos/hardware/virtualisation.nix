{ pkgs, ... }:

{
  # Enable virtualbox.
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.draganddrop = true;
  virtualisation.virtualbox.guest.clipboard = true;
  virtualisation.virtualbox.guest.seamless = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  environment.systemPackages = with pkgs; [ virtualbox ];

  boot.kernelModules = [
    "vboxdrv"
    "vboxnetadp"
    "vboxnetflt"
  ];
}
