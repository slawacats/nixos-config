{config, pkgs, lib, ...}: 

{
  imports = [
    ./warthunder.nix
    ./hardware-configuration.nix
  ];
  
  networking.hostName = "nixos-nd1";

  networking.firewall.enable = lib.mkForce false;

  services.openssh.enable = true;
  
  environment.shellAliases = {
	  reboot = lib.mkForce "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && reboot\"";
	  poweroff = lib.mkForce "pkill brave; su -c \"sleep 0.5 && efibootmgr -n 2 && poweroff\"";
	  swap = lib.mkForce "su -c \"efibootmgr -n 3 && reboot\"";
  };

  systemd.user.services.netstatutil = {
    enable = true;
    description = "Internet Analytics";
    after = [ "graphical-session.target" ];
    # wants = [ "network-online.target"];
    # requires = [ "network-online.target" ];
    # wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "/home/nd1/.local/bin/netstatutil";
      Restart = "on-failure";
    };
  };

  environment.systemPackages = with pkgs; [
    godot
  ];

  services.ratbagd.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
