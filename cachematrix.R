# cachematrix.R
#
# R Programming Assignment 2: Lexical Scoping--caching the inverse of a matrix


# this fucntion creates a "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  invrs <- NULL
  set <- function(y){
    x <<- y
    invrs <<- NULL # inverse is  null at the start 
  }
  
get <- function() x 


  # set and get functions for the inverse
  setinvrs <- function(solve) invrs <<- solve
  getinvrs <- function() invrs
  list(set = set, get = get, 
       setinvrs = setinvrs, getinvrs = getinvrs)
}


# calculates  the inverse of the special "matrix" returned by function makeCacheMatrix 
# if the inverse has already been calculated, cachesolve  retrieves inverse from cache

cacheSolve <- function(x, ...) {
  invrs <- x$getinvrs()
  if(!is.null(invrs)){
    message("retrieving cached data")
    return(invrs)
  }
  data <- x$get()
  invrs <- solve(data, ...)  ## calculates the inverse
  x$setinvrs(invrs)
  invrs
}

