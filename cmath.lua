--[[This module allows you to perform common mathematical operations on matrices.]]
local matrix = require "matrix"
local cmath={}

--Calculates and returns the natural log of input parameter
function cmath.log(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.log(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.log(parameter)
	end
end

--Calculates and returns log base 10 of input parameter
function cmath.log10(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.log10(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.log10(parameter)
	end
end

--Calculates and returns exponential of input parameter
function cmath.exp(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.exp(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.exp(parameter)
	end
end

--Calculates and returns the magnitude of input parameter
function cmath.abs(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.abs(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.abs(parameter)
	end
end

--Calculates and returns the arc cosine of input parameter in radians in the range [0 pi]
function cmath.acos(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.acos(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.acos(parameter)
	end
end

--Calculates and returns the arc sine of input parameter in radians in the range [0 pi]
function cmath.asin(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.asin(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.asin(parameter)
	end
end

--Calculates and returns the arc tangent of input parameter in radians in the range [-pi pi]
function cmath.atan(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.atan(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.atan(parameter)
	end
end

--Calculates and returns the sine of input parameter
function cmath.sin(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.sin(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.sin(parameter)
	end
end

--Calculates and returns the cosine of input parameter
function cmath.cos(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.cos(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.cos(parameter)
	end
end

--Calculates and returns the tangent of input parameter
function cmath.tan(parameter)
	local ty=type(parameter)
	if(ty=="table") then
		local result = matrix.new(parameter.size[1],parameter.size[2])
		for i=1, parameter.size[1] do
			for j=1, parameter.size[2] do
				result.mat[i][j]=math.tan(parameter.mat[i][j])
			end
		end
		return result
	else
		return math.tan(parameter)
	end
end

return cmath