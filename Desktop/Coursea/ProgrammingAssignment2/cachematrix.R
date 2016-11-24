## Those two following functions allow to create a special object which stores 
## a matrix and caches its inverse.

## makeCacheMatrix creates a list containing a function to set the value of the 
## matrix,to get the value of the matrix, to set the inverse of the matrix and
## to get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
                s <- NULL
                set <- function(y) {
                        x <<- y                 
                        s <<- NULL              
                        }
                get <- function() x
                setsolv <- function(solve){
                                s <<- solve   
                                }
                getsolv <- function() s
                list(set = set, get = get,
                        setsolv = setsolv,
                        getsolv = getsolv)
}


## cacheSolve use the list created by makeCacheMatrix to etablish the inverse of 
## the matrix. If the inverse has already been calculated (and the matrix has 
## not changed), that fucntion retrieve the inverse from the cache. 

cacheSolve <- function(x, ...) {
                s <- x$getsolv()
                if(!is.null(s)) {
                        message("The inverse has already been calculated:")
                        return(s)
                        }
                your_mat <- x$get()
                s <- solve(your_mat)
                x$setsolv(s)
                s
        ## Return a matrix that is the inverse of 'x'
}
