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
  table.insert(graphics,{
    Type = "Image",
    Image = ES_logo_full,
    Position = {177, 0},
    Size = {102, 35}
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
    Position = {0, 50},
    Size = {w1, 52}
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
  layout["Online"] = {
    PrettyName = "Online",
    Style = "Indicator",
    Color = {0, 255, 0},
    OffColor = {64, 0, 0},
    UnlinkOffColor = true,
    StrokeWidth = 1,
    Margin = 4,
    Position = {75, 50},
    Size = {h1, h1}
  }

  table.insert(graphics,{
    Type = "Text",
    Text = "IP Address",
    FontSize = fs1,
    HTextAlign = "Right",
    Position = {15, 74},
    Size = {62, h1}
  })
  layout["IPAddress"] = {
    PrettyName = "IP Address",
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
  layout["IPPort"] = {
    PrettyName = "IP Port",
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
  layout["PTZ_SpeedPan"] = {
    PrettyName = "PTZ Speed Pan",
    Style = "Text",
    FontSize = fs1,
    HTextAlign = "Center",
    Padding = 2,
    StrokeWidth = 1,
    Position = {37, 155},
    Size = {44, 18}
  }
  layout["PTZ_SpeedTilt"] = {
    PrettyName = "PTZ Speed Tilt",
    Style = "Text",
    FontSize = fs1,
    HTextAlign = "Center",
    Padding = 2,
    StrokeWidth = 1,
    Position = {37, 173},
    Size = {44, 18}
  }
  layout["PTZ_SpeedZoom"] = {
    PrettyName = "PTZ Speed Zoom",
    Style = "Text",
    FontSize = fs1,
    HTextAlign = "Center",
    Padding = 2,
    StrokeWidth = 1,
    Position = {37, 191},
    Size = {44, 18}
  }

  layout["PTZ_Home"] = {
    PrettyName = "PTZ00-Home",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {139, 150},
    Size = {h2, h2},
  }    
  layout["PTZ_Up"] = {
    PrettyName = "PTZ01-Up",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {139, 118},
    Size = {h2, h2},
  }    
  layout["PTZ_Dn"] = {
    PrettyName = "PTZ02-Down",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {139, 182},
    Size = {h2, h2},
  }    
  layout["PTZ_Lt"] = {
    PrettyName = "PTZ03-Left",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {107, 150},
    Size = {h2, h2},
  }    
  layout["PTZ_Rt"] = {
    PrettyName = "PTZ04-Right",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {171, 150},
    Size = {h2, h2},
  }    
  layout["PTZ_UpRt"] = {
    PrettyName = "PTZ05-Up Right",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {171, 118},
    Size = {h2, h2},
  }    
  layout["PTZ_DnRt"] = {
    PrettyName = "PTZ06-Down Right",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {171, 182},
    Size = {h2, h2},
  }    
  layout["PTZ_DnLt"] = {
    PrettyName = "PTZ07-Down Left",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {107, 182},
    Size = {h2, h2},
  }    
  layout["PTZ_UpLt"] = {
    PrettyName = "PTZ08-Up Left",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {107, 118},
    Size = {h2, h2},
  }    
  layout["PTZ_In"] = {
    PrettyName = "PTZ09-Zoom In",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {235, 133},
    Size = {h2, h2},
  }    
  layout["PTZ_Out"] = {
    PrettyName = "PTZ10-Zoom Out",
    Legend = "",
    Style = "Button",
    Color = Palette.es_blue,
    Margin = 4,
    Position = {235, 165},
    Size = {h2, h2},
  }    

  -- Presets ----------------------------------------------------------------
  
  layout["PresetSaved"] = {
  PrettyName = "Preset Saved",
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

    layout["Preset_Recall " .. string.format("%03d",pst)] = {
      PrettyName = "Recall P" .. string.format("%03d", pst),
      Style = "Button",
      Margin = 4,
      Color = Palette.Green,
      Legend = "P" .. (pst),
      Position = {11 + (h2 * (col - 1)),
                  246 + (h2 * (row - 1))},
      Size = {h2, h2}
    }

    if props["Preset Hold Save"].Value == false then
      layout["Preset_Save " .. string.format("%03d",pst)] = {
        PrettyName = "Save P" .. string.format("%03d", pst),
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