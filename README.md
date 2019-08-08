streamcatr
================

Installation
------------

-   Install `devtools` if you haven't already.

``` r
install.packages("devtools")
```

-   Using Windows? Install Rtools if you haven’t already.
    -   Not sure?

``` r
pkgbuild::has_build_tools()
```

-   Install `streamcatr` using `devtools`:

``` r
devtools::install_github("cjcallag/streamcatr")
```

Accessing Data
--------------

Access the Streamcat data sets:

``` r
df_list_state <- streamcatr::list_datasets("state")
head(df_list_state)
```

    ## [1] "AgMidHiSlopes_Region01.zip"  "AgMidHiSlopes_Region02.zip" 
    ## [3] "AgMidHiSlopes_Region03N.zip" "AgMidHiSlopes_Region03S.zip"
    ## [5] "AgMidHiSlopes_Region03W.zip" "AgMidHiSlopes_Region04.zip"

Read specific data sets:

``` r
df <- streamcatr::get_datasets("AgMidHiSlopes_Region01", "state")
```

    ## Parsed with column specification:
    ## cols(
    ##   COMID = col_double(),
    ##   CatAreaSqKm = col_double(),
    ##   WsAreaSqKm = col_double(),
    ##   CatPctFull = col_double(),
    ##   WsPctFull = col_double(),
    ##   PctAg2006Slp20Cat = col_double(),
    ##   PctAg2006Slp10Cat = col_double(),
    ##   PctAg2006Slp20Ws = col_double(),
    ##   PctAg2006Slp10Ws = col_double()
    ## )

``` r
df
```

    ## # A tibble: 65,968 x 9
    ##     COMID CatAreaSqKm WsAreaSqKm CatPctFull WsPctFull PctAg2006Slp20C…
    ##     <dbl>       <dbl>      <dbl>      <dbl>     <dbl>            <dbl>
    ##  1 718276      2.31         2.31        100       100                0
    ##  2 718808      3.94         3.94        100       100                0
    ##  3 718792      5.90         5.90        100       100                0
    ##  4 718288      2.81         2.81        100       100                0
    ##  5 718882      3.66         3.66        100       100                0
    ##  6 718338      0.449        5.29        100       100                0
    ##  7 719118      0.0027       2.04        100       100                0
    ##  8 718834      2.99         2.99        100       100                0
    ##  9 718062      0.036        8.07        100       100                0
    ## 10 718216      4.64         8.68        100       100                0
    ## # … with 65,958 more rows, and 3 more variables: PctAg2006Slp10Cat <dbl>,
    ## #   PctAg2006Slp20Ws <dbl>, PctAg2006Slp10Ws <dbl>

You are now ready for data science! 🔥
