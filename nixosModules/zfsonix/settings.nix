{ localFlake, diskName, ... }:
{
  imports = [
    #../../zfs-rollback.nix
  ];
  boot = {
    kernelParams = [ "nohibernate" ];
    tmp.cleanOnBoot = true;
  };
  fileSystems = {
    "/".neededForBoot = true;
    "/persist".neededForBoot = true;
    "/mnt/${diskName}".neededForBoot = true;
  };
 # zfs-rollback = {
  #  enable = true;
   # snapshot = "blank";
    #volume = "${diskName}-zfsos/faketmpfs";
  #};
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/var/log"
      "/var/lib/systemd/coredump"
    ];
  };
}
