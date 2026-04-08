# Lesson 3 Initialization
library(tidyverse)
library(vegan)

# Set classic theme
theme_set(theme_classic())

# Simulate ecological data with distinct habitats
# 10 sites: 5 Woodland, 5 Grassland
habitats <- rep(c("Woodland", "Grassland"), each = 5)

species_list <- c("Quercus robur", "Fagus sylvatica", "Pinus sylvestris", "Poa annua")

# Abundance simulation
# Woodland: High Quercus/Fagus
# Grassland: High Pinus/Poa
set.seed(42)
abundance_matrix <- matrix(c(
  # Woodland sites (1-5)
  rpois(5, 45), rpois(5, 35), rpois(5, 10), rpois(5, 5),
  # Grassland sites (6-10)
  rpois(5, 5),  rpois(5, 10), rpois(5, 55), rpois(5, 40)
), nrow = 10, byrow = FALSE)

colnames(abundance_matrix) <- species_list

species_data <- as.data.frame(abundance_matrix) %>%
  mutate(site_id = 1:10, habitat_type = habitats) %>%
  pivot_longer(cols = all_of(species_list), names_to = "species", values_to = "abundance") %>%
  as_tibble()

environment_data <- tibble(
  site_id = 1:10,
  habitat_type = habitats,
  elevation = c(100, 150, 200, 180, 250, 50, 80, 120, 60, 90),
  soil_pH = c(5.2, 5.5, 5.8, 5.4, 6.1, 6.5, 6.8, 6.3, 6.9, 7.1)
)

# Pre-calculate community matrix for multivariate analysis
community_matrix <- species_data %>% 
  pivot_wider(names_from = species, values_from = abundance, values_fill = 0) %>%
  select(-site_id, -habitat_type)
