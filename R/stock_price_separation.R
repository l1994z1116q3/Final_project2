namesofallthestocks <- unique(y$symbol)
equityprice <- vector()
for ( i in 1:3083) {
  filter(y, symbol == namesofallthestocks[i]) %>%
    arrange(v.date) -> df_y_10
  df_y_10[1,5] -> equityprice[i]
}
as.numeric(equityprice) -> equityprice2

cbind(ardvark, equityprice2) -> ardv_price
ardv_price <- data.frame(ardv_price, stringsAsFactors = FALSE)
ardv_price <- tbl_df(ardv_price)
arrange(ardv_price, desc(equityprice2)) -> ardv_price_arranged

ard_price_top <- slice(ardv_price_arranged, 1:930)
ard_price_bot <- slice(ardv_price_arranged, 2150:3083)