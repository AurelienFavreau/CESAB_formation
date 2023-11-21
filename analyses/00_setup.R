## Installation de 'rcompendium' ----
install.packages("rcompendium")
install.packages("gh")

## Chargement du package -----
library("rcompendium")
library("gh")


## Stockage de vos informations ----
set_credentials(given    = "Aurelien",
                family   = "Favreau", 
                email    = "afavreau@ifremer.fr", 
                protocol = "ssh")

options()$"email"
gh::gh_whoami()

## Open ~/.Renviron file ----
usethis::edit_r_environ()
usethis::edit_r_profile()

add_description()
add_license(license = "GPL-2")
add_compendium(compendium = c("data", "analyses", "R", "figures", "outputs"))
usethis::use_r("load_data_fct")

### Load data ###
source("R/load_data_fct.R")
load_data(name_base_data = "pantheria", filename = "PanTHERIA_1-0_WR05_Aug2008.txt")  
load_data(name_base_data = "wildfinder", filename = "wildfinder-ecoregions_list.csv")  
load_data(name_base_data = "wildfinder", filename = "wildfinder-ecoregions_species.csv")  
load_data(name_base_data = "wildfinder", filename = "wildfinder-mammals_list.csv")  

### Funtion documentation
library(roxygen2)
devtools::document()

### Add dependance 
add_dependencies(compendium = ".")


### Chargement projet 
## Installation des packages manquants ----
remotes::install_deps(upgrade = "never")

## Chargement des packages et fonctions R ----
devtools::load_all()

## Ajout d'un makefile ----
add_makefile()

## Ajout d'un script R ----
utils::file.edit(here::here("analyses", "download-data.R"))

add_readme_rmd(type = "compendium")
rmarkdown::render("README.Rmd")


rcompendium::add_to_gitignore()


### Test toto git commit