 --vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv UDP vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  
-- Sockets
if Properties["Connection"].Value == "IP" then
  Connection = UdpSocket.New()  -- Create new UdpSocket object
elseif Properties["Connection"].Value == "RS232" then
  Connection = SerialPorts[1]
end
ConnectionOpen = false

IPAddressCtl = Controls["system_ip_address"]
IPPortCtl = Controls["system_ip_port"]

-- Map the UDP example properties to plugin properies
IPAddress = IPAddressCtl.String
Port = IPPortCtl.Value
LocalIPAddress = nil    --Auto select
LocalPort = nil         --Auto select
LocalNICName = nil      --Auto select  
PollInteval = 10


-- If a NIC is specified by name, bind LocalIPAddress to it
function SelectNIC()
  if DebugFunction then print("SelectNIC() Called") end
  if LocalNICName ~= nil then
    -- Detect the local IP address selected LAN
    local nics = Network.Interfaces()
    for i,nic in ipairs(nics) do
      if nic.Interface == LocalNICName then
        LocalIPAddress = nic.Address
      end
    end
  end
end

-- When the UDP Socket is created run these setup functions
function Connected()
  if DebugFunction then print("Connected() Called") end
  print("UDP Socket Opened")
  ConnectionOpen = true
  
  -- Start any initial data requests or polling loops here
  CommsPoll()
end

-- Wrapper for safely binding local address
function OpenPorts(ip, port)
  if DebugFunction then print("OpenPorts() Called: " .. ip .. ":" .. port) end
  Connection:Open(ip, port)
end

-- Opens a local UDP socket for use
function OpenSocket()
  if DebugFunction then print("OpenSocket() Called") end  
  -- If a local address has been chosen, open a UDP socket for use
  if LocalIPAddress ~= nil then
    print("Opening: " .. LocalIPAddress .. ":" .. LocalPort)
    -- pcall will prevent down interfaces from causing script errors
    local portGood, err = pcall(OpenPorts, LocalIPAddress, LocalPort)
    if not portGood then
      print("Error opening UDP Socket: " .. err)
    else
      Connected()
    end

  -- Let the core choose the address and port of the UDP socket automatically
  else
    OpenPorts(nil,nil)
    Connected()
  end
end

-- Use the open UDPSocket to send a UDP datagram of the string (command) to the IPAddress and Port defined
function Send(command)
  if DebugFunction then print("Send() Called") end
  if ConnectionOpen then
    if DebugRx then print("Sending " .. command)  end
    if Properties["Connection"].Value == "IP" then
      Connection:Send(IPAddress, Port, command)  -- Write command to the UDP socket
    elseif Properties["Connection"].Value == "RS232" then
      Connection:Write(command)
    end
  else
    --If the socket is closed, open it and try again
    OpenSocket()
    Send(command)
  end
end

-- Handle cleanup when closing the UDP port
function Close()
  if DebugFunction then print("Close() Called") end
  Connection:Close()
  ConnectionOpen=false
  Controls["system_online"].Boolean = false

  -- Stop any timers and clear data here
  CommsPollTimer:Stop()
end

-- Parsers
-- UDP Data event is called when data is received on the port, either targeted at the local address or from a multicast network.
if Properties["Connection"].Value == "IP" then
  Connection.Data = function(socket, packet)
    if DebugFunction then print("UDP Data Eventhandler Called") end
    if DebugRx then print("Address: " .. packet.Address, "Port: " .. packet.Port, "Rx: " .. packet.Data)  end
    
    -- Handle response data here
    if string.sub(packet.Data, 1, 2) == "\x01\x11" then --Valid visca reply
      Controls["system_online"].Boolean = true
      CommsTimeoutTimer:Start(PollInteval * 2.5)
    end
  end
