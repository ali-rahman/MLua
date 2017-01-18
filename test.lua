local matrix = require "matrix"
local statistics = require "statistics"
-- function cholesky(param)
-- 	local m=param.size[1]
-- 	local n=param.size[2]
-- 	local lower=matrix.new(n,n)
-- 	lower.mat[1][1]=math.sqrt(param.mat[1][1])
-- 	for i=2,n do
-- 		for k=1, i do
-- 			if(k==i) then
-- 				local sum=0
-- 				for j=1,(k-1) do
-- 					sum=sum+(lower.mat[k][j] * lower.mat[k][j])
-- 				end
-- 				lower.mat[k][k]=math.sqrt(param.mat[k][k]-sum)
-- 			else
-- 				local sum=0
-- 				for j=1,(k-1) do
-- 					sum=sum + (lower.mat[i][j]*lower.mat[k][j])
-- 				end
-- 				lower.mat[i][k]=(param.mat[i][k]-sum)/lower.mat[k][k]
-- 			end
-- 		end
-- 	end
-- 	return lower
-- end



A=toMatrix({{25,15,-5},{15,18,0},{-5,0,11}})
C=toMatrix({{18,22,54,42},{22,70,86,62},{54,86,174,134},{42,62,134,106}})
--print(C)
B=A:cholesky()
print(A)
print("Mean:")
m_mean = statistics.cov(A)
print(m_mean)




