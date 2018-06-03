# Coursera

## This function:
# receives a matrix as argument
# returns a list with:
#   4 functions
#   1 "hidden" matrix (the one passed as argument)
#   1 "hidden" indicator: m

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function:
# receives as argument the list created by the previous function.
# calculates the inverse of the matrix,
# stores this result at the list passed as argument,
# returns the inverse of the hidden matrix.    
# Whats going on? 
# For the first time the list (special matrix) is passed as argumento to this function
# the function computes de inverse and stores the result.   
# Other times, the function just brings back the stores results.   
# This prevents do the same calculations.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}

