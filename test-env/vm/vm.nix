{ config, pkgs, ... }:
{
  environment.systemPackages = [
    (import ./dazzle.nix)
    pkgs.git
  ];

  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  users = {
    mutableUsers = false;
    users.root.openssh.authorizedKeys.keyFiles = [ ./vm-ssh-key.pub ];
  };
}