elseif Properties["Connection"].Value == "RS232" then
  Connection.Data = function(port)
    if DebugFunction then print("RS232 Data Eventhandler Called") end
    if DebugRx then print("Rx: " .. port:ReadLine(SerialPorts.EOL.Any))  end
    Controls["system_online"].Boolean = true
  end
  Connection.Connected = function()
    ConnectionOpen = true
  end
end



--Setup the UDP sockets to be used 
function Initialize()
  if DebugFunction then print("Initialize() Called") end
  Controls["system_online"].Boolean = false
  
  IPAddress = IPAddressCtl.String
  Port = IPPortCtl.Value

  if ConnectionOpen == true then
    Close()
  end

  if Properties["Connection"].Value == "IP" then
    if IPAddress.String ~= "" then
      SelectNIC()                       -- Choose the correct NIC for communication
      OpenSocket()                      -- Create the local UDP Socket for use
    end
  elseif Properties["Connection"].Value == "RS232" then
    Connection:Open(9600, 8, "N")
  end
end


IPAddressCtl.EventHandler = Initialize
IPPortCtl.EventHandler = Initialize

--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

local MsgSeqIndex = 0
local PresetHold = nil
local NumPresets = Properties["Num Presets"].Value
local PresetHoldTime = Properties["Preset Hold Time"].Value

local PanSpeed = Controls["setup_pan_speed"].Value
local TiltSpeed = Controls["setup_tilt_speed"].Value
local ZoomSpeed = Controls["setup_zoom_speed"].Value

function HexToString(num, len)
  --Returns num as string of len * hex bytes
  local val = num
  local ret = ""
  for i = 1, len do
    ret = string.char(val & 0xff) .. ret
    val = math.floor(val / 0x100)
  end
  return ret
end

function VISCA(typ, msg)	
  --print("PTZ_Control(" .. typ .. ", " .. msg .. ")")	
  if ConnectionOpen == true then	

    CommsPollTimer:Start(PollInteval)	

    --Calculate message type for header	
    local msgType = string.char(0x01,0x00)	
    if string.sub(typ, 1, 3) == "Inq" then	
      msgType = string.char(0x01,0x10)	
    end	

    --Calculate message length for header	
    local msgLen = HexToString(#msg, 2)	

    --Calculate sequence number header	
    if MsgSeqIndex < 0xFFFFFFFF then	
      MsgSeqIndex = MsgSeqIndex + 1	
    else	
      MsgSeqIndex = 0	
    end	
    local msgSeq = HexToString(MsgSeqIndex, 4)	

    --Build and send message
    local viscaMsg = ""
    if Properties["Command Set"].Value == "VISCA" then
      viscaMsg = msg
    elseif Properties["Command Set"].Value == "VISCA over IP" then
      viscaMsg = msgType .. msgLen .. msgSeq .. msg	
    end
    Send(viscaMsg)	
  end	
end	


function PTZ_Control(func)
  print(func)

  local PS = PanSpeed
  local TS = TiltSpeed

  if     func == "preset_home_load"     then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x04,0xff))

  elseif func == "tilt_up"              then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x03,0x01,0xff))
  elseif func == "tilt_down"            then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x03,0x02,0xff))
  elseif func == "pan_left"             then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x01,0x03,0xff))
  elseif func == "pan_right"            then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x02,0x03,0xff))

  elseif func == "pan_right_tilt_up"    then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x02,0x01,0xff))
  elseif func == "pan_right_tilt_down"  then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x02,0x02,0xff))
  elseif func == "pan_left_tilt_down"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x01,0x02,0xff))
  elseif func == "pan_left_tilt_up"     then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x01,0x01,0xff))

  elseif func == "zoom_in"              then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x07,(0x20 + ZoomSpeed),0xff))
  elseif func == "zoom_out"             then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x07,(0x30 + ZoomSpeed),0xff))

  elseif func == "pan_tilt_stop"        then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,0x00,0x00,0x03,0x03,0xff))
  elseif func == "zoom_stop"            then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x07,0x00,0xff))

  elseif func == "tracking_on"          then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x35,0x02,0xff))
  elseif func == "tracking_off"         then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x35,0x03,0xff))
  end
