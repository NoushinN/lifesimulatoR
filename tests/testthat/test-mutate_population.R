test_that('mutate_population preserves size',{pop<-c('AUGC','UUUU','AAAA');out<-mutate_population(pop,mutation_rate=0.1);expect_length(out,length(pop))})
