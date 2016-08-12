local optim={}
local matrix = require "matrix"
local cmath = require "cmath"

function gradient_descent(X,target,weights,learning_rate)
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

local X = toMatrix{{2,-1},{3,2}}
local y = toMatrix({{14},{70}})
local theta = toMatrix{{0},{0}}
print("Weights:")
print(theta)
print("Iterations:")
for i=1,220 do
	theta = gradient_descent(X,y,theta,0.1)
	print("Iteration #".. i)
	print("Weights:")
	print(theta)
end

