test_that('replicate_molecules returns requested size',{pop<-c('AUGC','UUUU','AAAA');out<-replicate_molecules(pop,n_molecules=20,selection_strength=1);expect_length(out,20)})
