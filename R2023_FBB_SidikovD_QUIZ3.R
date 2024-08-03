library(tidyverse)

species_count <- starwars %>%
  group_by(species) %>%
  summarise(n = n(), .groups = "drop") %>%
  arrange(desc(n))

most_common_species <- species_count$species[1]

starwars <- starwars %>%
  mutate(is_common_species = ifelse(species == most_common_species, "Human", "Other"))

starwars <- starwars %>%
  drop_na(mass)

starwars %>%
  ggplot(aes(x = is_common_species, y = mass)) +
  geom_boxplot() +
  facet_wrap(~is_common_species, scales = "free", ncol = 2) +
  theme_bw() +
  labs(
    title = "Comparing the body weight of characters of different races in Star Wars",
    x = "Belonging to the most numerous race",
    y = "Body weight (kg)",
    caption = paste("The most numerous race:", most_common_species)
  )