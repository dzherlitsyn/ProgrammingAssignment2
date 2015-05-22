## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	## Create a special "matrix" object that can cache its inverse as the list of functions
	
  m <- NULL

  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  sets <- function(solve) m <<- solve
  gets <- function() m
  list(set = set, get = get,
       sets = sets,
       gets = gets)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' 

  m <- x$gets()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$sets(m)
  m
}
