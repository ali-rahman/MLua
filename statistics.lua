local matrix = require "matrix"
local statistics = {}

function statistics.mean(parameter)
	local mean = matrix.new(1,parameter.size[2])
	for j = 1, parameter.size[2] do
		for i = 1, parameter.size[1] do
			mean.mat[1][j] = mean.mat[1][j] + parameter.mat[i][j]
		end
	end
	mean = mean/parameter.size[1]
	return mean
end

function statistics.variance(parameter)
	local var = matrix.new(1,parameter.size[2])
	local mean = statistics.mean(parameter)
	local sum_dev = matrix.new(1,parameter.size[2])
	local temp = 0
	for i = 1, parameter.size[1] do
		for j =1, parameter.size[2] do
			temp = parameter.mat[i][j] - mean.mat[1][j]
			temp = temp * temp
			sum_dev.mat[1][j] = sum_dev.mat[1][j] + temp
		end
	end
	var = sum_dev/parameter.size[1]
	return var
end

function statistics.covariance(X,Y)
	local result = statistics.mean(X:transpose()*Y)-(statistics.mean(X)*statistics.mean(Y):transpose())
	return result
end

function statistics.cov(X)
	local m = X.size[1]
	local n = X.size[2]
	local cov_m = matrix.new(n,n)
	for i=1,n do
		for j=1,n do
			if(i==j) then
				cov_m.mat[i][j]=statistics.variance(X:subset({1,m},{i,i})).mat[1][1]
				
			else
				cov_m.mat[i][j]=statistics.covariance(X:subset({1,m},{i,i}), X:subset({1,m},{j,j})).mat[1][1]
				cov_m.mat[j][i] = cov_m.mat[i][j]
			end
		end
	end
	return cov_m
end

return statistics
