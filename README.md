

# FishMaps2 0.1.0

[![Build Status](https://travis-ci.org/rodrigosantana/FishMaps2.svg)](https://travis-ci.org/rodrigosantana/FishMaps2)

Plots Fishery Data into Maps

## Introduction

FishMaps2 was designed to plot georeferenced fishery data (e.g. catch,
effort and CPUE) into maps.

## Download and install

### Linux/Mac

Use the `devtools` package (available from
[CRAN](http://cran-r.c3sl.ufpr.br/web/packages/devtools/index.html)) to
install automatically from the official Git repository:


```r
library(devtools)
install_github("rodrigosantana/FishMaps2")
```

Alternatively, download the package tarball: [FishMaps2_0.1.0.tar.gz][]
and run from a UNIX terminal (make sure you are on the container file
directory):


```
R CMD INSTALL -l /path/to/your/R/library FishMaps2_0.1.0.tar.gz
```

Or, inside an `R` session:


```
install.packages("FishMaps2_0.1.0.tar.gz", repos = NULL,
                 lib.loc = "/path/to/your/R/library",
                 dependencies = TRUE)
```

Note that `-l /path/to/your/R/library` in the former and `lib.loc =
"/path/to/your/R/library"` in the latter are optional. Only use it if you
want to install in a personal library, other than the standard R
library.

### Windows

Download Windows binary version: [FishMaps2_0.1.0.zip][] (**do not unzip
it under Windows**), put the file in your working directory, and from
inside `R`:


```
install.packages("FishMaps2_0.1.0.zip", repos = NULL,
                 dependencies = TRUE)
```

## Documentation

The reference manual in PDF can be found here: [FishMaps2-manual.pdf][]

## License

This package is released under the
[GNU General Public License (GPL) v. 3.0](http://www.gnu.org/licenses/gpl-3.0.html)




[FishMaps2_0.1.0.tar.gz]: https://github.com/rodrigosantana/FishMaps2/blob/master/downloads/FishMaps2_0.1.0.tar.gz?raw=true
[FishMaps2_0.1.0.zip]: https://github.com/rodrigosantana/FishMaps2/blob/master/downloads/FishMaps2_0.1.0.zip?raw=true
[FishMaps2-manual.pdf]: https://github.com/rodrigosantana/FishMaps2/raw/master/downloads/FishMaps2-manual.pdf
