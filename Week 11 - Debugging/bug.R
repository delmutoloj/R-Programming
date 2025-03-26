# The code below contains a 'deliberate' bug!  
# Error: unexpected symbol in:
#   "  for (i in 1:nrow(x))
#   { outlier.vec[i] <- all(outliers[i,]) } return"
tukey_multiple <- function(x) {
  outliers <- array(TRUE,dim=dim(x))
  for (j in 1:ncol(x))
  {
    outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
  }
  outlier.vec <- vector(length=nrow(x))
  for (i in 1:nrow(x))
  { outlier.vec[i] <- all(outliers[i,]) }return(outlier.vec) }


# It looks like the return statement wants to be on a new line so ill try that.

tukey_multiple <- function(x) {
  outliers <- array(TRUE,dim=dim(x))
  for (j in 1:ncol(x))
  {
    outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
  }
  outlier.vec <- vector(length=nrow(x))
  for (i in 1:nrow(x))
  { outlier.vec[i] <- all(outliers[i,]) }
  return(outlier.vec) } # Moved return statement to new line

# Starting the return statement on a new line allows the function to be added
# to the global environment without any errors.
