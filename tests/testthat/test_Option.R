require(magrittr)
#
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

test_that("", {
	expect_equal(map(s, inverse), Some(value = 0.5))
  expect_equal(flatMap(s, inverse_Option), Some(value = 0.5))
  expect_equal(lift(s, inverse)(s), Some(value = 0.5))
  expect_equal(map(p, inverse), None())
  expect_equal(flatMap(p, inverse_Option), None())
  expect_equal(lift(p, inverse)(p), None())
})


test_that("Option fold method", {
	expect_equal(
		2 %>%
			inverse_Option %>%
			fold(function() "cannot divide by 0",
					 function(x) paste("the result is", x) ),
		"the result is 0.5")

	expect_equal(
		0 %>%
			inverse_Option %>%
			fold(function() "cannot divide by 0",
					 function(x) paste("the result is", x) ),
		"cannot divide by 0")
})
