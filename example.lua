--[[ 
	These are some examples showing how to use the vector2 object.
	For these examples A, B and C are vector2 objects.
]]

local vector2 = require "vector2"

--[[ Instantiation ]]--
local A = vector2.new( 10, 10 )
local B = vector2.new( 20, 20 )
local C = B:copy()

--[[ Get Set ]]--
A:set(15, 15)
local u, v = A:get()

--[[ Basic operations ]]--
C = A + B
C = A - B
C = A * 10
C = A / 2

--[[ Vector operartions ]]--
A:normalize()				-- Normalize A
C = A * B:magnitude()		-- Scale A to the Magnitude of B
C = A:dot(B)				-- Dot product
C = A:project(B)			-- Project A on to B
C = A:reflect(B)			-- Reflect A across B
C = A:distance(B)			-- The distance between A and B
local theta = A:angle(B)	-- Get the angle between A and B

-- These can also be written in this form:
C = vector2.distance(A,B)

--[[ Some other operations ]]--

C = vector2.min(A,B) 		-- Return a vector with the samllest components of A and B
C = vector2.max(A,B)		-- Return a vector with the largest components of A and B
C = vector2.lerp(A,B, 0.5)	-- Return a vector between A and B
C = A:quadrant()			-- Return a vector that represents the quadrant of A

--[[ Comparison ]]--
if A > B then 
	-- A has a larger magnitude than B 
end

if A < B then 
	-- A has a smaller magnitude than B 
end

if A == B then 
	-- the components of A are exactly the same as the components of B 
end

print( C )				-- Prints the contents of A.

--[[ Example Usage ]]--
local function lookAt( object, target ) -- Assuming Corona sdk
	local A = vector2.new( object.x, object.y )
	local B = vector2.new( target.x, target.y )
	object.rotation = A:angle(B)
end

