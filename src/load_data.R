# ==============================================================================
# STAC67 Final Case Study: Global Life Expectancy
# Helper Script: Data Ingestion and Type Normalization
# ==============================================================================

suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
})

load_life_expectancy_data <- function(filepath = "data/raw/life_expectancy_2014.csv") {
  if (!file.exists(filepath)) {
    stop(paste("Dataset file not found at path:", filepath))
  }
  
  df <- read_csv(filepath, show_col_types = FALSE) %>%
    mutate(
      status = as.factor(status)
    )
  
  return(df)
}
