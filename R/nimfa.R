#' @importFrom utils packageDescription
#' @importFrom reticulate virtualenv_create virtualenv_install
.install_nimfa <- function(envname) {
    pkgs <- packageDescription(
        "BiocNimfa", fields="PythonRequirements", encoding=NA
    )
    pkgs <- trimws(unlist(strsplit(pkgs, ",")))
    pkgs <- pkgs[!startsWith(pkgs, "Python")]
    virtualenv_create(envname)
    virtualenv_install(envname, pkgs)
}

#' Import python nimfa library for use in R
#'
#' @param envname character(1) name of the virtual environment
#'     (usually under `~/.virtualenvs` where Nimfa and its python
#'     dependencies are available.
#' @return The nimfa module as a python builtin module
#' @importFrom reticulate virtualenv_list use_virtualenv import
#' @examples
#' nimfa = nimfa()
#' v <- nimfa$examples$medulloblastoma$read(normalize=TRUE)
#' lsnmf <- nimfa$Lsnmf(v, seed="random_vcol", rank=50L, max_iter=100L)
#' lsnmf_fit <- lsnmf()
#' lsnmf_fit$fit$rss()
#' @rdname install_nimfa
#' @export
install_nimfa <-
    function(envname = "BiocNimfa")
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

    if (!envname %in% virtualenv_list())
        .install_nimfa(envname)
    use_virtualenv(envname)

    ## import
    import("nimfa")
}

#' @export
#' @rdname install_nimfa
nimfa <-
    function(envname = "BiocNimfa")
{
    if (!envname %in% virtualenv_list())
        stop(
            "'", envname, "' virtual environment not available ",
            "see `?install_nimfa`"
        )
    use_virtualenv(envname)
    import("nimfa")
}
