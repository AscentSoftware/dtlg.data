#' dtlg.data datasets
#'
#' @description
#'
#' `datasets` is a table listing datasets bundled with
#' [dtlg.data][dtlg.data::dtlg.data-package]. Data is generated with the
#' [random.cdisc.data][random.cdisc.data::random.cdisc.data-package] package.
#'
#' Use the `name` field as input to [dataset()] to retrieve that dataset into
#' memory.
#'
#' @format A [tibble][tibble::tibble-package] of bundled datasets of 4
#'   variables:
#'
#' \describe{
#' \item{`name`}{Name of the dataset.}
#' \item{`nrow`}{Number of observations in the dataset.}
#' \item{`ncol`}{Number of variables in the dataset.}
#' \item{`description`}{Brief description of the dataset.}
#' }
#'
#' @examples
#' datasets
#'
"datasets"
