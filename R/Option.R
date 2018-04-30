Option <- OptionA()
None   <- NoneA()
Some   <- SomeA()
# Option <- OptionA(A = "function")
# None   <- NoneA(A = "function")
# Some   <- SomeA(A = "function")
# # Option ------------------------------------------------------------------
#
# Option <- setClass("Option")
# setMethod(f = "lift",
# 					signature("Option", "function"),
# 					function(this, f) {function(this) map(this, f)})
#
# # None --------------------------------------------------------------------
#
# None   <- setClass("None",
# 									 contains = "Option")
# setMethod(f = "map",
# 					signature("None", "function"),
# 					function(this, f) None() )
# setMethod(f = "flatMap",
# 					signature("None", "function"),
# 					function(this, f) None() )
# setMethod(f = "fold",
# 					signature("None", "function", "function"),
# 					function(this, f, g) {f()})
# setMethod(f = "ap",
# 					signature = c("None", "function"),
# 					definition = function(this, fab) {
# 						None()
# 					})
# # Some --------------------------------------------------------------------
#
# Some   <- setClass("Some",
# 									 representation(value = "ANY"),
# 									 contains = "Option")
# setMethod(f = "map",
# 					signature = c("Some", "function"),
# 					function(this, f) Some(value = f(this@value)) )
# setMethod(f = "flatMap",
# 					signature = c("Some", "function"),
# 					definition = function(this, f) f(this@value) )
# setMethod(f = "fold",
# 					signature("Some", "function", "function"),
# 					function(this, f, g) {g(this@value)})
# setMethod(f = "ap",
# 					signature = c("Some", "Option"),
# 					definition = function(this, fab) {
# 						map(fab, function(f) f(this@value))
# 					})
