
## Because finding inverse of a matrix is compute intensive you
## probably should try and keep a cheched copy to check first and 
## avoid an unecessary re-calculation where possible

## you need to pass it a matrix, one that can be inversed
## makeCacheMatrix accepts the matrix and establishes the
## set, get, setinverse and getinverse parameters
makeCacheMatrix <- function(x = matrix()) {
## set the value of the matrix
    k <- NULL
    set <- function(y) {
        x <<- y
        k <<- NULL
    }
## get the value of the matrix
    get <- function() x

## set the inverse of the matrix
    setinverse <- function(solve) k <<- solve
    getinverse <- function() k

## get the inverse of the matrix
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
     
 }

## Computes the inverse of the matrix returned by makeCacheMatrix()
## unless the inverse has already been calculated, in which case it
## retrieves it from the cache.

cacheSolve <- function(x, ...) {
  
## get the inverse of the matrix        
    k <- x$getinverse()
  
## check if there is the matrix in k    
    if(!is.null(k)) {
        message("getting cached data")
        return(k)
    }
## if not: get the inverse of the matrix and load into k   
    data <- x$get()
    k <- solve(data, ...)
## set the inverse of the matrix (uses the solve function)
    x$setinverse(k)
    k
}
