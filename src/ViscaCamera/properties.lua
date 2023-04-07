table.insert(props, {
  Name = "Num Presets",
  Type = "integer",
  Value = 8,
  Min = 0,
  Max = 128
})
table.insert(props, {
  Name = "Preset Hold Save",
  Type = "boolean",
  Value = false
})
table.insert(props, {
  Name = "Preset Hold Time",
  Type = "double",
  Value = 2,
  Min = 0.5,
  Max = 5.0
})
table.insert(props, {
  Name = "Debug Print",
  Type = "enum",
  Choices = {"None", "Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
  Value = "None"
})


