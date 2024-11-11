{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/nixos/modules.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kashyyyk"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    lc_address = "en_US.utf-8"; # Use US locale for address formatting
    lc_identification = "en_US.utf-8"; # Use US locale for identification formatting
    lc_measurement = "en_US.utf-8"; # Use US locale for measurement formatting
    lc_monetary = "en_US.utf-8"; # Use US locale for monetary formatting
    lc_name = "en_US.utf-8"; # Use US locale for name formatting
    lc_numeric = "en_US.utf-8"; # Use US locale for numeric formatting
    lc_paper = "en_US.utf-8"; # Use US locale for paper size (e.g., letter)
    lc_telephone = "en_US.utf-8"; # Use US locale for telephone number formatting
    lc_time = "en_US.utf-8"; # Use US locale for time formatting
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  users.users.thomas = {
    isNormalUser = true;
    description = "thomas";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = (with pkgs; [ git ]) ++ (with pkgs-unstable; [ ]);
  dwm.enable = true;
  WM.enable = true;
  pipewire.enable = true;
  hardware.opengl = {
    enable = true;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
