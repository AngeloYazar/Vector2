--[[ Vector2 by Angelo Yazar ]]--
local math = math
local setmetatable = setmetatable
local assert = assert
local Vector2 = {}
setfenv(1, Vector2)
mt = {}
mt.__index = Vector2

function new( i, j )
	local v = { i, j }
	setmetatable( v, mt )
	return v
end

function get( a )
  return a[1], a[2]
end

function set( v, a, b )
	v[1], v[2] = a, b or v[2]
end

function add( a, b )
	return new( a[1]+b[1], a[2]+b[2] )
end

function sub( a, b )
	return new( a[1]-b[1], a[2]-b[2] )
end

function mul( a, b )
	return new( a[1]*b, a[2]*b )
end

function div( a, b )
	assert( b, "Vector2: Can't divide by 0" )
	return new( a[1]/b, a[2]/b )
end

function copy( a )
	return new( a[1], a[2] )
end

function dot( a, b )
	return a[1]*b[1] + a[2]*b[2]
end

function magnitude( a )
	return math.sqrt(a[1]^2 + a[2]^2)
end

function sqrMagnitude( a )
	return a[1]^2 + a[2]^2
end

function project( a, b )
	return b:mul( a:dot(b)/b:sqrMagnitude() )
end

function normalized( a )
	local m = a:magnitude()
	if m and m > 0 then return new(a[1]/m,a[2]/m)
	else return new(0,0,0) end
end

function normalize( a )
	local m = a:magnitude()
	if m then
		a[1] = a[1] / m
		a[2] = a[2] / m
	end
	return a
end

function clampMagnitude( a, maxLength )
	local m = a:magnitude()
	if m > maxLength then
		return  ( a:normalized() ):mul( maxLength )
	else return a:copy() end
end

function scale( a, s )
	a[1] = a[1] * s
	a[2] = a[2] * s
	return a
end

function angle( a, b )
	return math.deg( math.atan2(b[2]-a[2],b[1]-a[1]) )
end

function reflect( a, n )
	local nu = n:normalized()
	local anu = a:dot(nu) * 2
	nu:scale(anu)
	return new( -a[1]+nu[1], -a[2]+nu[2] )
end

function distance( a, b )
	return math.sqrt((b[1]-a[1])^2+(b[2]-a[2])^2)
end

function lerp( a, b, t )
	local t1 = 1-t
	return new( a[1]*t1+b[1]*t, a[2]*t1+b[2]*t )
end

function min( a, b )
	local i,j = a[1], a[2]
	if i > b[1] then i = b[1] end
	if j > b[2] then j = b[2] end
	return new(i,j)
end

function max( a, b )
	local i,j = a[1], a[2]
	if i < b[1] then i = b[1] end
	if j < b[2] then j = b[2] end
	return new(i,j)
end

local function sign( x )
	if x < 0 then 
		return -1
	else
		return 1
	end
end

function quadrant( a )
	return new(sign(a[1]),sign(a[2]))
end

function tostring ( a )
	return "Vector2: " .. a[1] .. ", " .. a[2]
end

mt.__add = add
mt.__sub = sub
mt.__mul = mul
mt.__div = div
mt.__tostring = tostring

mt.__le = function( a, b )
	return a:magnitude() <= b:magnitude()
end

mt.__lt = function( a, b )
	return a:magnitude() < b:magnitude()
end

mt.__eq = function( a, b )
	return ( a[1] == b[1] and a[2] == b[2] )
end

return Vector2