{ lib, config, ... }:

{
  config = lib.mkIf config.desktop.enable {
    programs.rofi.enable = true;
    programs.rofi.terminal = "kitty";
    programs.rofi.theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          font = "Iosevka 10";
          background = mkLiteral "#1E2127FF";
          background-alt = mkLiteral "#282B31FF";
          foreground = mkLiteral "#FFFFFFFF";
          selected = mkLiteral "#61AFEFFF";
          active = mkLiteral "#98C379FF";
          urgent = mkLiteral "#E06C75FF";
        };

        "configuration" = {
          modi = "drun";
          show-icons = true;
          display-drun = "";
          drun-display-format = "{name}";
        };

        /*****----- Main Window -----*****/
        window = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = mkLiteral "false";
          width = mkLiteral "400px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";

          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "12px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "@background";
          cursor = "default";
        };

        /*****----- Main Box -----*****/
        mainbox = {
          enabled = true;
          spacing = mkLiteral "0px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          children = [ "inputbar" "listview" ];
        };

        /*****----- Inputbar -----*****/
        inputbar = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "15px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "@selected";
          text-color = mkLiteral "@background";
          children = [ "prompt" "entry" ];
        };

        prompt = {
          enabled = true;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        textbox-prompt-colon = {
          enabled = true;
          expand = false;
          str = "::";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        entry = {
          enabled = true;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search...";
          placeholder-color = mkLiteral "inherit";
        };

        /*****----- Listview -----*****/
        listview = {
          enabled = true;
          columns = 1;
          lines = 6;
          cycle = true;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;

          spacing = mkLiteral "5px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          cursor = "default";
        };
        scrollbar = {
          handle-width = mkLiteral "5px";
          handle-color = mkLiteral "@selected";
          border-radius = mkLiteral "0px";
          background-color = mkLiteral "@background-alt";
        };

        /*****----- Elements -----*****/
        element = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "8px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
        };
        "element selected.normal" = {
          background-color = mkLiteral "@background-alt";
          text-color = mkLiteral "@foreground";
        };
        element-icon = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "32px";
          cursor = mkLiteral "inherit";
        };
        element-text = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };

        /*****----- Message -----*****/
        error-message = {
          padding = mkLiteral "15px";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "12px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
        };
        textbox = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          highlight = mkLiteral "none";
        };
      };
  };
}
