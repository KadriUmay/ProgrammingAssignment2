# Code for testing
# generate a random 5x5, non-singular matrix
MatUnit <- matrix(runif(25,1,100),5,5)
#run the code
MatUnitCached <- makeCacheMatrix(MatUnit)

# get from cache
testInv <- cacheSolve(MatUnitCached) #first one will take a long time
testInv <- cacheSolve(MatUnitCached)
testInv <- cacheSolve(MatUnitCached)
testInv <- cacheSolve(MatUnitCached)
testInv <- cacheSolve(MatUnitCached)