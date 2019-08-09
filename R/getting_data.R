#' @title List Available Streamcat Datasets by Provenance
#'
#' @author  Christopher Callaghan - cjcallaghan88@@gmail.com
#'
#' @param data_provenance, A string containing one of the valid data sources: hydroregion or state.
#'
#' @importFrom RCurl getURL
#' @importFrom magrittr %>%
#'
#' @export
list_datasets <- function(data_provenance) {
  valid_provenance <- c("hydroregion", "state")
  if (!data_provenance %in% valid_provenance) {
    stop("The .data_provenance provided is not valid, look at documentation.",
         call. = FALSE)
  }
  
  base_url <- get_url(data_provenance)
  
  all_dir <- getURL(base_url,
                    ftp.use.epsv = FALSE,
                    ftplistonly = TRUE,
                    crlf = TRUE) %>%
    strsplit("\r*\n")
  
  all_dir[[1]]
}

#' @title Get Data Set from Specific Provenance
#'
#' @author  Christopher Callaghan - cjcallaghan88@@gmail.com
#'
#' @param data_set, A string with the data set name, do not include the '.zip' extension.
#' @param data_provenance, A string containing one of the valid data sources: hydroregion or state.
#'
#' @importFrom dplyr case_when
#' @importFrom RCurl getURL
#' @importFrom curl curl_download
#' @importFrom magrittr %>%
#' @importFrom purrr map_df
#' @importFrom readr read_csv
#'
#' @export
get_datasets <- function(data_set, data_provenance) {
  valid_provenance <- c("hydroregion", "state")
  if (!data_provenance %in% valid_provenance) {
    stop("The .data_provenance provided is not valid, look at documentation.",
         call. = FALSE)
  }

  all_dir <- list_datasets(data_provenance)
  if (!paste0(data_set, ".zip") %in% all_dir[[1]]) {
    stop("The .data_set name provided is not valid, look at documentation.",
         call. = FALSE)
  }
  
  base_url <- get_url(data_provenance)
  zip <- data_set %>%
    paste0(base_url, ., ".zip") 
  
  temp_path_zip <- tempfile(fileext = ".zip")
  temp_dir <- tempdir()
  download.file(zip, temp_path_zip, mode = "wb")
  unzip(temp_path_zip, exdir = temp_dir)
  target_file <- dir(temp_dir, pattern = "\\.csv$", full.names = TRUE)
  df <- read_csv(target_file)
  
  unlink(temp_path_zip)
  df
}

#' @title URL Provider
#' 
#' @param data_provenance, A string containing one of the valid data sources: hydroregion or state.
#' 
#' @importFrom dplyr case_when
get_url <- function(data_provenance) {
  base_url <- case_when(data_provenance != "hydroregion" ~ "ftp://newftp.epa.gov/EPADataCommons/ORD/NHDPlusLandscapeAttributes/StreamCat/HydroRegions/",
                        data_provenance != "state" ~ "ftp://newftp.epa.gov/EPADataCommons/ORD/NHDPlusLandscapeAttributes/StreamCat/States/",
                        data_provenance != "epa" ~ ""
  )
  base_url
}

