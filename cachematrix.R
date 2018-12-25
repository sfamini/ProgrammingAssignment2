## Put comments here that give an overall description of what your
## functions do

#Creates a list of four functions to get/set the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    
    #Sets the matrix value
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    #gets matrix value
    get <- function() x
    
    #sets matrix inverse
    setsolve <- function(solve) m <<- solve
    
    #gets matrix inverse
    getsolve <- function() m
    
    #returns the list, setting members by name
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    ##first try the existng cache...
    m <- x$getsolve()
        
        ##if found, get it from the cache...
    if(!is.null(m)) {
        message("getting matrix inverse")
        return(m)
    }
        ##If not found in cache, then get the original matrix, invert it, and then populate the cache...
    data <- x$get()
    m <- solve(data)
    x$setsolve(m)
        
        ##return the inverted matrix...
    m
}
