t2 <- matrix(c(stock_1, stock_6, ind_1, ind_6), ncol=2,byrow=TRUE)
rownames(t2) <- c("Individual Stock","Industry")
colnames(t2) <- c("1,1", "6,6")
t2 <- as.table(t2)
t2


