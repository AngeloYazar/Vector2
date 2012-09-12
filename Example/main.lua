local vector2 = require "vector2"

local A = vector2.new( 10, 10 )
local B = vector2.new( 20, 20 )

local C = A + B

if A > B then 
	print(A) 
else
	print(B)
end

print(C)

print( A:angle(B) )