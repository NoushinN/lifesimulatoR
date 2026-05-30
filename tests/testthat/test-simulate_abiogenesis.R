test_that('simulate_abiogenesis returns data frame',{sim<-simulate_abiogenesis(n_molecules=20,generations=5,seed=1);expect_s3_class(sim,'data.frame')})
