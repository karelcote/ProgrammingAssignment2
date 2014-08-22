# Creates a special "vector", which is really a list containing a function to
	# set the value of the vector
	# get the value of the vector
	# set the value of the mean
	# get the value of the mean
makeCacheMatrix <- function(x = matrix()) {
	m<- NULL						# set m (our returning matrix) to NULL each time the function is called.
	
	####Methods of the object#####
	set <- function(y) {			# when this method is called to change the value of the object: 
                x <<- y		# value of the matrix is save to y
                m <<- NULL			# m is rest to NULL as if it was the first called
        }
		
	getMatrix <- function() x		# This method returns the value of the original matrix.
	
	setmatrixinv <- function(solve) m <<- solve		# When matrix is first encountered (m=NULL), this method will calculate he reverse
													# matrix and saved in cache.
	
	getmatrixinv <- function() m					# This method will return the reverse matrix from the cache when called
	
	list(set=set, getMatrix=getMatrix, setmatrixinv=setmatrixinv, getmatrixinv=getmatrixinv)  # List created and return with the new object.
}


## Function that returns the inverse matrix of the matrix argument "x" passed to the function.
cacheSolve <- function(x =matrix(), ...)
	m <- x$getmatrixinv()  	#find the inverse matrix of "x" that was passed to the method getmatrixinv() in "makeCacheMatrix".
	if(!is.null(m)) {				#if m is not NULL, get the inverse matrix from the cache. 
			message("getting cached data")
			return(m)			
	## return the value of the inverse matrix and exit the function
	}
									#continue the function only if m="NULL"
	
	data <- x$getMatrix()			#get original matrix and 
	m <- solve(data, ...)			#calculate the reverse matrix
	x$setmatrixinv(m)		#set the new cache reverse matrix in the object "x"
	m								#return the reverse matrix m!
}
