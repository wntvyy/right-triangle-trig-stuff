--[[

Simple Right Triangle Generator
Author: wntvy

Creates a right triangle and then solves the angles. A little flawed but works 99% of the time.

Used to prove accuracy of values:
https://www.desmos.com/calculator
https://www.omnicalculator.com/math/right-triangle-side-angle

--]]

math.randomseed(os.clock()*10000000000)

local random1 = -100
local random2 = 100

function returnNumber()
return math.random(random1, random2)
end

function distance(x1, x2, y1, y2)
local solve1 = x2-x1
local solve2 = y2-y1

local square1 = solve1^2
local square2 = solve2^2

local add = square1+square2

local root = math.sqrt(add)
return root
end
  
function returnRightTriangle()
local checkDistance1
local checkDistance2
local checkDistance3
    
local pointA = {
    returnNumber(), returnNumber()
}
local pointB = {
   returnNumber(), pointA[2]
}
local pointC = {
   pointA[1], returnNumber()
}
return pointA, pointB, pointC
end

function convertRadToDeg(val)
    local formulapt1 = 180/math.pi
    local formulapt2 = formulapt1 * val
    return formulapt2
end

function solve()
local distanceTable = {}
    
local a,b,c = returnRightTriangle()
local distance1 = distance(a[1], b[1], a[2], b[2])
local distance2 = distance(b[1], c[1], b[2], c[2])
local distance3 = distance(c[1], a[1], c[2], a[2])

local pyt1 = distance1
local pyt2 = distance2
local pyt3 = distance3

-- sort values lowest to highest

table.insert(distanceTable, pyt1)
table.insert(distanceTable, pyt2)
table.insert(distanceTable, pyt3)

table.sort(distanceTable, function(a,b)
    return (a>b)
end)

local firstVal = distanceTable[3]
local secondVal = distanceTable[2]
local thirdVal = distanceTable[1]

-- solve angles

local angleA_Deg = 90

local angleB_Rad = math.asin(secondVal/thirdVal)
local angleB_Deg = convertRadToDeg(angleB_Rad)

local angleC_Rad = math.asin(firstVal/thirdVal)
local angleC_Deg = convertRadToDeg(angleC_Rad)

-- solve area

local areapt1 = firstVal*secondVal
local areapt2 = areapt1/2

-- print results

print("Angle A: " .. angleA_Deg, "Angle B: " ..  angleB_Deg, "Angle C: " .. angleC_Deg)
print("Side A: " .. firstVal, "Side B: " .. secondVal, "Side C: " .. thirdVal)
print("Coordinates: " .. "a(" .. tostring(a[1]) .. "," .. tostring(a[2]) .. ")", "b(" .. tostring(b[1]) .. "," .. tostring(b[2]) .. ")", "c(" .. tostring(c[1]) .. "," .. tostring(c[2]) .. ")")
print("Pythagorean Theorem: " .. firstVal .. "^2 + " .. secondVal .. "^2 = " .. thirdVal .. "^2")
print("Area: " .. areapt2)
print("Perimeter: " .. firstVal+secondVal+thirdVal)
end

solve()
