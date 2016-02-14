##======================================================================
## Script to check and build the `FishMaps2` package
##======================================================================

##----------------------------------------------------------------------
## Set working directory
if (!basename(getwd()) == "FishMaps2") {
    stop("The working directory isn't /FishMaps2")
}

##----------------------------------------------------------------------
## Packages
library(devtools)
library(knitr)

##----------------------------------------------------------------------
## Run checks

## Load the package (to make functiona available)
load_all()

## Create/update NAMESPACE, *.Rd files.
document()

## Check documentation.
check_man()

## Check functions, datasets, run examples, etc. Using cleanup = FALSE
## and check_dir = "../" will create a directory named FishMaps.Rcheck
## with all the logs, manuals, figures from examples, etc.
check(cleanup = FALSE, manual = TRUE, vignettes = FALSE,
      check_dir = "../")

## Examples
# Run examples from all functions of the package
# run_examples()
# Run examples from a specific function
# dev_example("yscale.components.right")

## Show all exported objects.
ls("package:FishMaps2")
packageVersion("FishMaps2")

## Build the package (it will be one directory up)
build(manual = TRUE, vignettes = FALSE)
# build the binary version for windows (not used)
# build_win() # not used here. see below

##----------------------------------------------------------------------
## Test installation.

## Test install with install.packages()
pkg <- paste0("../FishMaps2_", packageVersion("FishMaps2"), ".tar.gz")
install.packages(pkg, repos = NULL)

##----------------------------------------------------------------------
## Generate README.md
knit(input = "README.Rmd")

##----------------------------------------------------------------------
## Sending package tarballs and manual to remote server to be
## downloadable

## Create Windows version
pkg.win <- paste0("../FishMaps2_", packageVersion("FishMaps2"), ".zip")
cmd.win <- paste("cd ../FishMaps2.Rcheck && zip -r", pkg.win, "FishMaps2")
system(cmd.win)

## Link to manual
man <- "../FishMaps2.Rcheck/FishMaps2-manual.pdf"

## Send to downloads/ folder
dest <- "downloads/"
file.copy(c(pkg, pkg.win, man), dest, overwrite = TRUE)
##----------------------------------------------------------------------
