context("Cytometry")

# Tests --------------------------------------------------------
test_that("listWorkspaces", {
  ws <- ALL$listWorkspaces()

  expect_is(ws, "data.table")
  expect_gt(nrow(ws), 0)
})

test_that("listGatingSets", {
  gs <- ALL$listGatingSets()

  expect_is(gs, "data.table")
  expect_gte(nrow(gs), 0)
})

test_that("summarizeCyto", {
  expect_output(ALL$summarizeCyto(), "FCS sample files")
})

# test_that("summarizeGatingSet", {
#
# })

# test_that("loadGatingSet", {
#
# })
