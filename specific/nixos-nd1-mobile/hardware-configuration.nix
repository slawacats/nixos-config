{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix" )];
  
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/mapper/luks-77e8d4dd-beab-4d2a-b630-08507eb63bc8";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-77e8d4dd-beab-4d2a-b630-08507eb63bc8" = {
    device = "/dev/disk/by-uuid/77e8d4dd-beab-4d2a-b630-08507eb63bc8";
    allowDiscards = true;
    bypassWorkqueues = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6855-35EC";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  boot.initrd.luks.devices."luks-7546507e-e318-441f-ae40-4f16a23433a2" = {
    device = "/dev/disk/by-uuid/7546507e-e318-441f-ae40-4f16a23433a2";
    allowDiscards = true;
    bypassWorkqueues = true;
  };

  swapDevices = [ { device = "/dev/mapper/luks-7546507e-e318-441f-ae40-4f16a23433a2"; } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
