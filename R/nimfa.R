#' Load nimfa library in R
#'
#' @param virtualenv Name of virtualenv
#' @return The nimfa module as a python builtin module
#' @importFrom reticulate py_install
#' @importFrom reticulate use_virtualenv
#' @examples
#' nimfa = install_nimfa()
#' v <- nimfa$examples$medulloblastoma$read(normalize=TRUE)
#' lsnmf <- nimfa$Lsnmf(v, seed="random_vcol", rank=50L, max_iter=100L)
#' lsnmf_fit <- lsnmf()
#' print(lsnmf_fit$fit$rss())
#' @export
install_nimfa <-
    function(virtualenv = "BiocNimfa")
    {
        reticulate::py_install(packages = "nimfa",
                               envname = virtualenv,
                               method = "virtualenv")
     
        reticulate::use_virtualenv(file.path("~/.virtualenvs",
                                                 virtualenv))
        suppressWarnings(reticulate::import("nimfa"))
    }



