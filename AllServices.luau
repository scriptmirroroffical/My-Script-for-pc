-- Roblox Lua Script: List all available services
-- This should be run in the Command Bar or a Script in Studio

-- Get all services currently registered in the game
local services = game:GetChildren()

print("=== Services from game:GetChildren() ===")
for _, service in ipairs(services) do
    print(service.ClassName, "-", service.Name)
end

-- Also list services via game:GetService on a known list
local serviceNames = {
    "Players", "Lighting", "ReplicatedStorage", "ServerStorage",
    "ServerScriptService", "StarterGui", "StarterPack", "StarterPlayer",
    "Teams", "SoundService", "Chat", "HttpService", "RunService",
    "TweenService", "PathfindingService", "TeleportService",
    "DataStoreService", "MarketplaceService", "UserInputService",
    "ContextActionService", "CollectionService", "Debris",
    "InsertService", "Workspace", "LocalizationService",
    "PhysicsService", "ProximityPromptService", "TextService",
    "VirtualUser", "VRService", "PolicyService", "SocialService",
    "BadgeService", "FriendService", "GroupService", "MemoryStoreService"
}

print("\n=== Services via game:GetService() ===")
for _, name in ipairs(serviceNames) do
    local ok, service = pcall(function()
        return game:GetService(name)
    end)
    if ok and service then
        print(name, "-", service.ClassName)
    else
        print(name, "- Not available in this environment")
    end
end
