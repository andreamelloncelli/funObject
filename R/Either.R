
# Either ------------------------------------------------------------------

Either <- setClass("Either")

# Left --------------------------------------------------------------------

Left <- setClass("Left",
								 representation(value = "ANY"),
								 contains = "Either")
setMethod("map",
					signature("Left", "function"),
					function(this, f) {
						return(Left(value = f(this@value)))
					})
setMethod(f = "fold",
					signature("Left", "function", "function"),
					function(this, f, g) {f(this@value)})
# Right -------------------------------------------------------------------

Right <- setClass("Right",
									representation(value = "ANY"),
									contains = "Either")

setMethod("map",
					signature("Right", "function"),
					function(this, f) {
						return(Right(value = f(this@value)))
					})
setMethod(f = "fold",
					signature("Right", "function", "function"),
					function(this, f, g) {g(this@value)})
