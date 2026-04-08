# Lesson 4 Initialization
library(tidyverse)
library(glmmTMB)
library(performance)

set.seed(123)

# 20 sites over 2 years
n_sites <- 20
n_years <- 2

# Simulated Environment
environment_data <- tibble(
  site_id = 1:n_sites,
  elevation = seq(100, 1000, length.out = n_sites),
  soil_pH = runif(n_sites, 4.0, 7.5),
  precipitation = runif(n_sites, 500, 1200)
)

# Expand for 2 years
model_data <- environment_data %>%
  slice(rep(1:n(), each = n_years)) %>%
  mutate(year = rep(2023:2024, n_sites))

# Simulate Richness (Poisson part)
# Log-link: log(mu) = beta0 + beta1*elev + site_effect
site_effects <- rnorm(n_sites, 0, 0.5)
model_data <- model_data %>%
  mutate(
    site_re = site_effects[site_id],
    # Calculate lambda for Poisson
    log_mu = 1.5 + 0.001 * elevation - 0.2 * soil_pH + site_re,
    richness = rpois(n(), exp(log_mu))
  )

# Add Structural Zeros (Zero-Inflation)
# Sites with very low pH (e.g., < 4.5) have a high chance of being zero regardless of elevation
model_data <- model_data %>%
  mutate(
    zero_prob = if_else(soil_pH < 4.5, 0.7, 0.05),
    is_zero = rbinom(n(), 1, zero_prob),
    richness = if_else(is_zero == 1, 0L, richness)
  )

# Cleanup for the lesson
richness_data <- model_data %>% 
  select(site_id, year, richness, elevation, soil_pH, precipitation) %>%
  mutate(site_id = as.factor(site_id))

# Pre-calculate a standard Poisson GLMM for student comparison
poisson_model <- glmmTMB(richness ~ elevation + soil_pH + (1 | site_id), 
                         data = richness_data, 
                         family = poisson)
