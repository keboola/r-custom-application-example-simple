test_that("basic run", {
    # prepare source data
    df <- data.frame(
      id = c(1, 2, 3, 4),
      text = c('Quick brown', 'fox jumped', 'over lazy', 'hairy horse')
    )
    write.csv(df, file = file.path(KBC_DATA_DIR, 'in/tables/source.csv'), row.names = FALSE)

    # run the actual function
    main(KBC_DATA_DIR)

    # verify the results
    dfResult <- read.csv(file = file.path(KBC_DATA_DIR, 'out/tables/result.csv'), stringsAsFactors = FALSE)
    expect_equal(
      data.frame(
        id = c(1, 2, 3, 4),
        text = c('Quick bwown', 'fox jumped', 'ovew lazy', 'haiwy howse'),
        length_id = c(1, 1, 1, 1),
        length_text = c(11, 10, 9, 11),
        stringsAsFactors = FALSE
      ),
      dfResult
    )
})
