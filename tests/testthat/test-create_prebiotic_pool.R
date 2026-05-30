test_that('create_prebiotic_pool returns correct length',{pool<-create_prebiotic_pool(n_molecules=50,seed=123);expect_length(pool,50)})
