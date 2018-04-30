OptionA <- function(A = "ANY") {

	# Option ------------------------------------------------------------------

	Option <- setClass("Option")
	setMethod(f = "lift",
						signature("Option", "function"),
						function(this, f) {function(this) map(this, f)})
	Option
}

# None --------------------------------------------------------------------

NoneA <- function(A = "ANY") {

	if (A == "ANY") A = ""

	None   <- setClass("None",
										 contains = "Option")
	setMethod(f = "map",
						signature("None", "function"),
						function(this, f) None() )
	setMethod(f = "flatMap",
						signature("None", "function"),
						function(this, f) None() )
	setMethod(f = "fold",
						signature("None", "function", "function"),
						function(this, f, g) {f()})
	# setMethod(f = "ap",
	# 					signature = c("None", paste("Option", "function")),
	# 					definition = function(this, fab) {
	# 						None()
	# 					})
	None
}

	# Some --------------------------------------------------------------------

SomeA <- function(A = "ANY") {

	if (A == "ANY") A = ""

	Some   <- setClass(paste0("Some", A),
										 representation(value = "ANY"),
										 contains = "Option")
	setMethod(f = "map",
						signature = c("Some", "function"),
						function(this, f) Some(value = f(this@value)) )
	setMethod(f = "flatMap",
						signature = c("Some", "function"),
						definition = function(this, f) f(this@value) )
	setMethod(f = "fold",
						signature("Some", "function", "function"),
						function(this, f, g) {g(this@value)})
	setMethod(f = "ap",
						signature = c("Some", paste0("Option", "function")),
						definition = function(this, fab) {
							map(fab, function(f) f(this@value))
						})
	Some
}

