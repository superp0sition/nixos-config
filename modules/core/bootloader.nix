{ pkgs, host, ... }:
{

  boot.loader.systemd-boot.enable = if (host == "desktop") then false else true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
