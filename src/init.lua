-- init.lua
-- @author: Dev_Cron

--[[
    @class TrelloRbx
]]

local TrelloRbx = {}
TrelloRbx.ClassName = "TrelloRbx"
TrelloRbx.__index = TrelloRbx

function TrelloRbx.init()
	return setmetatable({
		Board = nil,
		List = nil,
	}, TrelloRbx)
end

function TrelloRbx.is(Object: any): boolean
	return type(Object) == "table" and getmetatable(Object) == TrelloRbx
end

function TrelloRbx:GetBoard() end

function TrelloRbx:GetList() end

function TrelloRbx:GetCards() end

return TrelloRbx
