local NumPresets =  props["Num Presets"].Value

-- Connection ---------------------------------------------------------------
table.insert(ctrls, {
  Name = "Online",
  ControlType = "Indicator",
  IndicatorType = "Led",
  DefaultValue = false,
  PinStyle = "Output",
  Count = 1,
  UserPin = true
})

table.insert(ctrls, {
  Name = "IPAddress",
  ControlType = "Text",
  DefaultValue = "127.0.0.1",
  UserPin = true,
  PinStyle = "Both",
  Count = 1
})
table.insert(ctrls, {
  Name = "IPPort",
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
  Name = "PTZ_SpeedPan",
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
  Name = "PTZ_SpeedTilt",
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
  Name = "PTZ_SpeedZoom",
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
  Name = "PTZ_Home",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Home"
})

table.insert(ctrls, {
  Name = "PTZ_Up",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Up"
})

table.insert(ctrls, {
  Name = "PTZ_Dn",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Down"
})

table.insert(ctrls, {
  Name = "PTZ_Lt",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Left"
})

table.insert(ctrls, {
  Name = "PTZ_Rt",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Right"
})

table.insert(ctrls, {
  Name = "PTZ_UpRt",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  IconType = "SVG",
  Icon = Icon_Arrow_UpRt
  --Icon = "--[[ #encode "C:\Users\rehil\Dropbox\#DATA\QSC\Plugins\VISCA_IP\graphics\Arrow UpRight.svg"]]"
})

table.insert(ctrls, {
  Name = "PTZ_DnRt",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  IconType = "SVG",
  Icon = Icon_Arrow_DnRt
  --Icon = "--[[ #encode "C:\Users\rehil\Dropbox\#DATA\QSC\Plugins\VISCA_IP\graphics\Arrow DownRight.svg"]]"
})

table.insert(ctrls, {
  Name = "PTZ_DnLt",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  IconType = "SVG",
  Icon = Icon_Arrow_DnLt
  --Icon = "--[[ #encode "C:\Users\rehil\Dropbox\#DATA\QSC\Plugins\VISCA_IP\graphics\Arrow DownLeft.svg"]]"
})

table.insert(ctrls, {
  Name = "PTZ_UpLt",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  IconType = "SVG",
  Icon = Icon_Arrow_UpLt
  --Icon = "--[[ #encode "C:\Users\rehil\Dropbox\#DATA\QSC\Plugins\VISCA_IP\graphics\Arrow UpLeft.svg"]]"
})

table.insert(ctrls, {
  Name = "PTZ_In",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Zoom In"
})

table.insert(ctrls, {
  Name = "PTZ_Out",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Zoom Out"
})

-- Presets ------------------------------------------------------------------
table.insert(ctrls, {
  Name = "PresetSaved",
  ControlType = "Indicator",
  IndicatorType = "Led",
  DefaultValue = false,
  PinStyle = "Output",
  Count = 1,
  UserPin = true
})

for pst = 0, NumPresets - 1 do
  table.insert(ctrls, {
    Name = "Preset_Recall " .. string.format("%03d",pst),
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = ""
  })
  table.insert(ctrls, {
    Name = "Preset_Save " .. string.format("%03d",pst),
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    UserPin = true,
    PinStyle = "Input",
    Icon = ""
  })
end