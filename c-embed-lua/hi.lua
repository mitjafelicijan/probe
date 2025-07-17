local NL = "\n"    -- New line character
local HW = 70      -- Header width

local function header(title)
	print(NL .. string.rep("*", HW))
	print(string.format(" > %s", title))
	print(string.rep("*", HW) .. NL)
end

-- Loops and tables.

header("Loops and tables")

for i=1, 5 do
	print("- Loop with index " .. i)
end

local names = {
	"John",
	"Bob",
	"Grug",
}

for _, name in pairs(names) do
	print(string.format("* This create is called %s.", name))
end

-- Math stuff.

header("Math stuff")

print("Square root of 16:", math.sqrt(16))
print("Absolute value of -7:", math.abs(-7))
print("Ceiling of 2.3:", math.ceil(2.3))
print("Floor of 2.9:", math.floor(2.9))
print("Rounding 3.6:", math.floor(3.6 + 0.5))

print("Cosine of 0:", math.cos(0))
print("Sine of 90 degrees:", math.sin(math.rad(90)))

math.randomseed(os.time())
print("Random number (1-100):", math.random(1, 100))

print("2 to the power of 3:", math.pow(2, 3))
print("Natural log of 2.71828:", math.log(2.71828))
print("Base-10 log of 1000:", math.log10(1000))

print("Pi:", math.pi)
print("Convert 180 degrees to radians:", math.rad(180))
print("Convert Pi radians to degrees:", math.deg(math.pi))

-- Coroutines.

header("Coroutines")

function producer()
	return coroutine.create(function()
		for i = 1, 3 do
			print("Producing:", i)
			coroutine.yield(i)
		end
	end)
end

function consumer(prod)
	while true do
		local status, value = coroutine.resume(prod)
		if not status or value == nil then break end
		print("Consumed:", value)
	end
end

co = producer()
consumer(co)

function sneaky()
	print("Coroutine starts")
	coroutine.yield()  -- Pause and give control back.
	print("Coroutine resumes after yield")
end

co = coroutine.create(sneaky)

print("First resume:")
coroutine.resume(co)

print("Second resume:")
coroutine.resume(co)

-- IO stuff.

header("File IO")

print("Reading file adams.txt...\n")

local file = io.open("adams.txt", "r")
if not file then
	print("Failed to open file.")
	return
end

for line in file:lines() do
	print(line)
end

file:close()

-- Exposing C functions.

header("Exposing C functions")

local result = c_sum(3, 5)
print("Sum is", result)
