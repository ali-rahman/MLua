local optim={}
local matrix = require "matrix"
local cmath = require "cmath"

function optim.gradient_descent(X,target,weights,learning_rate)
	local m = X.size[1]
	local n = X.size[2]
	local updated_weights = matrix.new(weights.size[1],weights.size[2])
	local X_t = X:transpose()
	local scaling_factor = learning_rate/m
	local disparity = (X*weights) - target
	local descent = scaling_factor * (X_t * disparity)
	updated_weights = weights - descent
	return updated_weights
end
math.randomseed(16)
--local X = toMatrix{{2,-1},{3,2}}
--local y = toMatrix({{14},{70}})
--local theta = toMatrix{{0},{0}}
local X = matrix.random(1000,5)
local y = matrix.random(1000,1)
local theta = matrix.one(5,1)
print("Weights:")
print(theta)
print("Iterations:")
for i=1,10 do
	theta = optim.gradient_descent(X,y,theta,0.075)
	--print("Iteration #".. i)
	--print("Weights:")
	--print(theta)
end

--print("Disparity:")
--print((X*theta)-y)

local A=matrix.eye(2)
local B = A + matrix.one(2,2)
print(B)
local xc =2
print((xc/B))
print(cmath.pow(B,-2))