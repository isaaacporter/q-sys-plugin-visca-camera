if props["Connection"].Value == "RS232" then
  table.insert(pins,{Name="Serial Port", Direction="input", Domain="serial"})
end