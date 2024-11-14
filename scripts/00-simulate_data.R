#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(6)


#### Simulate data ####
# Vendor names
Vendor <- c(
  "Galleria",
  "Loblaws",
  "Metro",
  "NoFrills",
  "SaveOnFoods",
  "TandT",
  "Voila",
  "Walmart"
)

# Create a dataset by randomly assigning states and parties to divisions
simulated_data <- tibble(
  Vendor = sample(Vendor, size = 1000, replace = TRUE),  # 1000 size of random vendor names
  current_price = round(runif(1000, 0, 500), 3),
  old_price = round(runif(1000, 0, 1000), 3),
  unit = sample(1:10, 1000, replace = TRUE)
)


#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
