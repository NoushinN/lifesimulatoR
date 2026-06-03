<img src="man/figures/lifesimulatoR_hex.png" align="right" width="80" alt="lifesimulatoR hex sticker" />

# lifesimulatoR

[![R](https://img.shields.io/badge/R-4.3%2B-blue)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Package Website](https://img.shields.io/badge/Website-pkgdown-blue)](https://noushinn.github.io/lifesimulatoR/)
[![Companion Book](https://img.shields.io/badge/Book-bookdown-orange)](https://noushinn.github.io/lifesimulatoR-book/)
[![GitHub stars](https://img.shields.io/github/stars/NoushinN/lifesimulatoR?style=social)](https://github.com/NoushinN/lifesimulatoR)

**lifesimulatoR** is an educational R package for exploring origin-of-life concepts through simplified computational simulations.

🧪 **Status:** Educational research package in active development.

The package provides tools for studying molecular evolution, mutation, selection, diversity, protocell dynamics, autocatalytic networks, and emergent complexity in toy prebiotic systems. It is designed for students, instructors, science communicators, and researchers interested in computational approaches to abiogenesis and early evolution.

## Companion Book

A theory-rich companion book is available online:

📖 **Online Book:** https://noushinn.github.io/lifesimulatoR-book/

📚 **Book Repository:** https://github.com/NoushinN/lifesimulatoR-book

The companion book provides:

* Scientific background on origin-of-life research
* Explanations of major abiogenesis theories
* Conceptual models behind package functions
* Detailed examples and tutorials
* Interpretation of simulation results
* Classroom exercises and discussion questions
* Suggested readings from the scientific literature

The package and book are designed to be used together, with the book providing the theoretical context and the package providing hands-on computational exploration.

## Scientific Motivation

One of the most important open questions in science is:

> How did life emerge from non-living matter?

Researchers have proposed many possible pathways, including:

* RNA World
* Metabolism First
* Protocell First
* Autocatalytic Set Theory
* Systems Chemistry Approaches
* Hybrid Models

`lifesimulatoR` provides simplified computational models that allow users to explore the mechanisms often discussed within these frameworks.

The package is intentionally hypothesis-neutral and is designed as a conceptual and educational tool rather than a chemically realistic reconstruction of abiogenesis.

## Main Features

### Molecular Evolution

* Generate symbolic molecular populations
* Simulate replication and inheritance
* Explore mutation and selection dynamics
* Investigate evolutionary trajectories

### Diversity and Complexity

* Compute Shannon entropy
* Measure population diversity
* Explore information and complexity concepts
* Track changes through time

### Protocells

* Simulate compartment growth
* Explore leakage and resource retention
* Model protocell division dynamics
* Investigate compartment-based selection

### Autocatalytic Networks

* Simulate catalytic interaction networks
* Explore feedback loops and self-maintenance
* Investigate network-level emergence
* Study alternative origin-of-life scenarios

### Visualization and Analysis

* Summarize simulation outputs
* Visualize trajectories using `ggplot2`
* Compare alternative parameter settings
* Support classroom demonstrations and assignments

## Installation

```r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

remotes::install_github("NoushinN/lifesimulatoR")
```

## Quick Example

```r
library(lifesimulatoR)

sim <- simulate_abiogenesis(
  n_molecules = 100,
  generations = 100,
  mutation_rate = 0.02,
  selection_strength = 1,
  seed = 123
)

head(sim)

plot_simulation(
  sim,
  x = "generation",
  y = "mean_fitness"
)
```

## Learning Path

New users are encouraged to follow this progression:

1. Read the companion book introduction.
2. Work through the Getting Started vignette.
3. Explore Molecular Evolution.
4. Study Diversity and Complexity metrics.
5. Investigate Protocell simulations.
6. Explore Autocatalytic Networks.
7. Compare alternative origin-of-life hypotheses.

## Documentation

### Package Website

https://noushinn.github.io/lifesimulatoR/

### Companion Book

https://noushinn.github.io/lifesimulatoR-book/

### Source Code

https://github.com/NoushinN/lifesimulatoR

### Report Issues

https://github.com/NoushinN/lifesimulatoR/issues

## Educational Scope

The models implemented in `lifesimulatoR` are intentionally simplified and should be viewed as conceptual teaching and learning tools.

They are designed to help users explore mechanisms frequently discussed in origin-of-life research, including:

* Variation
* Replication
* Mutation
* Selection
* Diversity
* Compartmentalization
* Autocatalysis
* Emergence

Simulation results should not be interpreted as evidence for specific historical pathways leading to life on Earth.

## Citation

If you use `lifesimulatoR` in teaching, presentations, or publications, please cite the package using:

```r
citation("lifesimulatoR")
```

## License

MIT License

## Author

**Noushin Nabavi**

Educational simulations for origin-of-life science, complexity, and emergence.
