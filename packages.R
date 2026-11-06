# Required R packages for STAC67 Final Project
packages <- c(
  "tidyverse", # ggplot2, dplyr, tidyr, readr, purrr, tibble
  "car",       # VIF, residualPlots, outlierTest, influencePlot
  "leaps",     # regsubsets for all-subsets model selection
  "olsrr",     # Stepwise regression, AIC/BIC comparisons, collin_diag
  "corrplot",  # Correlation matrix visualization
  "broom",     # Tidy model summaries (augment, glance, tidy)
  "lmtest",    # Breusch-Pagan (bptest), Durbin-Watson tests
  "MASS",      # Box-Cox transformations, robust linear models
  "knitr",     # Table generation
  "kableExtra" # Enhanced table formatting
)

install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
  }
}

invisible(sapply(packages, install_if_missing))
message("All required packages are verified and installed.")
