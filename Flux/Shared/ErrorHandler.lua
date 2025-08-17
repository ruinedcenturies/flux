local Handler = {}

local ErrorCodes = {
    [100] = "Unknown error occurred.",
    [101] = "Invalid arguments provided.",
    [102] = "Operation timed out.",
    [103] = "Unauthorized request.",

    [200] = "Remote not found in RemotesFolder.",
    [201] = "Failed to invoke server remote.",
    [202] = "Listener registration failed.",
    [203] = "Promise wrapper rejected unexpectedly.",

    [300] = "Handler not found for request.",
    [301] = "Validator failed for client request.",
    [302] = "Failed to process request in handler.",
    [303] = "Router could not route request.",

    [400] = "RemoteList is empty or missing entries.",
    [401] = "Config invalid or missing required fields.",
    [402] = "Remote instance type mismatch (expected RemoteEvent/RemoteFunction).",

    [500] = "Cache key not found.",
    [501] = "Failed to update cached value."
}

Handler.LogCache = {}
Handler.MaxCacheLength = 300

local function GetTimestamp()
    return os.date("%Y-%m-%d %H:%M:%S")
end

local function AddToCache(Entry)
    table.insert(Handler.LogCache, Entry)

    if #Handler.LogCache > Handler.MaxCacheLength then
        table.remove(Handler.LogCache, 1)
    end
end

function Handler.LogError(Code, ...)
    local Message = ErrorCodes[Code] or "Unknown error code: " .. tostring(Code)
    local Extras = {...}
    local FormattedExtras = ""

    if #Extras > 0 then
        for Index, Value in ipairs(Extras) do
            FormattedExtras = FormattedExtras .. tostring(Value)
            if Index < #Extras then
                FormattedExtras = FormattedExtras .. " | "
            end
        end
    end

    local LogEntry = {
        Type = "Error",
        Code = Code,
        Message = Message,
        Extra = FormattedExtras,
        Time = GetTimestamp()
    }

    AddToCache(LogEntry)
    warn("[Error][" .. LogEntry.Time .. "][" .. Code .. "] " .. Message .. (FormattedExtras ~= "" and " | " .. FormattedExtras or ""))
end

function Handler.LogWarning(...)
    local Extras = {...}
    local FormattedExtras = ""

    if #Extras > 0 then
        for Index, Value in ipairs(Extras) do
            FormattedExtras = FormattedExtras .. tostring(Value)
            if Index < #Extras then
                FormattedExtras = FormattedExtras .. " | "
            end
        end
    end

    local LogEntry = {
        Type = "Warning",
        Message = FormattedExtras,
        Time = GetTimestamp()
    }

    AddToCache(LogEntry)
    warn("[Warning][" .. LogEntry.Time .. "] " .. FormattedExtras)
end

function Handler.GetLogCache()
    return Handler.LogCache
end

function Handler.ClearLogCache()
    Handler.LogCache = {}
end

return Handler