end



--Hold Timer ---------------------------------------------
PresetSaveTimer = Timer.New()
function PresetSaveTimerHandler()
  PresetSaveTimer:Stop()
  Controls["preset_saved"].Boolean = false
end
PresetSaveTimer.EventHandler = PresetSaveTimerHandler

function Preset(func, pst)
  print("Preset ".. pst .. " " .. func)

  if func == "Recall" then
    VISCA("Cmd", string.char(0x81,0x01,0x04,0x3F,0x02,pst,0xff))
  elseif func == "Save" then
    VISCA("Cmd", string.char(0x81,0x01,0x04,0x3F,0x01,pst,0xff))
    Controls["preset_saved"].Boolean = true
    PresetSaveTimer:Start(0.5)
  end
end



for key, val in pairs(Controls) do
  -- PTZ ------------------------------------------------
  if string.sub(key, -6, -1) == "_speed" then
    val.EventHandler = function()
      PanSpeed = Controls["setup_pan_speed"].Value
      TiltSpeed = Controls["setup_tilt_speed"].Value
      ZoomSpeed = Controls["setup_zoom_speed"].Value
      print("PTZ Speeds "..PanSpeed .. ", " .. TiltSpeed .. ", " .. ZoomSpeed)
    end      
  elseif string.sub(key, 1, 4) == "pan_" or
          string.sub(key, 1, 5) == "tilt_" or
          string.sub(key, 1, 5) == "zoom_" or
          string.sub(key, 1, 9) == "tracking_" or
          key == "preset_home_load" then
    val.EventHandler = function(ctl)
      if ctl.Boolean == true then
        PTZ_Control(key)

      elseif key == "zoom_in" or 
              key == "zoom_out" then
        PTZ_Control("zoom_stop")

      elseif key ~= "preset_home_load" and (string.sub(key, 1, 9) ~= "tracking_") then
        PTZ_Control("pan_tilt_stop")
      end
    end
  end
end

-- Presets ----------------------------------------------
if NumPresets > 0 then
  for pst = 0, NumPresets - 1 do
    local recallCtl = "preset_recall_" .. string.format("%03d", pst)
    local saveCtl = "preset_save_" .. string.format("%03d", pst)

    Controls[recallCtl].EventHandler = function()
      if Properties["Preset Hold Save"].Value == false then
        if Controls[recallCtl].Boolean == true then
          Preset("Recall", pst)
        end
      else
        if Controls[recallCtl].Boolean == true then
          PresetHoldTimer:Start(PresetHoldTime)
          PresetHold = pst
        else
          PresetHoldTimer:Stop()
          if PresetHold ~= nil then
            Preset("Recall", PresetHold)
          end
          PresetHold = nil
        end
      end
    end


    Controls[saveCtl].EventHandler = function()
      if Controls[saveCtl].Boolean == true then
        Preset("Save", pst)
      end
    end
  end
end

--Hold Timer ---------------------------------------------
PresetHoldTimer = Timer.New()
function PresetHoldTimerHandler()
  PresetHoldTimer:Stop()
  if PresetHold ~= nil then
    Preset("Save", PresetHold)
  end
end
PresetHoldTimer.EventHandler = PresetHoldTimerHandler

--Comms polling and timeout ------------------------------
CommsPollTimer = Timer.New()
function CommsPoll()
  VISCA("Inq", string.char(0x81,0x09,0x00,0x02,0xFF))
  --print('Polling')
end
CommsPollTimer.EventHandler = CommsPoll

CommsTimeoutTimer = Timer.New()
function CommsTimeout()
  CommsTimeoutTimer:Stop()
  Controls["system_online"].Boolean = false
end
CommsTimeoutTimer.EventHandler = CommsTimeout


--Initialise --------------------------------------------
Initialize()