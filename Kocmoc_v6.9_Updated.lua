repeat wait(0.1) until game:IsLoaded()

hives = game.Workspace.Honeycombs:GetChildren() for i = #hives, 1, -1 do  v = game.Workspace.Honeycombs:GetChildren()[i] if v.Owner.Value == nil then game.ReplicatedStorage.Events.ClaimHive:FireServer(v.HiveID.Value) end end

wait(1)

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

local args1 = {["Type"] = "Basic",["Amount"] = 50,["Category"] = "Eggs"}
game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Purchase", args1)

for vertical=1, 10 do
    for horizontal=1, 5 do
        game:GetService("ReplicatedStorage").Events.ConstructHiveCellFromEgg:InvokeServer(horizontal, vertical, "Basic", 1, false); task.wait()
    end
end
