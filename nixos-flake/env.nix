{ ...}:

 {
      environment.sessionVariables = {
                 MESA_SHADER_CACHE_MAX_SIZE="12G";
                 MESA_GLTHREAD="true"; 
                 NIXOS_OZONE_WL = "1";
              };
      environment.pathsToLink = [ "/libexec" ];        

 }
