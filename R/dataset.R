#' Retrieve a bundled dataset
#'
#' [dataset()] returns one of the datasets bundled with
#' [dtlg.data][dtlg.data::dtlg.data-package].
#'
#' @param name A dataset name. See [datasets] for a listing of available
#' options.
#'
#' @returns A bundled dataset as a [tibble][tibble::tibble-package].
#'
#' @examples
#' dataset("adsl_small")
#'
#' @export
dataset <- function(name) {
  path <- dataset_path(dataset = name)
  readRDS(file = path)
}
