{ config, ... }:
 
{

  services.syncthing = {
     enable = true;
     openDefaultPorts = true;
     systemService = true;
     user = "xeoncpu";
     dataDir = "/home/xeoncpu";   
     configDir = "/home/xeoncpu/.config/syncthing";
};

}
