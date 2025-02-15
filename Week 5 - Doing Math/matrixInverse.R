# Matrix A
A = matrix(1:100, nrow=10)

# Matrix B
B = matrix(1:1000, nrow=10)

#Transpose A and B  given a matrix or data.frame x, t returns the transpose of x. 
t(A)
t(B)

#create two vectors (a and b)
a <- 1:10
b <- 1:100

#multiply matrices by vectors
A %*% a
B %*% b

#re-assign the vectors a and b to equal the number of rows of the column for the corresponding matrix
a <- 1:ncol(A)
b <- 1:ncol(B)

#Multiply the matrix by a matrix
A %*% B



# Inverse of a matrix

# Create a square(2x2) matrix
S <- matrix(2:5, nrow=2)
S

# Calculate the determinant
# In a square matrix such as:
#   a  b
#   c  d
# The determinant is calculated as:
#   ad - bc
# So for our matrix:
#   2  4
#   3  5
# The determinant would be:
#   (2)(5) - (4)(3)
#   10 - 12
#   det = -2

# Verify with det
det(S)

# Because we have a non-zero determinant, the matrix is invertible

# The inverse can be found using solve()
solve(S)
