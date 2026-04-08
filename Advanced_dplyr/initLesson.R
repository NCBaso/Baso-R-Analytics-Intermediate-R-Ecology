# Code placed in this file fills the multi-panel plot with data
# when the student starts the lesson.

library(tidyverse)
library(vegan)
library(knitr)

# Sample ecological data
species_data <- tibble(
  site_id = rep(1:5, each = 3),
  species = rep(c("Quercus robur", "Fagus sylvatica", "Pinus sylvestris"), 5),
  abundance = c(12, 45, 67, 88, 34, 12, 5, 67, 23, 44, 12, 90, 33, 55, 21),
  year = 2023
)

environment_data <- tibble(
  site_id = 1:5,
  elevation = c(100, 250, 300, 150, 200),
  soil_pH = c(5.2, 6.1, 5.8, 6.3, 5.5),
  precipitation = c(800, 950, 1000, 850, 900)
)
