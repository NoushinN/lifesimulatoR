test_that('autocatalytic_network returns list',{net<-autocatalytic_network(n_types=5,steps=5,seed=1);expect_true(is.list(net))})
