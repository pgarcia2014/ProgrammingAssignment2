> m1 <- matrix(c(3,5,4,7), 2, 2)
> m2 <- matrix(c(5,6,4,5), 2, 2)
> m3 <- matrix(c(1,1,1,2), 2, 2)
> source("cachematrix.R")
> x1 <- makeCacheMatrix(m1)
> x2 <- makeCacheMatrix(m2)
> cacheSolve(x1)
     [,1] [,2]
[1,]    7   -4
[2,]   -5    3
> cacheSolve(x1)
getting cached inverse matrix
     [,1] [,2]
[1,]    7   -4
[2,]   -5    3
> cacheSolve(x2)
     [,1] [,2]
[1,]    5   -4
[2,]   -6    5
> cacheSolve(x2)
getting cached inverse matrix
     [,1] [,2]
[1,]    5   -4
[2,]   -6    5
> x3 <- makeCacheMatrix(m1)
> cacheSolve(x3)
getting cached inverse matrix
     [,1] [,2]
[1,]    7   -4
[2,]   -5    3
> x3 <- makeCacheMatrix(m3)
> cacheSolve(x3)
     [,1] [,2]
[1,]    2   -1
[2,]   -1    1
> cacheSolve(x3)
getting cached inverse matrix
     [,1] [,2]
[1,]    2   -1
[2,]   -1    1