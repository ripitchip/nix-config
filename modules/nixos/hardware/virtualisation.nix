{ pkgs, ... }:

{
  # Enable virtualbox.
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.host.enableHardening = false;
  virtualisation.virtualbox.guest.enable = true;
  environment.systemPackages = with pkgs; [ virtualbox ];
  virtualisation.docker.enable = true;
  environment.etc."vbox/networks.conf".text = ''
    * 10.0.0.0/8 192.168.0.0/16
    * 2001::/64
  '';
  networking.firewall.enable = false;
}
