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
function optim.cost_mse(X,target,weights)
	local disparity = (X * weights) - target
	local sum_dis = (cmath.sum(cmath.pow(disparity,2)))/X.size[1]
	return sum_dis
end

function optim.cost_LOGISTIC(X, target, weights)
	local hypothesis = X * target
	local hypothesis_com = 1 - hypothesis
	local term_1 = y:hadamardProduct(hypothesis)
	local term_2 = (1 - y)
	term_2 = term_2:hadamardProduct(hypothesis_com)
	local sum =cmath.sum((term_1 + term_2))
	sum = sum/X.size[1]
	return sum
end


math.randomseed(os.time())
local X = toMatrix{{2,-1},{3,2}}
local y = toMatrix({{14},{70}})
local theta = math.random(10,200) * matrix.random(2,1)
-- local X = matrix.random(1000,5)
-- local y = matrix.random(1000,1)
-- local theta = matrix.one(5,1)
print("Weights:")
print(theta)
print("Iterations:")
for i=1,50 do
	theta = optim.gradient_descent(X,y,theta,0.075)
	cost = optim.cost_mse(X,y,theta)
	print("Iteration #".. i)
	print("Cost:")
	print (cost)
	print("Weights:")
	print (theta)		
end
