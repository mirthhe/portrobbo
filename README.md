
<!-- README.md is generated from README.Rmd. Please edit that file -->

# The portrobbo package :anchor:

The functions within this package can be used to speed up work and
shorten code. It has originally been made to support a
[portfolio](https://mirthhe.github.io/) and the assignments within it
but the functions are short and to the point, making them useful for
various situations.

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
protein_sphere
</li>
<li>
protein_stick
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

The package also contains two data objects:

[COVID19](https://github.com/mirthhe/portrobbo/blob/main/data/covid19.rda),
a dataframe containing COVID19 cases and deaths in multiple European
countries. The data came from the
[ECDC](https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide).
It was imported using [this
code](https://github.com/mirthhe/portrobbo/blob/main/data-raw/covid19.R)
and is used to show the functionality of uniq_val(), save_csv_rds() and
graph_jitter().

[Kinesin](https://github.com/mirthhe/portrobbo/blob/main/data/kinesin.rda),
an R object containing the PDBx file 3COB. The
[data](https://github.com/mirthhe/portrobbo/blob/main/data-raw/3cob.pdb)
came from the [RCSB PDB](https://www.rcsb.org/structure/3COB). It was
imported using [this
code](https://github.com/mirthhe/portrobbo/blob/main/data-raw/kinesin.R)
and is used to show the functionality of the protein visualizing
functions.

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
covid19_2020 <- covid19 %>% filter(countriesAndTerritories == 
                                     c("Germany", "France"), 
                                   year == 2020, month == c(6:8))
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
It???s functions have a lot of different input options for a lot of
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

<i>Figure 1. Scatterplot showing the COVID19 related deaths in summer of
2020 in Germany and France.</i>

## Protein visualization functions

The last three functions use the
[r3dmol](https://github.com/swsoyee/r3dmol) package to create 3D
interactive visualizations of proteins. Each function shows a different
style of visualization. The input is a PDB file turned into an R object
using the readLines() function. For this example we will be looking at
my favorite protein, kinesin, which is included in the package. The PDBx
file for kinesin was taken from
[3COB](https://www.rcsb.org/structure/3COB) in the RCSB database. The
colors are modeled after the PyMol default colors.

Because of the limitations of this README file when it comes to showing
HTML output, the results of these functions will not be shown in this
page. To see the interactive visualizations visit [this
page](https://mirthhe.github.io/Workflows_Portfolio_Free.html#applying-in-r).

### protein_cartoon

The first visualization is the cartoon style. It is a simplified version
where sidechains are ignored. Only the backbone is shown with the alpha
helices as coils and the beta sheets as arrows.

``` r
protein_cartoon(kinesin)
```

### protein_sphere

Spheres, unlike cartoon, shows the atoms. Each atom is shown as a
sphere. The size of each sphere is decided by the atoms electron
orbitals. This can be used to show packing and spheric hindrance but
doesn???t show the interior. The colors indicate different atoms, in the
default settings carbon atoms are green, nitrogen is blue, oxygen is
red, etc.

``` r
protein_sphere(kinesin)
```

### protein_stick

The last visual style will be sticks, this shows the chemical structure.
The colors still indicate the same atoms as they did for the sphere
style.

``` r
protein_stick(kinesin)
```

### protein_visual

A big downside of these visualizations is how none of them show a
complete picture. Cartoon style doesn???t show the atoms, sphere styles
doesn???t show the chemical structure and stick style doesn???t show the
sferic hindrance. Because of this, one more function was made, to
combine the stick and sphere visuals in a way that clearly shows both of
them. To do this they were combined in one function with the stick
visual on full opacity and the sphere visual on an opacity of 0.7. The
clarity of the spherical style could be better and the overlap
definitely has a negative effect on the readability, but the combination
still gives a good overview of the protein???s 3D structure.

``` r
protein_visual(kinesin)
```
