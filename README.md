
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dtlg.data

<!-- badges: start -->

[![R-CMD-check](https://github.com/AscentSoftware/dtlg.data/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AscentSoftware/dtlg.data/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `{dtlg.data}` is to bundle not so small datasets needed for
benchmarking of `{dtlg}` functions.

## Installation

``` r
# install.packages("pak")
pak::pak("AscentSoftware/dtlg.data")
```

## Usage

``` r
library(dtlg.data)

# Check available datasets.
datasets
#> # A tibble: 3 × 4
#>   name          nrow  ncol description                                          
#>   <chr>        <int> <int> <chr>                                                
#> 1 adsl_small   20000    55 A large Subject-Level Analysis Dataset (ADSL).       
#> 2 adsl_large 1000000    55 A small Subject-Level Analysis Dataset (ADSL).       
#> 3 adae        743022   106 A large Adverse Event Analysis Dataset derived from …

# Load the small ADSL dataset into memory.
dataset("adsl_small")
#> # A tibble: 20,000 × 55
#>    STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
#>    <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
#>  1 AB12345 AB12345-P… id-94… PAK-1     26 YEARS F     ASIAN NOT H… PAK     N    
#>  2 AB12345 AB12345-C… id-11… CHN-1     39 YEARS F     WHITE NOT H… CHN     N    
#>  3 AB12345 AB12345-C… id-10… CHN-5     39 YEARS M     BLAC… HISPA… CHN     N    
#>  4 AB12345 AB12345-C… id-13… CHN-12    37 YEARS M     AMER… NOT H… CHN     N    
#>  5 AB12345 AB12345-N… id-94… NGA-4     33 YEARS M     ASIAN NOT H… NGA     N    
#>  6 AB12345 AB12345-C… id-87… CHN-1     32 YEARS F     ASIAN NOT H… CHN     N    
#>  7 AB12345 AB12345-N… id-17… NGA-6     22 YEARS M     ASIAN HISPA… NGA     N    
#>  8 AB12345 AB12345-B… id-16… BRA-11    48 YEARS M     ASIAN NOT R… BRA     N    
#>  9 AB12345 AB12345-N… id-10… NGA-18    34 YEARS F     BLAC… NOT H… NGA     N    
#> 10 AB12345 AB12345-C… id-18  CHN-15    26 YEARS F     BLAC… HISPA… CHN     N    
#> # ℹ 19,990 more rows
#> # ℹ 44 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>, ARMCD <fct>,
#> #   ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>, TRT02P <fct>,
#> #   TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>, BMRKR1 <dbl>,
#> #   BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>, BEP01FL <fct>,
#> #   AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>, TRTEDTM <dttm>,
#> #   TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>, TRT02EDTM <dttm>, …

# Load the large ADSL dataset into memory.
# dataset("adsl_large")

# Load the ADAE dataset
# dataset("adae")
```
