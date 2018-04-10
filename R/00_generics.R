myNotImplemented <- function() {
 	stop("MyNotImplemented")
}
setGeneric("map", function(this, f) myNotImplemented())
setGeneric("lift", function(this, f) myNotImplemented())
setGeneric("flatMap", function(this, f) myNotImplemented())
setGeneric("fold", function(this, f, g) myNotImplemented())
