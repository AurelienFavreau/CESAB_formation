#' Download panTHERIA or Wildfinder dataset
#'
#' @param overwrite 
#' @description 
#' This function downloads the PanTHERIA or Wildfinder datasets (text file) hosted on the 
#' GitHub repository <https://github.com/rdatatoolbox/datarepo/>. The file
#' won't be downloaded if already exists locally (except if `overwrite = TRUE`).
#' 
#' @param overwrite a `logical`. If `TRUE`, the file will be downloaded again 
#' and the previous version will be replaced.
#'
#' @param name_base_data can be PanTHERIA or Wildfinder given the data we want to download
#' @param filename is the name of the datafile to download
#' 
#' @return No return value.
#' @export


load_data <- function(overwrite = FALSE, name_base_data, filename) {
  
  ## Destination ---- 
  path <- here::here("data", name_base_data)
  ## File name ----
  filename <- filename
  ## GitHub URL ----
  url <- paste0("https://raw.githubusercontent.com/rdatatoolbox/datarepo/main/",
                "data/",name_base_data,"/")
  if (file.exists(file.path(path, filename)) && !overwrite) {
    ## Check if exists locally ----
    message("The filename already exists. Use 'overwrite = TRUE' to replace it")
    
  } else {
    
    ## Create destination folder ----
    dir.create(path, showWarnings = FALSE, recursive = TRUE)
    ## Download file ----
    utils::download.file(url      = paste0(url, filename),
                         destfile = file.path(path, filename),
                         mode     = "wb")}
  invisible(NULL)}



