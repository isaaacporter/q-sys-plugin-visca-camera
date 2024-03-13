local CurrentPage = PageNames[props["page_index"].Value]
  
local h1 = 20                 --Height of text elements
local h2 = 32                 --Height of control buttons
local w1 = 280                --Width of group boxes
local fs1 = 12                --FontSize of text elements

--Calculate preset gropup box size and save button offset
local NumPresets = props["Num Presets"].Value
local NumPresetRows = math.floor((NumPresets - 1) / 8) + 1

local PresetGroupHeight = 24 + (NumPresetRows * h2)
if props["Preset Hold Save"].Value == false then
  PresetGroupHeight = PresetGroupHeight + (NumPresetRows * h2) + 8
end

local PresetSaveOffset = (h2 * NumPresetRows) + 8



if CurrentPage == "Main" then

  -- Logo -------------------------------------------------------------------
  table.insert(graphics,{
    Type = "Text",
    Text = "Build Info",
    FontSize = fs1,
    HTextAlign = "Left",
    Position = {0, 0},
    Size = {62, h1}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "v" .. PluginInfo.BuildVersion,
    FontSize = fs1,
    HTextAlign = "Left",
    Position = {0, h1},
    Size = {62, h1}
  })
  
  -- Group boxes ------------------------------------------------------------
  table.insert(graphics,{
    Type = "GroupBox",
    Text = "Connection",
    FontSize = fs1,
    HTextAlign = "Left",
    Fill = Palette.White,
    StrokeColor = Palette.Black,
    StrokeWidth = 1,
    CornerRadius = 8,
    Position = {0, 40},
    Size = {w1, 62}
  })
  table.insert(graphics,{
    Type = "GroupBox",
    Text = "PTZ",
    FontSize = fs1,
    HTextAlign = "Left",
    Fill = Palette.White,
    StrokeColor = Palette.Black,
    StrokeWidth = 1,
    CornerRadius = 8,
    Position = {0, 114},
    Size = {w1, 104}
  })

  if NumPresets > 0 then
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "Presets",
      FontSize = fs1,
      HTextAlign = "Left",
      Fill = Palette.White,
      StrokeColor = Palette.Black,
      StrokeWidth = 1,
      CornerRadius = 8,
      Position = {0, 226},
      Size = {w1, PresetGroupHeight}
    })
  end

  -- Connection -------------------------------------------------------------
  layout["system_online"] = {
    PrettyName = "System~Online",
    Style = "Indicator",
    Color = {0, 255, 0},
    OffColor = {64, 0, 0},
    UnlinkOffColor = true,
    StrokeWidth = 1,
    Margin = 4,
    Position = {75, 40},
    Size = {h1, h1}
  }
  if props["Connection"].Value == "UDP" or props["Connection"].Value == "TCP" then
    table.insert(graphics,{
      Type = "Text",
      Text = "IP Address",
      FontSize = fs1,
      HTextAlign = "Right",
      Position = {15, 74},
      Size = {62, h1}
    })
    layout["system_ip_address"] = {
      PrettyName = "System~IP Address",
      Style = "Text",
      FontSize = fs1,
      HTextAlign = "Center",
      Padding = 2,
      StrokeWidth = 1,
      Position = {79,74},
      Size = {100, h1}
    }
    
    table.insert(graphics,{
      Type = "Text",
      Text = "Port",
      FontSize = fs1,
      HTextAlign = "Right",
      Position = {184, 74},
      Size = {33, h1}
    })
    layout["system_ip_port"] = {
      PrettyName = "System~IP Port",
      Style = "Text",
      Color = Palette.White,
      OffColor = Palette.White,
      UnlinkOffColor = true,
      FontSize = fs1,
      HTextAlign = "Center",
      Padding = 2,
      StrokeWidth = 1,
      Position = {219, 74},
      Size = {44, h1}
    }
  end
  table.insert(graphics,{
    Type = "Text",
    Text = "ID",
    FontSize = fs1,
    HTextAlign = "Right",
    Position = {184, 54},
    Size = {33, h1}
  })
  layout["setup_camera_id"] = {
    PrettyName = "Camera-ID",
    Style = "Text",
    Color = Palette.White,
    OffColor = Palette.White,
    UnlinkOffColor = true,
    FontSize = fs1,
    HTextAlign = "Center",
    Padding = 2,
    StrokeWidth = 1,
    Position = {219, 54},
    Size = {44, h1}
  }
  -- PTZ --------------------------------------------------------------------
  table.insert(graphics,{
    Type = "Text",
    Text = "Speed",
    FontSize = fs1,
    HTextAlign = "Center",
    Position = {34, 137},
    Size = {47, 20}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "P\nT\nZ",
    FontSize = 15,
    HTextAlign = "Center",
    Position = {17, 153},
    Size = {17, 54}
  })
  layout["setup_pan_speed"] = {
    PrettyName = "Pan-Tilt-Zoom~Pan Speed",
    Style = "Text",
    FontSize = fs1,
    HTextAlign = "Center",
    Padding = 2,
    StrokeWidth = 1,
    Position = {37, 155},
    Size = {44, 18}
  }
  layout["setup_tilt_speed"] = {
    PrettyName = "Pan-Tilt-Zoom~Tilt Speed",
    Style = "Text",
    FontSize = fs1,
    HTextAlign = "Center",
    Padding = 2,
    StrokeWidth = 1,
    Position = {37, 173},
    Size = {44, 18}
  }
  layout["setup_zoom_speed"] = {
    PrettyName = "Pan-Tilt-Zoom~Zoom Speed",
    Style = "Text",
    FontSize = fs1,
    HTextAlign = "Center",
    Padding = 2,
    StrokeWidth = 1,
    Position = {37, 191},
    Size = {44, 18}
  }

  layout["preset_home_load"] = {
    PrettyName = "Pan-Tilt-Zoom~Home",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {139, 150},
    Size = {h2, h2},
  }    
  layout["tilt_up"] = {
    PrettyName = "Pan-Tilt-Zoom~Tilt Up",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {139, 118},
    Size = {h2, h2},
  }    
  layout["tilt_down"] = {
    PrettyName = "Pan-Tilt-Zoom~Tilt Down",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {139, 182},
    Size = {h2, h2},
  }    
  layout["pan_left"] = {
    PrettyName = "Pan-Tilt-Zoom~Pan Left",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {107, 150},
    Size = {h2, h2},
  }    
  layout["pan_right"] = {
    PrettyName = "Pan-Tilt-Zoom~Pan Right",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {171, 150},
    Size = {h2, h2},
  }    
  layout["pan_right_tilt_up"] = {
    PrettyName = "Pan-Tilt-Zoom~Pan Right / Tilt Up",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {171, 118},
    Size = {h2, h2},
  }    
  layout["pan_right_tilt_down"] = {
    PrettyName = "Pan-Tilt-Zoom~Pan Right / Tilt Down",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {171, 182},
    Size = {h2, h2},
  }    
  layout["pan_left_tilt_down"] = {
    PrettyName = "Pan-Tilt-Zoom~Pan Left / Tilt Down",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {107, 182},
    Size = {h2, h2},
  }    
  layout["pan_left_tilt_up"] = {
    PrettyName = "Pan-Tilt-Zoom~Pan Left / Tilt Up",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {107, 118},
    Size = {h2, h2},
  }
  layout["zoom_in"] = {
    PrettyName = "Pan-Tilt-Zoom~Zoom In",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {203, 133},
    Size = {h2, h2},
  }    
  layout["zoom_out"] = {
    PrettyName = "Pan-Tilt-Zoom~Zoom Out",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {203, 165},
    Size = {h2, h2},
  }   
  layout["tracking_on"] = {
    PrettyName = "Tracking~On",
    Legend = "Track\nOn",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {235, 133},
    Size = {h2, h2},
  }    
  layout["tracking_off"] = {
    PrettyName = "Tracking~Off",
    Legend = "Track\nOff",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {235, 165},
    Size = {h2, h2},
  }    

  -- Presets ----------------------------------------------------------------
  
  layout["preset_saved"] = {
  PrettyName = "Preset~Preset Saved",
  Style = "Indicator",
  Color = {255, 0, 0},
  OffColor = {16, 0, 0},
  UnlinkOffColor = true,
  StrokeWidth = 1,
  Margin = 4,
  Position = {55, 225},
  Size = {h1, h1}
  }

  for pst = 0, NumPresets - 1 do
    local row = 1 + math.floor(pst / 8)
    local col = 1 + (pst % 8)

    layout["preset_recall_" .. string.format("%03d",pst)] = {
      PrettyName = "Preset~Recall P" .. string.format("%03d", pst),
      Style = "Button",
      Margin = 4,
      Color = Palette.Green,
      Legend = "P" .. (pst),
      Position = {11 + (h2 * (col - 1)),
                  246 + (h2 * (row - 1))},
      Size = {h2, h2}
    }

    if props["Preset Hold Save"].Value == false then
      layout["preset_save_" .. string.format("%03d",pst)] = {
        PrettyName = "Preset~Save P" .. string.format("%03d", pst),
        Style = "Button",
        Margin = 4,
        Color = Palette.Red,
        Legend = "P" .. (pst),
        Position = {11 + (h2 * (col - 1)),
                    246 + PresetSaveOffset + (h2 * (row - 1))},
        Size = {h2, h2}
      }
    end
  end

end