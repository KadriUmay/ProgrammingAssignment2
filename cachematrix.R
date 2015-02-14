# this function emulates a C# property with a static hashtable 
# 4 member functions: setter and getter for key which is a matrix
# in this case, setInv and getInv which is the value 
# the <<- operator which can be used to assign a value to an object 
# in an environment that is different from the current environment
# emulates the object orientedness for implementing a static cache
# with a singleton pattern

makeCacheMatrix <- function(x = matrix()) {
  
  tmpInv <- NULL # temp variable to store result of inversion
  #setter to store the input matrix in the cache, key
  set <- function(y) {
    x <<- y
    tmpInv <<- NULL # instantiate temp variable as null
  }
  
  get <- function() x # getter for the input matrix, key
  
  setInv <- function(inv) tmpInv <<- inv # set the inverse matrix to the cache, value
  
  getInv <- function() tmpInv # return the inversed matrix, value
  
  # return a list that contains the setters and getters
  # this is a template function to enable the $ notation to be used
  # ht <- makeCacheMatrix(blah)
  # x$set(blah)
  # x$get
  # x$setInv
  # x$getInv
  
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


cacheSolve <- function(x, ...) {
  m <- x$getInv() # get the inverse matrix
  if(!is.null(m)) { # if the inverse exists in cache, return from cache
    message("Cache Hit!")
    return(m)
  }
  data <- x$get() # not in cache, read the matrix object
  m <- solve(data)  # get the inverse of the matrix, 
                    # solve is a peculiar name for matrix inverse function
  x$setInv(m) # cache the result
  message("Cache Miss!")
  m # return the result
}

