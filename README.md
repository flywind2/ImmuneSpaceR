
<!-- README.md is generated from README.Rmd. Please edit that file -->
ImmuneSpaceR <img src="man/figures/logo.png" align="right" />
=============================================================

[![Build Status](https://travis-ci.org/RGLab/ImmuneSpaceR.svg?branch=master)](https://travis-ci.org/RGLab/ImmuneSpaceR) [![codecov](https://codecov.io/gh/RGLab/ImmuneSpaceR/branch/master/graph/badge.svg)](https://codecov.io/gh/RGLab/ImmuneSpaceR/branch/master) [![bioc](http://www.bioconductor.org/shields/downloads/ImmuneSpaceR.svg)](https://bioconductor.org/packages/stats/bioc/ImmuneSpaceR/) [![bioc](http://www.bioconductor.org/shields/years-in-bioc/ImmuneSpaceR.svg)](http://bioconductor.org/packages/release/bioc/html/ImmuneSpaceR.html)

A thin wrapper around Rlabkey to access the [ImmuneSpace](https://www.immunespace.org) database from R.

This package simplifies access to the [HIPC](https://www.immuneprofiling.org/) ImmuneSpace database for R programmers. It takes advantage of the standardization of the database to hide all the [`Rlabkey`](https://cran.r-project.org/web/packages/Rlabkey/index.html) specific code away from the user. The study-specific datasets can be accessed via an object-oriented paradigm.

Installation
------------

Install from [Bioconductor](http://bioconductor.org/packages/release/bioc/html/ImmuneSpaceR.html):

``` r
install.packages("BiocManager")
BiocManager::install("ImmuneSpaceR")
```

Or install the latest development version via [`remotes`](https://cran.r-project.org/web/packages/remotes/index.html):

``` r
install.packages("remotes")
remotes::install_github("RGLab/ImmuneSpaceR")
```

Configuration
-------------

The ImmuneSpace Portal can be accessed via `ImmuneSpaceR` with the user's credentials. A `.netrc` file storing login and password information is required.

1.  [Register](https://www.immunespace.org/login/home/register.view?)
2.  Create a netrc file with your ImmuneSpace credetntials using `interactive_netrc()` function in R:

``` r
library(ImmuneSpaceR)
interactive_netrc()
```

If you're familiar with the command-line interface, see [the introductory vignette](https://rglab.github.io/ImmuneSpaceR/articles/Intro_to_ImmuneSpaceR.html).

Usage
-----

### Create a connection

The general idea is that the user creates an instance of an `ImmuneSpaceConnection` class. The instance configures itself to connect to a specific study, and datasets and gene expression matrices can be retrieved by name.

For example:

``` r
library(ImmuneSpaceR)
con <- CreateConnection("SDY269")
```

will create an instance of SDY269.

### List datasets

Datasets can be listed by:

``` r
con$listDatasets()
#> datasets
#>  gene_expression_files
#>  fcs_sample_files
#>  demographics
#>  elispot
#>  hai
#>  elisa
#>  pcr
#>  cohort_membership
#>  fcs_analyzed_result
#> Expression Matrices
#>  SDY269_PBMC_TIV_Geo
#>  SDY269_PBMC_LAIV_Geo
```

which will print names of available datasets and gene expression matrices.

### Retrieve datasets

Gene expression matrices or datasets can be retreived by:

``` r
LAIV2008 <- con$getGEMatrix("SDY269_PBMC_LAIV_Geo")
#> Downloading matrix..
#> Constructing ExpressionSet
elisa <- con$getDataset("elisa")
```

The connection object *caches* data, so once it is retrieved, the next time you access it, it will use the local cached copy. The package uses a [R6](https://cran.r-project.org/web/packages/R6/index.html) class system to represent the connection to a study and get around some of R's copy-on-change behaviour.

### Visualize

The `plot` method uses [`ggplot2`](https://cran.r-project.org/web/packages/ggplot2/index.html) functions to generate visualizations of datasets, leveraging the standardized dataset tables.

``` r
con$plot("hai")
```

<img src="man/figures/README-plot-1.png" width="100%" />

Examples & Documentation
------------------------

For more advanced examples and detailed documentation, see [the package vignettes](http://rglab.github.io/ImmuneSpaceR/articles/) and the reports available on [ImmuneSpace](https://www.immunespace.org/).

Contributing
------------

If you'd like to report bugs/issues/feature requests or contribute to the package, please see [the contributing guidelines](./CONTRIBUTING.md) and join [our Slack workspace](https://immunespace.herokuapp.com/).
