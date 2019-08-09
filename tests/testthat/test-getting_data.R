context("test-getting_data")

# Tests for the data source URLs ===============================================
test_that("get_url('state') works", {
  expect_true(
    RCurl::url.exists(get_url("state"))
  )
})

test_that("get_url('hydroregion') works", {
  expect_true(
    RCurl::url.exists(get_url("hydroregion"))
  )
})

# Tests for each function ======================================================
test_that("list_datasets works", {
  expect_true(
    is.character(list_datasets("state"))
  )
})

test_that("get_datasets works", {
  expect_is(
    get_datasets("AgMidHiSlopes_Region01", "state"),
    "data.frame"
  )
})
