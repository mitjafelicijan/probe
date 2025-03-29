-- Naive recursive implementation to increase the time of computation.
function fibonacci(n)
    if n == 0 then
        return 0
    elseif n == 1 then
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end

local n = 40
local result = fibonacci(n)
print("The " .. n .. "th Fibonacci number is: " .. result)

