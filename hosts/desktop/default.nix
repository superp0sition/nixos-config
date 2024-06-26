{ pkgs, lib, inputs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    # inputs.rednix.container
  ];

  powerManagement.cpuFreqGovernor = "performance";

  environment.systemPackages = [
    # For debugging and troubleshooting Secure Boot.
    pkgs.sbctl
  ];
  
  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in configuration.nix
  # generated at installation time. So we force it to false
  # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}