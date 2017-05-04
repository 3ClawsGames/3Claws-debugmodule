--[[
DEBUG MODULE/CLASS FOR TERMINAL OUTPUT 
WHEN DEALING WITH SUBTILE BUGS AND SHIT.

FREE TO USE FOR ANYONE
HENDRIX © 3 CLAWS GAMES
--]]

-- VARIABLES --------------------------
_G.debugMode = 0 

-- PUT THIS CHUNK WHERE YOU LIKE IN ANY PART OF YOUR CODE AND CLASSES, IT IS VISIBLE EVERYWHERE ---
if _G.debugMode == 1 then
	-- do shit like i.e. audio.setVolume = 0 if you like to listen to Spotify when coding
	-- and you are sick tired of the game sound when debuging :)
else
	--do default shit
end 




-- FUNCTIONS ---- ( ALL FUNCTIONS ARE GLOBAL AND VISIBLE TO ALL SCOPES IN THE PROJECT ) ------------
function printClasses()
	print("@@@@@@@@@@@@@@@@@@CLASSES@@@@@@@@@@@@@@@@@@@")
	for k,v in pairs(_G.package.loaded) do
		print(k,v)
	end
	print("@@@@@@@@@@@@@@@@@@CLASSES@@@@@@@@@@@@@@@@@@@")
end

function deleteClass(class)
	if package.loaded[class] then
		package.loaded[class] = nil
		print("**** Removed class: " .. class, " ******")
	end
end

function henDebuggerFunc(param, delete) 
	local delete = _G.paramDelete
	print("\n*************************\n*** DEBUGGER FUNCTION ***\n*************************")
	print("\n\n***Checking for Runtime objects***")
	
	if _G.henDebugger == true then				--If the debugger is turned on
		
		for k, v in pairs(_G.display) do		-- First we check for critical non deleted RuntimeObjects
			print( "•• Media lib   " .. k, v )
		end

		if nil ~= param then					-- If there is an Object(param in ths case)...
			print("\n***Checking for user inputs of objects")
			print( "ParamType is ", param.type ) -- We first just print out the Object type
		end	
		if nil ~= param and delete == true then -- Set this to true if you like to delete the objects ...default is false
				param:removeSelf()
				param = nil
				print( param, "removed" )
			else
				print( param, "\n***The user object is not present" )

		--	return _G.paramDelete				-- Returning the value of paramDelete for next time
		end
		print("\n*************************\n*** DEBUGGER END ***\n*************************")
	end	
	return true
end

--[[ 
-- FOR LISTING THE FONTS AVAILABLE TO USE IN PROJECTS AND GETTING THE 'RIGHT' NAMES
local sysFonts = native.getFontNames() 
for k,v in pairs(sysFonts) do print(v) end
--]]