if props.plugin_show_debug.Value == false then 
  props["Debug Print"].IsHidden = true 
end

if props["Preset Hold Save"].Value == false then 
  props["Preset Hold Time"].IsHidden = true 
end