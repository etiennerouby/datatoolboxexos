###################################################
#
# Data and Code for the CESAB Datatoolbox Exercices
#
###################################################

# ----- clean workspace
rm(list = ls())

# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
devtools::install(build = FALSE)

# ----- Knit exo dplyr
rmarkdown::render(here::here("exercices","exo_dplyr.Rmd"))

# ----- Knit exo spatial
#rmarkdown::render(here::here("exercices","exo_spatial.Rmd"))

# ----- drake
## Execute plan
drake::r_make()
## Visualize
drake::r_vis_drake_graph(targets_only = TRUE)
drake::r_vis_drake_graph()
