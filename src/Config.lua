-- Config.lua
-- @author: Dev_Cron

--[=[
	@class Config

	Contains all the configuration for the TrelloService.
]=]

export type TrelloConfig = {
	Token: string,
	Key: string,
}

local config: TrelloConfig = {
	Token = "",
	Key = "",
}

return config
