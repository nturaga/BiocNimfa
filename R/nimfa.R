#' Load nimfa library in R
#'
#' @importFrom reticulate use_virtualenv
#' @importFrom reticulate import
#' @importFrom reticulate virtualenv_create
#' @importFrom reticulate virtualenv_install
#' @examples
#' nimfa = load_nimfa()
#' v <- nimfa$examples$medulloblastoma$read(normalize=TRUE)
#' lsnmf <- nimfa$Lsnmf(v, seed="random_vcol", rank=50L, max_iter=100L)
#' lsnmf_fit <- lsnmf()
#' print(lsnmf_fit$fit$rss())
#' @export
load_nimfa<-
    function(virtualenv = "BiocNimfa")
    {
        ## Test if package is present
        if(file.exists(virtualenv)){
            ## Use virtualenv
            reticulate::use_virtualenv(
                virtualenv = file.path("~/.virtualenvs/", virtualenv))
        } else {
            ## Create and install package, but package needs all dependencies
            reticulate::virtualenv_install(envname = virtualenv,
                                           packages = c("nimfa"))
            reticulate::use_virtualenv(file.path("~/.virtualenvs", virtualenv))
        }
        ## import
        reticulate::import("nimfa")
    }


