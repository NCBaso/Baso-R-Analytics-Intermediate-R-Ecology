# Lesson 2 Initialization
library(tidyverse)
library(vegan)
library(patchwork)

# Set classic theme as default for the lesson
theme_set(theme_classic())

# Expanded Simulated ecological data (2023 and 2024)
species_data <- tibble(
  site_id = rep(rep(1:5, each = 3), 2),
  species = rep(rep(c("Quercus robur", "Fagus sylvatica", "Pinus sylvestris"), 5), 2),
  abundance = c(
    # 2023 data
    12, 45, 67, 88, 34, 12, 5, 67, 23, 44, 12, 90, 33, 55, 21,
    # 2024 data (simulated with some variance)
    15, 40, 70, 85, 38, 10, 8, 60, 25, 50, 15, 85, 30, 60, 18
  ),
  year = rep(c(2023, 2024), each = 15)
)

environment_data <- tibble(
  site_id = 1:5,
  elevation = c(100, 250, 300, 150, 200),
  soil_pH = c(5.2, 6.1, 5.8, 6.3, 5.5),
  precipitation = c(800, 950, 1000, 850, 900)
)

# Pre-joined analysis data
ecological_analysis <- species_data %>% 
  left_join(environment_data, by = "site_id") %>%
  group_by(site_id, year) %>%
  mutate(
    total_abundance = sum(abundance),
    species_richness = n_distinct(species)
  ) %>%
  ungroup()

# Custom theme function from workshop script
theme_ecological <- function() {
  theme_classic() +
    theme(
      axis.text = element_text(size = 10),
      axis.title = element_text(size = 12, face = "bold"),
      plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
      legend.position = "right"
    )
}
