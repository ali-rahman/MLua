local perceptron={weights = nil, bias = nil, activation_function}
--perceptron.__index = perceptron
local matrix = require "matrix"
local cmath = require "cmath"

function perceptron:new(n_features, set_bias, set_activation)
	local result ={}
	setmetatable(result,self)
	self.__index = self
	self.weights = matrix.one(n_features,1)
	self.bias = set_bias
	self.activation_function = set_activation
	return result
end

function perceptron:activate(X)
	local result = (X * (self.weights)) + self.bias
	print(self.weights)
	local output = self.activation_function(result)
	return output
end
--[[
local input = matrix.new(4,3)
local neuron = perceptron.new(3,5,cmath.sigmoid)

local y = perceptron:activate(input)
--print(type(input))
--print(type(neuron.weights))
print(y)
]]--
return perceptron