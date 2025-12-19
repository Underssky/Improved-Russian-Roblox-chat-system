local UI = {}
;
UI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
UI["1"]["Enabled"] = true
UI["1"]["Name"] = [[ImproveTheChat]]
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
;
UI["2"] = Instance.new("ModuleScript", UI["1"])
UI["2"]["Name"] = [[MSGModule]]
;
UI["3"] = Instance.new("LocalScript", UI["1"])
UI["3"]["Name"] = [[Init]]
;
UI["4"] = Instance.new("LocalScript", UI["1"])
;

UI["5"] = Instance.new("BoolValue", UI["1"])
UI["5"]["Name"] = [[ClearOnSend]]
UI["5"]["Value"] = true
;
UI["6"] = Instance.new("Frame", UI["1"])
UI["6"]["BorderSizePixel"] = 0
UI["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["6"]["Size"] = UDim2.new(0.3188, 0, 0.3227, 0)
UI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["6"]["Name"] = [[Hold]]
UI["6"]["BackgroundTransparency"] = 1
;
UI["7"] = Instance.new("TextButton", UI["6"])
UI["7"]["TextWrapped"] = true
UI["7"]["BorderSizePixel"] = 0
UI["7"]["TextSize"] = 14
UI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["7"]["TextScaled"] = true
UI["7"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
UI["7"]["FontFace"] = Font.new([[rbxassetid://12187365364]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["7"]["Size"] = UDim2.new(0.07379, 0, 0.12414, 0)
UI["7"]["BackgroundTransparency"] = 0.35
UI["7"]["Name"] = [[SendButton]]
UI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7"]["Text"] = [[>]]
UI["7"]["Position"] = UDim2.new(0.92868, 0, 0.86396, 0)
;
UI["8"] = Instance.new("UICorner", UI["7"])
;

UI["9"] = Instance.new("UIStroke", UI["7"])
UI["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["9"]["Color"] = Color3.fromRGB(153, 153, 153)
;
UI["a"] = Instance.new("TextBox", UI["6"])
UI["a"]["TextColor3"] = Color3.fromRGB(227, 227, 227)
UI["a"]["BorderSizePixel"] = 0
UI["a"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["a"]["TextWrapped"] = true
UI["a"]["TextSize"] = 16
UI["a"]["Name"] = [[MessageBox]]
UI["a"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
UI["a"]["FontFace"] = Font.new([[rbxassetid://12187365364]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["a"]["ClearTextOnFocus"] = false
UI["a"]["PlaceholderText"] = [[--Enter message]]
UI["a"]["Size"] = UDim2.new(0.88776, 0, 0.12548, 0)
UI["a"]["Position"] = UDim2.new(0.02274, 0, 0.86396, 0)
UI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a"]["Text"] = [[]]
UI["a"]["BackgroundTransparency"] = 0.35

UI["b"] = Instance.new("UICorner", UI["a"])
;

UI["c"] = Instance.new("UIStroke", UI["a"])
UI["c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["c"]["Color"] = Color3.fromRGB(153, 153, 153)
;
UI["d"] = Instance.new("UIStroke", UI["a"])
UI["d"]["Color"] = Color3.fromRGB(37, 37, 37)
;
UI["e"] = Instance.new("TextButton", UI["6"])
UI["e"]["BorderSizePixel"] = 0
UI["e"]["TextSize"] = 14
UI["e"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["e"]["BackgroundColor3"] = Color3.fromRGB(90, 255, 0)
UI["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["e"]["Size"] = UDim2.new(0, 28, 0, 12)
UI["e"]["BackgroundTransparency"] = 0.5
UI["e"]["Name"] = [[ClrOnFocus?]]
UI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["e"]["Text"] = [[]]
UI["e"]["Position"] = UDim2.new(0.02245, 0, 1.02662, 0)
;
UI["f"] = Instance.new("LocalScript", UI["e"])

;
UI["10"] = Instance.new("UICorner", UI["e"])

;
local G2L_REQUIRE = require;
local G2L_MODULES = {};
local function require(Module:ModuleScript)
    local ModuleState = G2L_MODULES[Module];
    if ModuleState then
        if not ModuleState.Required then
            ModuleState.Required = true;
            ModuleState.Value = ModuleState.Closure();
        end
        return ModuleState.Value;
    end;
    return G2L_REQUIRE(Module);
end
;
G2L_MODULES[UI["2"]] = {
Closure = function()
    local script = UI["2"]
local msg = {}
function msg.Message(arg1, arg2)
if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
local GeneralChannel = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
if GeneralChannel then
GeneralChannel:SendAsync(arg1)
end
;
else
game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(arg1, arg2)
end
;
if script.Parent.ClearOnSend.Value == true then
script.Parent.Hold.MessageBox.Text = ""
;
elseif script.Parent.ClearOnSend.Value == false then
return false
end
;
end
return msg
;
end
}
local function SCRIPT_3()
local script = UI["3"]
local UserInputService = game:GetService("UserInputService")
local int = require(script.Parent:WaitForChild("MSGModule"))
local msgboxinit = script.Parent.Hold.MessageBox :: TextBox
local sendButton = script.Parent.Hold.SendButton
;
local function sendMessage()
local MessageText = msgboxinit.Text
if MessageText ~= "" and MessageText ~= nil then
int.Message(MessageText, "All")
if script.Parent.ClearOnSend.Value == true then
msgboxinit.Text = ""
else return false
end
end
msgboxinit:ReleaseFocus()
end
;
sendButton.MouseButton1Click:Connect(sendMessage)
;
UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
;
if input.KeyCode == Enum.KeyCode.Slash then
msgboxinit:CaptureFocus()
end
end)
;
msgboxinit.FocusLost:Connect(function(EnterKK)
if EnterKK then 
local MessageText = msgboxinit.Text
if MessageText ~= "" and MessageText ~= nil then
int.Message(MessageText, "All")
msgboxinit.Text = ""
end
end
end)
end
task.spawn(SCRIPT_3)
local function SCRIPT_4()
local script = UI["4"]
warn("⨌⨌⨌ CLear on focus is true, click the button below the chat box to change it.")
script:Destroy()
end
task.spawn(SCRIPT_4)
local function SCRIPT_f()
local script = UI["f"]
local is = true
local nocolor = Color3.new(1, 0, 0)
local yescolor = Color3.new(0.0156863, 1, 0)
local tablee = {
[true] = yescolor,
[false] = nocolor
}
script.Parent.MouseButton1Click:Connect(function()
is = not is
script.Parent.BackgroundColor3 = tablee[is]
script.Parent.Parent.Parent.ClearOnSend.Value = is
end)
end
task.spawn(SCRIPT_f)
;
return UI["1"], require;
