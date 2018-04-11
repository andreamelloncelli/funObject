# myNotImplemented <- function() {
#  	stop("MyNotImplemented")
# }
setGeneric("map", function(this, f) standardGeneric("map"))
setGeneric("lift", function(this, f) standardGeneric("lift"))
setGeneric("flatMap", function(this, f) standardGeneric("flatMap"))
setGeneric("fold", function(this, f, g) standardGeneric("fold"))
