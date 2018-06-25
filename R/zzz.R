#' @export
nimfa <- NULL

.onLoad <-
    function(libname, pkgname)
{
    nimfa <<- reticulate::import("nimfa", delay_load = TRUE)
}
