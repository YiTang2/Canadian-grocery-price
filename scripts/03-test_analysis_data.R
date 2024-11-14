#### Preamble ####
# Purpose: Test the analysis data
# Author: Yi Tang
# Date: 14 Nov 2024
# Contact: zachary.tang@mail.utoronto.ca
# License: MIT
# Pre-requisites: No.
# Any other information needed? No.


#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv", show_col_types = FALSE)


#### Test data ####

# Test that the dataset has no missing values in key columns

test_that("No missing values in key columns", {
  expect_true(all(!is.na(analysis_data$vendor)))
  expect_true(all(!is.na(analysis_data$current_price)))
})

# Test that the dataset has 4 columns
test_that("dataset has 4 columns", {
  expect_equal(ncol(analysis_data), 4)
})

# Test the structure of the data
test_that("Data columns are of correct types", {
  expect_is(analysis_data$vendor, "character")
  expect_is(analysis_data$current_price, "numeric")
  expect_is(analysis_data$old_price, "numeric")
})
