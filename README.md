MLua
===================

A cross platform 2D linear algebra and machine learning library written in pure Lua. MLua is suitable for use in Lua only SDKs such as Corona SDK and Gideros.

----------


Cheatsheet
-------------
**Creating a matrix:**
For creating a zero initialized matrix:

    local MatrixInstance = matrix.new(rows,columns)
To create a matrix out of the lua table passed:

    local MatrixInstance = toMatrix({25,34,12},{12,0,9.8}})
**Accessing Elements:**
Retrieving a single element:

    MatrixInstance.mat[row_number][column_number]
For retrieving a sub-matrix, bounded by the column and row parameters passed:

    MatrixInstance:subset({start_row, end_row},{start_column,end_column})

**Matrix Transpose**

    MatrixInstance:transpose()
will return the transpose of the matrix