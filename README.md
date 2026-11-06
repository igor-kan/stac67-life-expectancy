# STAC67 Case Study Project: Global Life Expectancy Analysis

> **Course:** STAC67H3 — Regression Analysis (Fall 2026)  
> **Institution:** Department of Computer & Mathematical Sciences, University of Toronto Scarborough  
> **Topic:** Determinants of Global Life Expectancy via Multiple Linear Regression & Diagnostic Modeling  

---

## 📌 Project Overview

This repository hosts the computational architecture, datasets, exploratory analyses, and diagnostic workflows for the **STAC67 Final Case Study Project**. The study investigates the macro-level socioeconomic, healthcare expenditure, immunization, and epidemiological factors driving variation in global life expectancy across 183 countries for the year 2014, sourced from the **World Health Organization (WHO) Global Health Observatory**.

### Research Objective
Formulate, select, and rigorously validate a parsimonious multiple linear regression model:
$$\text{life\_expectancy}_i = \beta_0 + \sum_{j=1}^{p} \beta_j X_{ij} + \varepsilon_i, \quad \varepsilon_i \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2)$$
evaluating non-linear macroeconomic dynamics (such as the *Preston Curve* of diminishing marginal longevity returns to GDP per capita) alongside critical interaction effects between country developmental status and human capital investments.

---

## 🗂 Repository Structure

```text
stac67-life-expectancy/
├── data/
│   ├── raw/
│   │   └── life_expectancy_2014.csv    # Raw cross-sectional WHO 2014 dataset (183 countries, 21 variables)
│   └── processed/                      # Cleaned, imputed, or transformed datasets
├── notebooks/
│   └── stac67_life_expectancy_case_study.Rmd  # Master R Markdown analysis and modeling report
├── src/
│   └── load_data.R                     # Data ingestion and variable type casting utilities
├── figures/                            # High-resolution plots (residual diagnostics, leverage plots)
├── reports/                            # Compiled PDF/HTML deliverables and slide decks
├── packages.R                          # CRAN dependency installation script
├── .gitignore                          # Standard R, RStudio, Quarto, and OS ignore patterns
└── README.md                           # Project documentation and roadmap
```

---

## 📊 Dataset Specification: `life_expectancy_2014.csv`

The cross-sectional dataset contains **183 country observations** and **21 variables** recorded for 2014:

| Variable | Type | Description | Unit / Range |
| :--- | :--- | :--- | :--- |
| `country` | Nominal | Country name | 183 distinct entities |
| `status` | Binary Factor | Developmental economic status | `Developed`, `Developing` |
| `life_expectancy` | Continuous (**Y**) | Life expectancy at birth | Years (36.3 – 89.0) |
| `adult_mortality` | Continuous | Adult mortality rate (probability of dying between 15 and 60) | Per 1,000 population |
| `infant_deaths` | Discrete | Number of infant deaths | Count per 1,000 population |
| `alcohol` | Continuous | Recorded per capita alcohol consumption (pure alcohol, 15+) | Litres |
| `percentage_expenditure` | Continuous | Expenditure on health as a percentage of GDP per capita | Percentage (%) |
| `hepatitis_b` | Continuous | Immunization coverage among 1-year-olds (HepB) | Percentage (%) |
| `measles` | Discrete | Reported measles cases | Count per 1,000 population |
| `bmi` | Continuous | Mean Body Mass Index of entire population | $\text{kg/m}^2$ |
| `under_five_deaths` | Discrete | Number of under-five deaths | Count per 1,000 population |
| `polio` | Continuous | Immunization coverage among 1-year-olds (Pol3) | Percentage (%) |
| `total_expenditure` | Continuous | General government expenditure on health as % of total gov expenditure | Percentage (%) |
| `diphtheria` | Continuous | DTP3 immunization coverage among 1-year-olds | Percentage (%) |
| `hiv_aids` | Continuous | Deaths per 1,000 live births from HIV/AIDS (ages 0–4) | Rate |
| `gdp` | Continuous | Gross Domestic Product per capita | USD ($) |
| `population` | Continuous | Population of the country | Total count |
| `thinness_10_19` | Continuous | Prevalence of thinness among children & adolescents (ages 10–19) | Percentage (%) |
| `thinness_5_9` | Continuous | Prevalence of thinness among children (ages 5–9) | Percentage (%) |
| `income_composition` | Continuous | Human Development Index (HDI) income composition of resources | Index (0 to 1) |
| `schooling` | Continuous | Expected number of years of schooling | Years (0 to 20.7) |

---

## 🔬 Analytical & Econometric Framework

The investigation proceeds across six core phases aligned with the course curriculum (Kutner et al., *Applied Linear Statistical Models*):

1. **Exploratory Data Analysis (EDA):**
   - Missing data audit, univariate distributions, and bivariate correlations.
   - Empirical validation of the **Preston Curve** (logarithmic relationship between GDP per capita and life expectancy).
2. **Model Specification & Transformation:**
   - Candidate specifications incorporating power/log transformations (e.g., $\ln(\text{gdp})$, $\ln(\text{hiv\_aids})$).
   - Hypothesized interactions (e.g., `status * schooling`, `status * income_composition`).
3. **Model Selection:**
   - Stepwise procedures (Forward, Backward, Both) and All-Subsets regression (`leaps::regsubsets`).
   - Comparison via **Akaike Information Criterion (AIC)**, **Bayesian Information Criterion (BIC)**, and **Adjusted $R^2$**.
4. **Diagnostic Validation:**
   - **LINE assumptions:** Residual vs. fitted scatterplots, Normal Q-Q plots, Shapiro-Wilk test, and Breusch-Pagan homoscedasticity test (`lmtest::bptest`).
   - **Multicollinearity:** Variance Inflation Factors (`car::vif`) ensuring $\text{VIF} < 5$ (or condition index audits).
   - **Outliers & Leverage:** Studentized residuals ($|r_i| > 3$), leverage values ($h_{ii} > 2(p+1)/n$), Cook's Distance ($D_i > F(0.5, p, n-p)$), and DFFITS.
5. **Remedial Measures (if needed):**
   - Weighted Least Squares (WLS), Box-Cox transformations, or robust regression standard errors.
6. **Interpretation & Causal Limitations:**
   - Coefficient elasticity interpretations, omitted variable bias, ecological fallacy warnings, and policy insights.

---

## 🚀 Getting Started

### Prerequisites
- R (version $\ge 4.2$)
- RStudio or Quarto CLI (optional for rendering reports)

### Installation
Clone the repository and install required CRAN libraries:
```bash
git clone https://github.com/igor-kan/stac67-life-expectancy.git
cd stac67-life-expectancy
Rscript packages.R
```

### Running the Analysis
Open `notebooks/stac67_life_expectancy_case_study.Rmd` inside RStudio and click **Knit** (to PDF or HTML), or render via command line:
```bash
Rscript -e "rmarkdown::render('notebooks/stac67_life_expectancy_case_study.Rmd')"
```

---

## 📜 License & Integrity
Course project repository developed for academic research purposes at UTSC.

© 2026 Igor Kan
