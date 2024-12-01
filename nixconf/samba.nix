{ config, pkgs, ... }:

{ 
services.samba = {
  enable = true;
  #securityType = "user";
  openFirewall = true;
  settings = {
    global = {
      #security = "user";
      "workgroup" = "WORKGROUP";
      "server string" = "smbnix";
      "netbios name" = "smbnix";
      "security" = "user";
      #"use sendfile" = "yes";
      #"max protocol" = "smb2";
      # note: localhost is the ipv6 localhost ::1
      "hosts allow" = "192.168.0. 127.0.0.1 localhost";
      "hosts deny" = "0.0.0.0/0";
      "guest account" = "xeoncpu";
      "map to guest" = "bad user";
    };
    "public" = {
      "path" = "/mnt/Movies";
      "browseable" = "yes";
      "read only" = "no";
      "guest ok" = "yes";
      "create mask" = "0644";
      "directory mask" = "0755";
      };
    "private" = {
      "path" = "/mnt/Shares/Private";
      "browseable" = "yes";
      "read only" = "no";
      "guest ok" = "no";
      "create mask" = "0644";
      "directory mask" = "0755";
      "force user" = "username";
      "force group" = "groupname";
    };
  };
};

services.samba-wsdd = {
  enable = true;
  openFirewall = true;
};

services.avahi = {
  publish.enable = true;
  publish.userServices = true;
  # ^^ Needed to allow samba to automatically register mDNS records (without the need for an `extraServiceFile`
  nssmdns4 = true;
  # ^^ Not one hundred percent sure if this is needed- if it aint broke, don't fix it
  enable = true;
  openFirewall = true;
};

networking.firewall.enable = true;
networking.firewall.allowPing = true;


}
