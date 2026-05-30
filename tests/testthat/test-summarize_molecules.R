test_that('summarize_molecules returns data frame',{x<-summarize_molecules(c('AUGC','UUUU'),generation=0);expect_s3_class(x,'data.frame')})
