## Put comments here that give an overall description of what your
## functions do

## Becuase finding inverse of a matric is compute intensive you
## probably should try and keep a cheched copy to check first and 
## possibly avoid an unecessary re-calculation 

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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
