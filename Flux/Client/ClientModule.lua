local ClientModule = {}

-- Variables/Dependencies
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Flux = ReplicatedStorage:WaitForChild("Flux")

local Shared = require(Flux.Shared.RemoteList)
local RequestTypes = require(Flux.Shared.RequestTypes)
local Listener = require(Flux.Client.Listener)
local PromiseWrapper = require(Flux.Client.PromiseWrapper)

-- Initialize Module
function ClientModule.Init()
    -- Cache remotes
    for n, r in pairs(RemoteList) do
        self.Remotes[n] = r
    end
end