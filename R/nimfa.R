#' Load nimfa library in R
#'
#' @param virtualenv Name of virtualenv
#' @return The nimfa module as a python builtin module
#' @importFrom reticulate use_virtualenv
#' @importFrom reticulate import
#' @importFrom reticulate virtualenv_create
#' @importFrom reticulate virtualenv_install
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
    is_windows <- identical(.Platform$OS.type, "windows")
    is_osx <- Sys.info()["sysname"] == "Darwin"
    is_linux <- identical(tolower(Sys.info()[["sysname"]]), "linux")
    if (!is_windows && !is_osx && !is_linux) {
        stop(
            "Unable to install 'Nimfa' on this platform. ",
            "Binary installation is available for Windows, macOS, and Linux"
        )
    }
    ## Test if package is present
    if (file.exists(virtualenv)) {
        ## Use virtualenv
        reticulate::use_virtualenv(
            virtualenv = file.path("~/.virtualenvs", virtualenv)
        )
    } else {
        ## Create and install package, but package needs all dependencies
        reticulate::virtualenv_install(
            envname = virtualenv, packages = c("nimfa")
        )
        reticulate::use_virtualenv(file.path("~/.virtualenvs", virtualenv))
    }
    ## import
    reticulate::import("nimfa")
}
