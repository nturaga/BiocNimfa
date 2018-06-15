context("BiocNimfa")

test_that("nimfa loads and performs basic test", {
    nimfa = install_nimfa()
    v <- nimfa$examples$medulloblastoma$read(normalize=TRUE)
    lsnmf <- nimfa$Lsnmf(v, seed='random_vcol', rank=50L, max_iter=100L)
    lsnmf_fit <- lsnmf()
    # expect_equal(lsnmf_fit$fit$rss(), 0.2668)
    # expect_equal(lsnmf_fit$fit$evar(), 0.9997)
    # expect_equal(lsnmf_fit$distance(metric='kl'), 38.8744)
    expect_equal(round(lsnmf_fit$fit$sparseness()[[1]][1], 1), 0.7)
    expect_equal(round(lsnmf_fit$fit$sparseness()[[2]][1], 1), 0.8)
})


test_that("nimfa class is a python.builtin.module", {
    nimfa <- install_nimfa()
    expect_is(nimfa, "python.builtin.module")
    expect_is(nimfa, "python.builtin.object")
})


test_that("nimfa is installed and file exists", {
    nimfa <- install_nimfa()
    expect_true(file.exists("~/.virtualenvs/BiocNimfa/"))
})
