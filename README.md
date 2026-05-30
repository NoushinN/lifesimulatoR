# lifesimulatoR

**lifesimulatoR** is an educational R package for exploring origin-of-life concepts through simplified computational simulations.

🧪 **Status:** Educational research package in active development.

The package provides tools for studying molecular evolution, mutation, selection, autocatalytic networks, protocell dynamics, and emergent complexity in toy prebiotic systems. It is designed for students, instructors, science communicators, and researchers interested in computational approaches to abiogenesis and early evolution.

---

## Scientific Motivation

`lifesimulatoR` explores several major origin-of-life research themes:

- Molecular evolution and replication
- Mutation and natural selection
- Information and diversity
- Protocell compartmentalization
- Autocatalytic networks
- Emergence and complexity

The package is intentionally hypothesis-neutral and can be used to discuss RNA World, metabolism-first models, protocell-first models, autocatalytic set theory, and other origin-of-life frameworks.

---

## Main Features

- Simulate evolving molecular populations
- Explore mutation, selection, and fitness landscapes
- Compute diversity and entropy metrics
- Simulate autocatalytic reaction networks
- Simulate protocell growth, leakage, and division
- Visualize simulation trajectories using `ggplot2`
- Educational examples suitable for teaching origin-of-life concepts

---

## Installation

```r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

remotes::install_github("NoushinN/lifesimulatoR")
```
