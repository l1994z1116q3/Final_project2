t2 <- matrix(c(stock_top_1, stock_top_6, industry_top_1, industry_top_6, stock_bot_1, stock_bot_6, industry_bot_1, industry_bot_6), ncol=2,byrow=TRUE)
rownames(t2) <- c("Individual Stock-High Price","Industry-High Price", "Individual Stock-Low Price","Industry-Low Price")
colnames(t2) <- c("1,1", "6,6")
t2 <- as.table(t2)
t2 -> t3
