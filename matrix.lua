local matrix={}
matrix.__index = matrix

function matrix_scalar_multiplication(mat1,scalar)
	local m=mat1.size[1]
	local n=mat1.size[2]
	local result = matrix.new(m,n)
	for i=1, m do
		for j=1,n do
			result.mat[i][j]=mat1.mat[i][j]*scalar
		end
	end
	return result
end

function matrix_scalar_addition(mat1,scalar)
	local m=mat1.size[1]
	local n=mat1.size[2]
	local result = matrix.new(m,n)
	for i=1, m do
		for j=1,n do
			result.mat[i][j]=mat1.mat[i][j]+scalar
		end
	end
	return result
end
function matrix_scalar_subtraction(mat1,scalar)
	local m=mat1.size[1]
	local n=mat1.size[2]
	local result = matrix.new(m,n)
	for i=1, m do
		for j=1,n do
			result.mat[i][j]=mat1.mat[i][j]-scalar
		end
	end
	return result
end

function matrix_scalar_division(mat1,scalar)
	local m = mat1.size[1]
	local n = mat1.size[2]
	local result = matrix.new(m,n)
	for i=1, m do
		for j=1, n do
			result.mat[i][j] = mat1.mat[i][j]/scalar
		end
	end
	return result
end

--Metamethod for overloading the + operator for our metatable
matrix.__add = function(lhs,rhs)
	local sum
	if((type(lhs)=="table") and (type(rhs)=="table")) then
		local t_m=lhs.size[1]
		local t_n=lhs.size[2]
		assert((t_m==rhs.size[1] and t_n==rhs.size[2]),"Input matrices have size mismatch")
		sum=matrix.new(t_m,t_n)
		for i=1,t_m do
			for j=1,t_n do
				sum.mat[i][j]=lhs.mat[i][j] + rhs.mat[i][j]
			end
		end
	else
		if(type(lhs)=="table" and type(rhs)~="table") then
			sum=matrix.new(lhs.size[1],lhs.size[2])
			sum=matrix_scalar_addition(lhs,rhs)
		elseif((type(lhs)~="table") and (type(rhs)=="table")) then
			sum=matrix.new(rhs.size[1],rhs.size[2])
			sum=matrix_scalar_addition(rhs,lhs)
		end
	end
	return sum
end
--Metamethod for overloading the - operator for our metatable
matrix.__sub = function(lhs,rhs)
	local sum
	if((type(lhs)=="table") and (type(rhs)=="table")) then
		local t_m=lhs.size[1]
		local t_n=lhs.size[2]
		assert((t_m==rhs.size[1] and t_n==rhs.size[2]),"Input matrices have size mismatch")
		sum=matrix.new(t_m,t_n)
		for i=1,t_m do
			for j=1,t_n do
				sum.mat[i][j]=lhs.mat[i][j] - rhs.mat[i][j]
			end
		end
	else
		if(type(lhs)=="table" and type(rhs)~="table") then
			sum=matrix.new(lhs.size[1],lhs.size[2])
			sum=matrix_scalar_subtraction(lhs,rhs)
		elseif((type(lhs)~="table") and (type(rhs)=="table")) then
			sum=matrix.new(rhs.size[1],rhs.size[2])
			sum=matrix_scalar_subtraction((-1*rhs),(-1*lhs))
		end
	end
	return sum
end

--Metamethod for overloading the * operator for our metatable
matrix.__mul = function(mat1,mat2)
	local result
	if((type(mat1)=="table") and (type(mat2)=="table")) then
		local m1=mat1.size[1]
		local n1=mat1.size[2]
		local m2=mat2.size[1]
		local n2=mat2.size[2]

		assert(n1==m2,"Dimension mismatch for matrix multiplication")
		result=matrix.new(m1,n2)
		--local square_check=isPowerofTwo(m1)
		for i=1, m1 do
			for j=1,n2 do
				for k=1,m2 do
					result.mat[i][j] = result.mat[i][j]+(mat1.mat[i][k] * mat2.mat[k][j])
				end
			end
		end
	else
		if(type(mat1)=="table" and type(mat2)~="table") then
			result=matrix.new(mat1.size[1],mat1.size[2])
			result=matrix_scalar_multiplication(mat1,mat2)
		elseif((type(mat1)~="table") and (type(mat2)=="table")) then
			result=matrix.new(mat2.size[1],mat2.size[2])
			result=matrix_scalar_multiplication(mat2,mat1)
		end
	end
	return result
