-- Methods.lua
-- @author: Dev_Cron

--[=[
    @class Methods

   
    This class has the main usage of HttpService the methods are used on the main class to retrieve data from the Trello API.

]=]

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
-- Constants
local Packages = ReplicatedStorage.Packages
-- Modules
local Promise = require(Packages.promise)

local Methods = {}
Methods.className = "Methods"

--[=[
    @private
]=]

function Methods:Get(Value: string)
	assert(typeof(Value) == "string", "Value must be a string")
	return Promise.defer(function(resolve, reject)
		local URL = HttpService:GetAsync(Value)
		local Data = HttpService:JSONDecode(URL);
		(Data and resolve or reject)(Data)
	end)
end

--[=[
    @private
]=]

function Methods:Post(...: any)
	local arg = ...
	if not arg then
		return
	end

	return Promise.new(function(resolve, reject)
		local ok, err = pcall(function()
			return HttpService:RequestAsync(arg)
		end)

		if not ok then
			return reject(err)
		end

		return resolve(err)
	end)
end

--[=[
    Sends HTTP send request that returns to Json and then converted into Lua table.

    @param Value T -- The data you want to retrieve from API. 
    @return table
]=]

function Methods:GetData<T>(Value: T): T
	self
		:Get(Value)
		:andThen(function(Data)
			return Data
		end)
		:catch(warn)
end

--[=[
    Sends an HTTP request using a dictionary to specify the request data.

    @param RequestBody table -- The data you want to send to API.
    @return true or false 
]=]

function Methods:SendData(RequestBody: table)
	self
		:Post(RequestBody)
		:andThen(function(Result)
			print("Methods: SendData: Result: ", Result)
		end)
		:catch(warn)
end

return Methods
