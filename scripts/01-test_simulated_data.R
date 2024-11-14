#### Preamble ####
# Purpose: Test the simulated data to see whether the data satisfy the requirement.
# Author: Yi Tang
# Date: 14 Nov 2024
# Contact: zachary.tang@mail.utoronto.ca
# License: MIT
# Pre-requisites: No.
# Any other information needed? No.


#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv", show_col_types = FALSE)

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Test dataset has 1000 rows

test_that("Dataset has 1000 rows", {
  expect_equal(nrow(simulated_data), 1000)
})

# Test Data columns are of correct types

test_that("Data columns are of correct types", {
  expect_is(simulated_data$Vendor, "character")
  expect_is(simulated_data$current_price, "numeric")
  expect_is(simulated_data$old_price, "numeric")
  expect_is(simulated_data$unit, "integer")
})


# Test prices are within expected range

test_that("Prices are within expected range", {
  expect_true(all(simulated_data$current_price >= 0 & simulated_data$current_price <= 500))
  expect_true(all(simulated_data$old_price >= 0 & simulated_data$old_price <= 1000))
})
