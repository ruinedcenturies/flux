local ClientModule = {}

-- Variables/Dependencies
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Flux = ReplicatedStorage:WaitForChild("Flux")
local Config = require(Flux.Shared.FluxConfig)
local Shared = require(Flux.Shared.RemoteList)
local RequestTypes = require(Flux.Shared.RequestTypes)
local Listener = require(Flux.Client.Listener)
local PromiseWrapper = require(Flux.Client.PromiseWrapper)
local ErrorHandler = require(Flux.Shared.ErrorHandler)
local RemotesFolder = Config.RemotesFolder
ClientModule.Remotes = {}

-- Initialize Module
function ClientModule.Init()
    -- Cache remotes
    for Name, RemoteName in pairs(Shared) do
        local Remote = RemotesFolder:WaitForChild("RemoteName")

        if Remote then
            self.Remotes[Name] = Remote
        else
            ErrorHandler.LogError(200, string.format("Missing remote: %s for key %s", RemoteName, Name))
        end
    end

    
end