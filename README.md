# tbEpiRDS

![Package Version](https://img.shields.io/badge/version-0.1.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

**tbEpiRDS** is an R package designed for conducting spatial analysis, data manipulation, and visualizations specific to Tuberculosis (TB) epidemiology and Respondent-Driven Sampling (RDS) studies. This package provides a comprehensive toolkit for researchers and analysts working with TB-related data.

## Features

- Convert units to days for symptom screening using the `%sans%` and `convert_to_day` functions.
- Create customized ggplot themes for visualizing data with the `theme_enroll` function.
- Generate edge lists from coupon data with the `create_edge_list` function, which is essential for network analysis in RDS studies.
- Calculate activity spaces and convex hulls with the `activity_space` function, allowing for the assessment of geographical patterns in TB transmission.
- Compute the proportion overlap between two spatial polygons with the `olp` function, facilitating the evaluation of spatial concordance.
- Perform overlap analyses between participants' activity spaces using the `calculate_overlap` function, supporting the exploration of potential exposure to TB.

## Installation

You can install **tbEpiRDS** from GitHub using the `devtools` package:

```R
# Install devtools if not already installed
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

# Install tbEpiRDS
devtools::install_github("your_username/tbEpiRDS")
```

## Usage

To use tbEpiRDS in your R scripts or projects, load the package using:

```R
library(tbEpiRDS)
```


For detailed information on how to use each function, please refer to the package documentation and vignettes.

## Documentation

Comprehensive documentation for tbEpiRDS functions is available within R. You can access documentation using the ? operator followed by the function name. For example:

```R
?convert_to_day
```

## Contributing

We welcome contributions to tbEpiRDS! If you have ideas for improvements, bug fixes, or new features, please open an issue or submit a pull request on our GitHub repository.

## License

tbEpiRDS is distributed under the MIT License.

## Contact

For questions, feedback, or support, please contact:

Victoria Overbeck (voverbec@gmail.com)
Happy analyzing and visualizing TB epidemiology data with tbEpiRDS!
