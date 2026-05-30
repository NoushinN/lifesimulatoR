test_that('protocell_simulation returns data frame',{sim<-protocell_simulation(n_cells=5,steps=5,seed=1);expect_s3_class(sim,'data.frame')})
