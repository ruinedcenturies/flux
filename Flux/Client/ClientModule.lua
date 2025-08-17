local ClientModule = {}

-- Variables/Dependencies
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Flux = ReplicatedStorage:WaitForChild("Flux")
local Config = require(Flux.Shared.FluxConfig)
local Shared = require(Flux.Shared.RemoteList)
local RequestTypes = require(Flux.Shared.RequestTypes)
local Listener = require(Flux.Client.Listener)
local PromiseWrapper = require(Flux.Client.PromiseWrapper)

-- Initialize Module
function ClientModule.Init()
    -- Cache remotes
    for Name, RemoteName
end