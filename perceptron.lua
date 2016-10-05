local neuron = {weights = nil, bias = nil, transfer_function}
local matrix = require "matrix"
local cmath = require "cmath"

function neurom:new(n_features, set_bias, set_transfer)
	local result ={}
	setmetatable(result,self)
	self.__index = self
	self.weights = matrix.one(n_features,1)
	self.bias = set_bias
	self.transfer_function = set_transfer
	return result
end

function neruron:activate(X)
	local result = (X * (self.weights)) + self.bias
	print(self.weights)
	local output = self.transfer_function(result)
	return output
end

return neuron