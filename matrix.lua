local matrix={}
matrix.__index = matrix
--Metamethod for overloading the + operator for our metatable
matrix.__add = function(lhs,rhs)
	local t_m=lhs.size[1]
	local t_n=lhs.size[2]
	if(t_m==rhs.size[1] and t_n==rhs.size[2]) then
		local sum=matrix.new(t_m,t_n)
		for i=1,t_m do
			for j=1,t_n do
				sum.mat[i][j]=lhs.mat[i][j] + rhs.mat[i][j]
			end
		end
		return sum
	else
		print("Input matrices have size mismatch")
		return nil
	end
end
--Metamethod for overloading the - operator for our metatable
matrix.__sub = function(lhs,rhs)
	local t_m=lhs.size[1]
	local t_n=lhs.size[2]
	if(t_m==rhs.size[1] and t_n==rhs.size[2]) then
		local sum=matrix.new(t_m,t_n)
		for i=1,t_m do
			for j=1,t_n do
				sum.mat[i][j]=lhs.mat[i][j] - rhs.mat[i][j]
			end
		end
		return sum
	else
		print("Input matrices have size mismatch")
		return nil
	end
end
--Metamethod for overloading the * operator for our metatable
matrix.__mul = function(mat1,mat2)
	local m1=mat1.size[1]
	local n1=mat1.size[2]
	local m2=mat2.size[1]
	local n2=mat2.size[2]
	if(n1==m2) then
		local result=matrix.new(m1,n2)
		--local square_check=isPowerofTwo(m1)
		for i=1, m1 do
			for j=1,n2 do
				for k=1,m2 do
					result.mat[i][j] = result.mat[i][j]+(mat1.mat[i][k] * mat2.mat[k][j])
				end
			end
		end
		return result
	else
		print("Dimension mismatch for matrix multiplication")
		return nil
	end
end

matrix.__concat = function(mat1,mat2)

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
function matrix.element(self,tab1)
	result=self.mat[tab1[1]][tab1[2]]
	return result
end

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

local X=matrix.new(2,2)
local Y=matrix.new(2,2)
X.mat[1][1]=9
Y.mat[2][2]=8
Y.mat[1][1]=4
local Z=X*Y
local A=matrix.one(2,8)
print("A=")
print(A)
local B=Z*A
print("B=")
print(B)
local C=B:subset({1,2},{3,3})
local E=matrix.eye(5)
print("Matrix E:")
print(E)
