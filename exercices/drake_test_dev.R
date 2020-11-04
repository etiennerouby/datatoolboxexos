#####################################################
## Description : SCRIPT for make some Drake project
##
## Author : Etienne Rouby
#####################################################

# Initialize Drake

usethis::use_r(name = "wrangle.R")
usethis::use_r(name = "plots.R")
usethis::use_r(name = "plan.R")

# File create
file.create("_drake.R")

# Directory create
dir.create("output")
dir.create("output/plots")
dir.create("output/text")

# Add needed packages
usethis::use_package("dplyr")
usethis::use_package("ggplot2")
usethis::use_package("magrittr")
usethis::use_package("forcats")
usethis::use_package("fishualize")
usethis::use_package("sf")
usethis::use_package("drake")

# Ignore files
usethis::use_build_ignore(".drake")
usethis::use_build_ignore("_drake.r")
usethis::use_build_ignore("make.R")
usethis::use_git_ignore(".drake")
usethis::use_build_ignore("output/")
usethis::use_build_ignore("text/")





