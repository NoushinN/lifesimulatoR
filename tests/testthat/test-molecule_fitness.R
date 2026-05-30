test_that('molecule_fitness returns numeric vector',{x<-molecule_fitness(c('AUGC','UUUU'));expect_type(x,'double');expect_length(x,2)})
