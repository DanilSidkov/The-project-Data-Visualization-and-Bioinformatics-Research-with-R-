library('tidyverse')
mt <- read_tsv(url("https://raw.githubusercontent.com/kirushka/datasets/main/food_recipes/food_recipes.tsv" ))
mt_sort <- select(mt, recipe_title, ingredients)
