#' Obtain jQuery Core as an HTML dependency
#'
#' @param major_version The major version of jQuery Core. Currrently 1, 2, and 3 are supported.
#' @param minified whether or not to provide a minified JavaScript file.
#'
#' @return A [htmltools::htmlDependency()] object.
#'
#' @importFrom htmltools htmlDependency
#' @export
jquery_core <- function(major_version = 3, minified = getOption("shiny.minified", TRUE)) {
  version <- expand_version(major_version)
  script <- paste0("jquery-", version, if (minified) ".min.js" else ".js")
  htmlDependency(
    "jquery", version,
    src = list(file = file.path("lib", version)),
    package = "jquerylib",
    script = script
  )
}

expand_version <- function(major_version) {
  if (major_version == 3) return("3.6.0")
  if (major_version == 2) return("2.2.4")
  if (major_version == 1) return("1.12.4")
  stop("major_version must be 1, 2, or 3.")
}
