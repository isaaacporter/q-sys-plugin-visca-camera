  --vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv UDP vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

  -- Sockets
  UDP = UdpSocket.New()  -- Create new UdpSocket object
  UDPSocketOpen = false

  IPAddressCtl = Controls.IPAddress
  IPPortCtl = Controls.IPPort

  -- Map the UDP example properties to plugin properies
  IPAddress = IPAddressCtl.String
  Port = IPPortCtl.Value
  LocalIPAddress = nil    --Auto select
  LocalPort = nil         --Auto select
  LocalNICName = nil      --Auto select
  --MulticastAddress = "224.0.23.175"

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
    UDPSocketOpen = true
    
    -- Start any initial data requests or polling loops here
    CommsPoll()
  end
  
  -- Wrapper for safely binding local address
  function OpenPorts(ip, port)
    if DebugFunction then print("OpenPorts() Called: " .. ip .. ":" .. port) end
    UDP:Open(ip, port)
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
  
  -- Join the open UDPSocket to a multicast network
  -- Datagrams on the address
  function JoinMulticast(address)
    if DebugFunction then print("JoinMulticast() Called: " .. address) end
    if UDPSocketOpen then
      UDP:JoinMulticast(address)
    else
      print("Error joining multicast network: Local Socket Closed")
    end
  end
  
  -- Use the open UDPSocket to send a UDP datagram of the string (command) to the IPAddress and Port defined
  function Send(command)
    if DebugFunction then print("Send() Called") end
    if UDPSocketOpen then
      if DebugTx then print("Sending " .. IPAddress .. ":" .. Port .. " datagram: " .. command) end
      UDP:Send(IPAddress, Port, command)  -- Write command to the UDP socket
    else
      --If the socket is closed, open it and try again
      OpenSocket()
      Send(command)
    end
  end
  
  -- Handle cleanup when closing the UDP port
  function Close()
    if DebugFunction then print("Close() Called") end
    UDP:Close()
    UDPSocketOpen=false
    Controls["Online"].Boolean = false

    -- Stop any timers and clear data here
    CommsPollTimer:Stop()
  end
  
  -- Parsers
  -- UDP Data event is called when data is received on the port, either targeted at the local address or from a multicast network.
  UDP.Data = function(socket, packet)
    if DebugFunction then print("UDP Data Eventhandler Called") end
    if DebugRx then print("Address: " .. packet.Address, "Port: " .. packet.Port, "Rx: " .. packet.Data)  end
    
    -- Handle response data here
    if string.sub(packet.Data, 1, 2) == "\x01\x11" then --Valid visca reply
      Controls["Online"].Boolean = true
      CommsTimeoutTimer:Start(PollInteval * 2.5)
    end
  end
  
  --Setup the UDP sockets to be used 
  function UDP_Initialize()
    if DebugFunction then print("Initialize() Called") end

    Controls["Online"].Boolean = false
    
    IPAddress = IPAddressCtl.String
    Port = IPPortCtl.Value

    if UDPSocketOpen == true then
      Close()
    end

    if IPAddress.String ~= "" then
      SelectNIC()                       -- Choose the correct NIC for communication
      OpenSocket()                      -- Create the local UDP Socket for use
      --JoinMulticast(MulticastAddress) -- Join the specified multicast 
    end
  end


  IPAddressCtl.EventHandler = UDP_Initialize
  IPPortCtl.EventHandler = UDP_Initialize
  
  --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  --Controls["IPAddress"].String = Controls.IPAddress
  --Controls["IPPort"].String = Controls.IPPort

  local MsgSeqIndex = 0
  local PresetHold = nil
  local NumPresets = Properties["Num Presets"].Value
  local PresetHoldTime = Properties["Preset Hold Time"].Value
  
  local PanSpeed = Controls.PTZ_SpeedPan.Value
  local TiltSpeed = Controls.PTZ_SpeedTilt.Value
  local ZoomSpeed = Controls.PTZ_SpeedZoom.Value

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

  function  VISCA(typ, msg)
    --print("PTZ_Control(" .. typ .. ", " .. msg .. ")")
    if UDPSocketOpen == true then

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
      local viscaMsg = msgType .. msgLen .. msgSeq .. msg
      Send(viscaMsg)
    end
  end

  function PTZ_Control(func)
    print("PTZ_Control(" .. func .. ")")

    local PS = PanSpeed
    local TS = TiltSpeed

    if     func == "PTZ_Home" then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x04,0xff))

    elseif func == "PTZ_Up"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x03,0x01,0xff))
    elseif func == "PTZ_Dn"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x03,0x02,0xff))
    elseif func == "PTZ_Lt"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x01,0x03,0xff))
    elseif func == "PTZ_Rt"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x02,0x03,0xff))

    elseif func == "PTZ_UpRt"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x02,0x01,0xff))
    elseif func == "PTZ_DnRt"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x02,0x02,0xff))
    elseif func == "PTZ_DnLt"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x01,0x02,0xff))
    elseif func == "PTZ_UpLt"   then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,PS,TS,0x01,0x01,0xff))

    elseif func == "PTZ_In"   then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x07,(0x20 + ZoomSpeed),0xff))
    elseif func == "PTZ_Out"  then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x07,(0x30 + ZoomSpeed),0xff))

    elseif func == "PT_Stop"  then  VISCA("Cmd", string.char(0x81,0x01,0x06,0x01,0x00,0x00,0x03,0x03,0xff))
    elseif func == "Z_Stop"   then  VISCA("Cmd", string.char(0x81,0x01,0x04,0x07,0x00,0xff))
    end

  end



  --Hold Timer ---------------------------------------------
  PresetSaveTimer = Timer.New()
  function PresetSaveTimerHandler()
    PresetSaveTimer:Stop()
    Controls["PresetSaved"].Boolean = false
  end
  PresetSaveTimer.EventHandler = PresetSaveTimerHandler

  function Preset(func, pst)
    print("Preset ".. pst .. " " .. func)

    if func == "Recall" then
      VISCA("Cmd", string.char(0x81,0x01,0x04,0x3F,0x02,pst,0xff))
    elseif func == "Save" then
      VISCA("Cmd", string.char(0x81,0x01,0x04,0x3F,0x01,pst,0xff))
      Controls["PresetSaved"].Boolean = true
      PresetSaveTimer:Start(0.5)
    end
  end



  for key, val in pairs(Controls) do
    -- PTZ ------------------------------------------------
    if string.sub(key, 1, 9) == "PTZ_Speed" then
      val.EventHandler = function()
        PanSpeed = Controls.PTZ_SpeedPan.Value
        TiltSpeed = Controls.PTZ_SpeedTilt.Value
        ZoomSpeed = Controls.PTZ_SpeedZoom.Value
        print("PTZ Speeds "..PanSpeed .. ", " .. TiltSpeed .. ", " .. ZoomSpeed)
      end      
    elseif string.sub(key, 1, 4) == "PTZ_" then
      val.EventHandler = function(ctl)
        if ctl.Boolean == true then
          PTZ_Control(key)

        elseif key == "PTZ_In" or 
               key == "PTZ_Out" then
          PTZ_Control("Z_Stop")

        elseif key ~= "PTZ_Home" then
          PTZ_Control("PT_Stop")
        end
      end
    end
  end

  -- Presets ----------------------------------------------
  if NumPresets > 0 then
    for pst = 0, NumPresets - 1 do
      local recallCtl = "Preset_Recall " .. string.format("%03d", pst)
      local saveCtl = "Preset_Save " .. string.format("%03d", pst)

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
    Controls["Online"].Boolean = false
  end
  CommsTimeoutTimer.EventHandler = CommsTimeout


  --Initialise --------------------------------------------
  UDP_Initialize()