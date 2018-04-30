
test_that("subtype", {

	expect_equal(subtype("Option", "function"),
							 "Optionfunction")
		expect_equal(subtype("Option", "ANY"),
							 "Option")
})
