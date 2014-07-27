## name: makeCacheMatrix 
## input: a matrix
## output: a list that contains 4 functions to 
##		get/set the original matrix
##		get/set the inverse of the input matrix
## Variables:
## It uses two lists that are created in an environment that is different from the current 
## environment in order to persist its contents between calls
##		omatrix: to store the original matrices
##		imatrix: to store the inverse matrices
## It also uses a pos variable to store the position of the original matrix and its inverse in the lists
## Description:
## setOriginal checks if the input matrix (original) already exists in the omatrix. If so, the function 
## does not do anything. Otherwise, it appends the new matrix in omatrix and appends a NULL value, in the same
## position, in imatrix.

makeCacheMatrix <- function(x = matrix()) {
		pos <- NULL

		matequal <- function(m1, m2) { 
				is.matrix(m1) && is.matrix(m2) && dim(m1) == dim(m2) && all(m1 == m2) 
		}

        setOriginal <- function(y) {
				if (!exists("omatrix")) { 
						pos <<- 1
						omatrix <<- list(y) 
						imatrix <<- list() 
						imatrix[[pos]] <<- NULL
				} 
				else { 
						x <- 1
						xMax <- length(omatrix)
						while (x <= xMax)
						{
								if (!matequal(omatrix[[x]], y)) {
										x <- x + 1;
								}
								else {
										pos <<- x;
										break;
								}
						}
						if (x > xMax) {
								pos <<- length(omatrix) + 1
								omatrix[[pos]] <<- y
								imatrix[[pos]] <<- NULL
						}
				}
		}
		
		setOriginal(x)

        getOriginal <- function() {
				omatrix[[pos]]
		}

        setInverse <- function(inverse) {
				imatrix[[pos]] <<- inverse
		}

        getInverse <- function()  {
				m <- NULL
				if (length(imatrix) >= pos) {
						m <- imatrix[[pos]]
				}
				m
		}

        list(setOriginal = setOriginal, getOriginal = getOriginal, setInverse = setInverse, getInverse = getInverse)
}


## name: cacheSolve 
## input: a "special" matrix created with makeCacheMatrix function
## output: It calculates, saves and shows the inverse of the input matrix 
## Description:
## It checks if the inverse matrix is already calculated. If so, it retrieves it.
## Otherwise, it gets the original matrix, calculates the inverse of the matrix, saves it 
## and finally, shows it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        im <- x$getInverse()
        if(!is.null(im)) {
                message("getting cached inverse matrix")
                return(im)
        }
        om <- x$getOriginal()
        im <- solve(om)
        x$setInverse(im)
		im
}