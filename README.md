
<!-- README.md is generated from README.Rmd. Please edit that file -->

# The portrobbo package :anchor:

The functions within this package can be used to speed up work and
shorten code. It has originally been made to support a portfolio and the
assignments within it but the functions are short and to the point,
making them useful for various situations.

## Installation

The development version of portrobbo can be installed from
[GitHub](https://github.com/) by using:

``` r
# install.packages("devtools")
devtools::install_github("mirthhe/portrobbo")
```

# Functions

The package currently contains the following functions:
<ul>
<li>
uniq_val
</li>
<li>
save_csv_rds
</li>
<li>
graph_jitter
</li>
<li>
protein visualizations:
<ul>
<li>
protein_cartoon
</li>
<li>
protein_stick
</li>
<li>
protein_sphere
</li>
<li>
protein_visual
</li>
</ul>
</ul>

To show the use of the package we first load the needed libraries.

``` r
library(portrobbo)
library(ggplot2)
library(dplyr)
```

The package also contains the following data objects:
[COVID19](https://github.com/mirthhe/portrobbo/blob/main/data/covid19.rda)
<ul>
<li>
A dataframe containing COVID19 cases and deaths in multiple European
countries
</li>
<li>
Data came from the
[ECDC](https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide)
</li>
<li>
Imported using [this
code](https://github.com/mirthhe/portrobbo/blob/main/data-raw/covid19.R)
</li>
<li>
Used to show the functionality of uniq_val(), save_csv_rds() and
graph_jitter()
</li>
</ul>
[Kinesin](https://github.com/mirthhe/portrobbo/blob/main/data/kinesin.rda)
<ul>
<li>
R object containing the PDBx file 3COB
</li>
<li>
[Data](https://github.com/mirthhe/portrobbo/blob/main/data-raw/3cob.pdb)
came from the [RCSB PDB](https://www.rcsb.org/structure/3COB)
</li>
<li>
Imported using [this
code](https://github.com/mirthhe/portrobbo/blob/main/data-raw/kinesin.R)
</li>
<li>
Used to show the functionality of the protein visualising
</li>
</ul>

## uniq_val

The first function focuses on the data inspection. When working with a
big dataset it can be used to check the amount of unique values within a
column. For example, the dataset covid19 is all about the COVID19 cases
and related deaths. The dataset has 28729 observations. Since there are
multiple observations per country it is important to know how many
countries are looked at. This is where uniq_val() comes in. The only
input for the function is the column of which the amount of unique
values should be checked. For our example it would be used as follows.

``` r
# The column with the names of the countries is countriesAndTerritories
uniq_val(covid19$countriesAndTerritories)
```

The 28729 observations are divided over 30 different countries. Good to
know! There are other columns, also indicating a country or region.
uniq_val() can also be used to check if those other columns show the
same amount of unique values, by doing the following.

``` r
# Another column indicating the country is geoId
uniq_val(covid19$countriesAndTerritories) == uniq_val(covid19$geoId)
```

## save_csv_rds

After inspecting the data you might have made a few changes in the R
object, like making it tidy or extracting data that is the most useful
as shown in the following code.

``` r
# Let's say we only want the data of summer 2020 for the Germany and France
covid19_2020 <- covid19 %>% filter(countriesAndTerritories == c("Germany", "France"), year == 2020, month == c(6:8))
covid19_2020$dateRep <- as.Date(covid19_2020$dateRep, "%d/%m/%y")
```

It is important to save your changes for later reference. A good way to
do that is by using the save_csv_rds() function. This saves your
dataframe as both a .csv and .rds file and uses the dataframe and an
outputname as inputs. To use it on our covid19 dataset we would do the
following.

``` r
# In this case we want the outputname to be the same as the dataframe name
save_csv_rds(covid19_2020, "covid19_2020")
```

## graph_jitter

With the data inspected, extracted and saved, graphs can be made. The
ggplot2 package contains all the necessary functions to make a graph.
It’s functions have a lot of different input options for a lot of
different graphs. This means the code for a simple graph can become
quite long. This is where graph_jitter() comes in. The ggplot2 function
position_jitter() uses multiple inputs to create a slight jitter to the
datapoints. This is useful when data overlap makes the graph hard to
read. The graph_jitter() function simplifies this function by only
needing one input which will work for both the height and width of the
jitter. It also sets the seed to keep jitter consistent throughout the
analysis. In the following code chunk the use of graph_jitter() is
shown.

``` r
covid19_2020 %>% ggplot(aes(x = dateRep, y = deaths)) +
  geom_line(aes(group=countriesAndTerritories, color = countriesAndTerritories)) +
  geom_point(aes(color = countriesAndTerritories), position = graph_jitter(0.3)) +
  labs(title = "COVID19 in summer of 2020",
       x = "Date",
       y = "COVID19 related deaths") +
  theme_minimal()
```

<img src="man/figures/README-graph functions-1.png" width="100%" />
*Figure 1. Scatterplot showing the COVID19 related deaths in summer of
2020 in Germany and France.*

## protein_cartoon, protein_stick, protein_sphere and protein_visual

The last three functions use the r3dmol package to create 3D interactive
visualizations of proteins. Each function shows a different style of
visualization. The input is a PDB file turned into an R object using the
readLines() function. The colors are modeled after the PyMol default
colors.
