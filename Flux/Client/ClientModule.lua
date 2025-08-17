local ClientModule = {}

-- Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
ClientModule.Remotes = {}

-- Dependencies
local Listener = require(script.Listener)
local PromiseWrapper = require(script.PromiseWrapper)
local RemoteList = require(ReplicatedStorage.Flux.Shared.RemoteList)
local RequestTypes = require(ReplicatedStorage.Flux.Shared.RequestTypes)

-- Initialize Module
function ClientModule.Init()
    
end