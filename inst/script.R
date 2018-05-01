require(magrittr)

# main Option --------------------------------------------------------------------

s <- Some(value = 2)
p <- None()
inverse <- function(x) {
	if (x == 0) stop("division by 0") # force an exception
	1/x
}
# function that manage the exception
inverse_Option <- function(x) {
	if (x == 0) return(None())
	Some(value = 1/x)}

inverse_Either <- function(x) {
	if (x == 0) return(Left(value = "Division by 0"))
	Right(value = 1/x)
}

map(s, inverse)
map(p, inverse)
flatMap(s, inverse_Option)
flatMap(p, inverse_Option)
lift(s, inverse)(s)
lift(p, inverse)(p)
# direct_method -----------------------------------------------------------

setMethod("inverse",
					signature = "Option",
					definition = function(x) map(x, inverse))

# monads ------------------------------------------------------------------

2 %>%
	inverse_Option %>%
	fold(function() "cannot divide by 0",
			 function(x) paste("the result is", x) )
0 %>%
	inverse_Option %>%
	fold(function() "cannot divide by 0",
			 function(x) paste("the result is", x) )
2 %>%
	inverse_Either() %>%
	fold(function(x) paste("the problem is", x),
			 function(x) paste("the result is", x) )
0 %>%
	inverse_Either() %>%
	fold(function(x) paste("the problem is", x),
			 function(x) paste("the result is", x) )

setClassUnion("Nullable",
							members = c("numeric", "NULL"))
setGeneric("fromNullable", function(this) myNotImplemented())

setMethod("fromNullable",
					signature = "Nullable",
					definition = function(this) {
						if (is.null(this))
							return(None())
						else
							return(Some(value = this))
					})
is(1, "Nullable")
fromNullable(1)
fromNullable(NULL)
is(NULL, "Nullable")


standardGeneric("fromNullable")

library(purrr)
map

showMethods('map')

map
library(purrr)

# funtore_applicativo -----------------------------------------------------
# init
fab <- Somefunction(value = function(a) a * 3)
fab
# run
s
ap(s, fab)
## or
map(fab, function(f) f(s@value) )


###
p
ap(s, s) # error
###


