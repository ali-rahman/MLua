local matrix = require "matrix"
local statistics = require "statistics"

A=toMatrix({{25,15,-5},{15,18,0},{-5,0,11}})
B=toMatrix({{18,22,54,42},{22,70,86,62},{54,86,174,134}})
print("Matrix A:")
print("Size" .. A.size[1] .. '\t' .. A.size[2])
print(A)

print("Matrix B:")
print("Size" .. B.size[1] .. '\t' .. B.size[2])
print(B)

C=A:cholesky()
print("Cholesky Decomposition of Matrix A")
print(C)
D = statistics.cov(B)
print("Covariance Matrix of B")
print(D)

