namesofallthestocks <- unique(y$m.ind)
equityprice <- vector()
for ( i in 1:69) {
  filter(y, symbol == namesofallthestocks[i]) %>%
    arrange(v.date) -> df_y_10
  mean(df_y_10[,5], na.rm = TRUE) -> equityprice[i]
}
as.numeric(equityprice) -> equityprice2

cbind(r_df, equityprice2) -> ardv_price
ardv_price <- data.frame(ardv_price, stringsAsFactors = FALSE)
ardv_price <- tbl_df(ardv_price)
arrange(ardv_price, desc(equityprice2)) -> ardv_price_arranged

r_df_price_top <- slice(ardv_price_arranged, 1:21)
r_df_price_bot <- slice(ardv_price_arranged, 47:69)