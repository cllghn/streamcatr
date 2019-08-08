context("test-getting_data")

test_that("list_datasets works", {
  expect_true(
    is.character(list_datasets("state"))
  )
})