end

matrix.__div = function(lhs,rhs)
	local t1 = type(lhs)
	local t2 = type(rhs)
	local result
	assert(not((t1=="table") and (t2=="table")), "Division among matrices cannot be performed since matrix inversion has not been implemented.")
	if(t1=="table" and t2~="table") then
		result = matrix.new(lhs.size[1],lhs.size[2])
		result = matrix_scalar_division(lhs,rhs)
	elseif(t1~="table" and t2=="table") then
		result = matrix.new(rhs.size[1],rhs.size[2])
		result = matrix_scalar_division(rhs,lhs)
		for i=1 ,result.size[1] do
			for j=1, result.size[2] do 
				result.mat[i][j] = math.pow(result.mat[i][j],-1)
			end
		end
	end
	return result
end

matrix.__concat = function(mat1,mat2)
	assert(mat1.size[1]==mat2.size[1],"Horizontal concatenation failed. Matrices should have equal number of rows.")
	local result = matrix.new(mat1.size[1],mat1.size[2]+mat2.size[2])
	for i=1,result.size[1] do
		for j=1,mat1.size[2] do
			result.mat[i][j] = mat1.mat[i][j]
		end
		for j=1,mat2.size[2] do
			result.mat[i][j+(mat1.size[2])] = mat2.mat[i][j]
		end
	end
	return result
end

matrix.__tostring = function(mat1)
	local str=""
	for i=1, mat1.size[1] do
		for j=1, mat1.size[2] do
			str=str .. "\t" .. mat1.mat[i][j]
		end
		str=str .. "\r" .. "\n"
	end
	return str
end
--Creates a matrix of m x n dimensions. Elements are set to zero
function matrix.new(m,n)
	local self=setmetatable({},matrix)
	self.size={m,n}
	self.mat={}
	for i=1,m do
		self.mat[i]={}
		for j=1,n do
			self.mat[i][j]=0
		end
	end
	return self
end
function  matrix.random(m,n)
	local self=setmetatable({},matrix)
	self.size={m,n}
	self.mat={}
	for i=1,m do
		self.mat[i]={}
		for j=1,n do
			self.mat[i][j]=math.random()
		end
	end
	return self
end
--Creates a matrix of m x n dimensions with all elements set to 1.
function matrix.one(m,n)
	local self=setmetatable({},matrix)
	self.size={m,n}
	self.mat={}
	for i=1,m do
		self.mat[i]={}
		for j=1,n do
			self.mat[i][j]=1
		end
	end
	return self
end
--Creates an identity matrix of dimensions m x m.
function matrix.eye(m)
	local self=setmetatable({},matrix)
	self.size={m,m}
	self.mat={}
	for i=1,m do
		self.mat[i]={}
		for j=1,m do
			if i==j then
				self.mat[i][j]=1
			else
				self.mat[i][j]=0
			end
		end
	end
	return self
end
--Function to provide alternate syntax for returning a matrix element
function matrix.element(self,tab1)
	result=self.mat[tab1[1]][tab1[2]]
	return result
end
--Returns sub-matrix based on input row and column ranges
function matrix.subset(self,m,n)
	local d_row=(m[2]-m[1])+1
	local d_col=(n[2]-n[1])+1
	local result=matrix.new(d_row,d_col)
	for i=1,(d_row) do
		for j=1, (d_col) do
			result.mat[i][j]=self.mat[m[1]+(i-1)][n[1]+(j-1)]
		end
	end
	return result
end
function matrix.transpose(self)
	local m=self.size[2]
	local n=self.size[1]
	local t=matrix.new(m,n)
	for i=1,m do
		for j=1,n do
			t.mat[i][j]=self.mat[j][i]
		end
	end
	return t
end

function isPowerofTwo(n)
	while ((n%2==0) and n>1) do
		n=n/2
	end
	if n==1 then
		return true
	else
		return false
	end
end

--Function for converting passed table into a matrix.
function toMatrix(param)
	assert((type(param)=="table"), "Input argument is not a table")
	local m=#param
	local n_bench=#param[1]
	local result = matrix.new(m,n_bench)
	local n
	for i=1, m do
		n=#param[i]
		assert(n==n_bench,"Table rows have an unequal number of elements")
		for j=1, n do
			result.mat[i][j]=param[i][j]
		end
	end
	return result
end


--[[
local A={{2,3,4},{1,2,3},{5,6,7}}
local B=toMatrix(1)
print(B)
]]--

return matrix