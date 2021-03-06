## This set of tow functions eases the computation of a matrix inverse by
## retrieving the inverse if it has been calculated previously
## (for the same matrix),

## This function creates a special "matrix" object that can cache 
## its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setinverse<-function(solve) m<<-solve
  getinverse<-function() m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already
## been calculated (and the matrix has not changed), then the
## cachesolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
  m<-x$getinverse()
  if(!is.null(m)){
    message ("getting cache data")
    ## Return a matrix that is the inverse of 'x'
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
}