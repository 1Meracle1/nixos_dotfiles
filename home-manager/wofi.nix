{ pkgs, lib, config, ... }: {

  options = { wofi.enable = lib.mkEnableOption "enable wofi"; };

  config = lib.mkIf config.wofi.enable {
    programs.wofi = {
      style = ''
        window {
          font-family: "DejaVu Sans", "Font Awesome 5 Free";
          margin: 0px;
          border: 1px solid rgba(0, 0, 0, 0.9);
          background-color: rgba(29, 31, 33, 0.95);
          border-radius: 10px;
        }
        
        #input {
          margin: 5px;
          border: none;
          color: #f8f8f2;
          background-color: rgba(55, 59, 65, 0.95);
        }
        
        #inner-box {
          margin: 5px;
          border: none;
          background-color: transparent;
        }
        
        #outer-box {
          margin: 5px;
          border: none;
          background-color: transparent;
        }
        
        #scroll {
          margin: 0px;
          border: none;
        }
        
        #text {
          margin: 5px;
          border: none;
          color: #c5c8c6;
        }
        
        #entry {
          border: none;
        }
        
        #entry:focus {
          border: none;
        }
        
        #entry:selected {
          background-color: rgba(55, 59, 65, 0.95);
          border-radius: 5px;
          border: none;
        }
      '';
    };
  };
}