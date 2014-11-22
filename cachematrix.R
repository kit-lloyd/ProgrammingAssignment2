
## Because finding inverse of a matrix is compute intensive you
## probably should try and keep a cheched copy to check first and 
## avoid an unecessary re-calculation where possible

## you need to pass it a matrix, one that can be inversed
## makeCacheMatrix accepts the matrix and establishes the
## set, get, setinverse and getinverse parameters
makeCacheMatrix <- function(x = matrix()) {

## k will be the inverse, set to NULL by makeCacheMatrix
    k <- NULL
    set <- function(y) {
        x <<- y
        k <<- NULL
    }
    
## note these next three functions are defined but not run when makeCacheMatrix is called.
## instead, they will be used by cachesolve() to get values for x or for
## k (solve) and for setting the inverse.  These are usually called object 'methods'

## this function returns the value of the original vector
    get <- function() x

## this is called by cacheSolve() during the first cacheSolve()
##  access and it will store the value using superassignment
    setinverse <- function(solve) k <<- solve
    
## this will return the cached value to cacheSolve() on subsequent accesses
    getinverse <- function() k

## This is accessed each time makeCacheMatrix() is called
## This is a list of the internal functions ('methods') so a calling function
## knows how to access those methods.
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
     
 }

## Computes the inverse of the matrix returned by makeCacheMatrix()
## unless the inverse has already been calculated, in which case it
## retrieves it from the cache.

## the input x is an object created by makeCacheMatrix

cacheSolve <- function(x, ...) {
  
## accesses the object 'x' and gets the value of the inverse        
    k <- x$getinverse()
  
## check if there is the matrix in k (ie already cached)
## and send a message to console if it is
    if(!is.null(k)) {
        message("getting cached data")
        return(k)
    }
## we reach this code only if x$getinverse() returned NULL
## get the inverse of the matrix and load into k   
    data <- x$get()
    k <- solve(data, ...)
## store the calculated inverse value in x 
## (see setinverse() in makeCacheMatrix
    x$setinverse(k)
## return the inverse to the code that called this function
    k
}
