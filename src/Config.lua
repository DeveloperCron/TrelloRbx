-- Config.lua
-- @author: Dev_Cron

--[=[
	@class Config
	@server

	Contains all the configuration for the TrelloService. here you put the user Token and key.
	:::caution
	Don't leak your token! Leaking your token allows anyone to use your account.
	Also don't try to share this module to the Client side, do so for your own risk
	:::
]=]

--[=[
	@interface TrelloConfig 
	@within Config

	.Key string -- The key of the Trello account.
	.Token string -- The token of the Trello account.

	A table that describe the Trello configuration.
]=]

export type TrelloConfig = {
	Token: string,
	Key: string,
}

local config: TrelloConfig = {
	Token = "",
	Key = "",
}

table.freeze(config)
return config
