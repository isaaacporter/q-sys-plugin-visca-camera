local ctrls = {}
  local NumPresets =  props["Num Presets"].Value
  
  -- Connection ---------------------------------------------------------------
  table.insert(ctrls, {
    Name = "system_online",
    ControlType = "Indicator",
    IndicatorType = "Led",
    DefaultValue = false,
    PinStyle = "Output",
    Count = 1,
    UserPin = true
  })
  
  table.insert(ctrls, {
    Name = "system_ip_address",
    ControlType = "Text",
    DefaultValue = "127.0.0.1",
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
  table.insert(ctrls, {
    Name = "system_ip_port",
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 1,
    Max = 65535,
    DefaultValue = 52381,
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
  
  -- PTZ ----------------------------------------------------------------------
  table.insert(ctrls, {
    Name = "setup_pan_speed",
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 1,
    Max = 24,
    DefaultValue = 12,
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
  table.insert(ctrls, {
    Name = "setup_tilt_speed",
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 1,
    Max = 20,
    DefaultValue = 10,
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
  table.insert(ctrls, {
    Name = "setup_zoom_speed",
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 0,
    Max = 7,
    DefaultValue = 3,
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
  
  table.insert(ctrls, {
    Name = "preset_home_load",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = "Home"
  })
  
  table.insert(ctrls, {
    Name = "tilt_up",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = "Arrow Up"
  })
  
  table.insert(ctrls, {
    Name = "tilt_down",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = "Arrow Down"
  })
  
  table.insert(ctrls, {
    Name = "pan_left",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = "Arrow Left"
  })
  
  table.insert(ctrls, {
    Name = "pan_right",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = "Arrow Right"
  })
  
  table.insert(ctrls, {
    Name = "pan_right_tilt_up",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    IconType = "SVG",
    Icon = Icon_Arrow_UpRt
  })
  
  table.insert(ctrls, {
    Name = "pan_right_tilt_down",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    IconType = "SVG",
    Icon = Icon_Arrow_DnRt
  })
  
  table.insert(ctrls, {
    Name = "pan_left_tilt_down",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    IconType = "SVG",
    Icon = Icon_Arrow_DnLt
  })
  
  table.insert(ctrls, {
    Name = "pan_left_tilt_up",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    IconType = "SVG",
    Icon = Icon_Arrow_UpLt
  })
  
  table.insert(ctrls, {
    Name = "zoom_in",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = "Zoom In"
  })
  
  table.insert(ctrls, {
    Name = "zoom_out",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = "Zoom Out"
  })

  table.insert(ctrls, {
    Name = "tracking_on",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input"
  })
  
  table.insert(ctrls, {
    Name = "tracking_off",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input"
  })
  
  -- Presets ------------------------------------------------------------------
  table.insert(ctrls, {
    Name = "preset_saved",
    ControlType = "Indicator",
    IndicatorType = "Led",
    DefaultValue = false,
    PinStyle = "Output",
    Count = 1,
    UserPin = true
  })
  
  for pst = 0, NumPresets - 1 do
    table.insert(ctrls, {
      Name = "preset_recall_" .. string.format("%03d",pst),
      ControlType = "Button",
      ButtonType = "Momentary",
      Count = 1,
      UserPin = true,
      PinStyle = "Input",
      Icon = ""
    })
    table.insert(ctrls, {
      Name = "preset_save_" .. string.format("%03d",pst),
      ControlType = "Button",
      ButtonType = "Momentary",
      Count = 1,
      UserPin = true,
      PinStyle = "Input",
      Icon = ""
    })
  end