table1 <- function(){
##### Avg.Ind.Ret
r_df_matrix <- as.matrix(r_df)
r_df_matrix_df <- data.frame(r_df_matrix, stringsAsFactors = FALSE)
r_df_matrix_df <- tbl_df(r_df_matrix_df)
#r_df_matrix_df <- as.numeric(r_df_matrix_df)
#rowMeans(r_df_matrix_df)
#as.numeric(r_df_matrix_df) -> r_df_matrix_df
Avg.Ind.Ret <- vector()
for(i in 1:69) {
  mean(as.numeric(r_df_matrix_df[i,]), na.rm = TRUE) -> Avg.Ind.Ret[i]
}

###### Avg.Mkt.Cap

stock_symbols <- unique(y$symbol)
stock_caps <- vector()

for(i in 1:3083) {
  filter(y, symbol == stock_symbols[i]) -> y1
  mean(y1$cap.usd, na.rm = TRUE) -> stock_caps[i]
}

sum(stock_caps, na.rm = TRUE) -> total_cap
stock_industries <- vector()
percentofcap <- vector()
for(i in 1:3083) {
  filter(y, symbol == stock_symbols[i]) -> y1
  unique(y1$m.ind) -> stock_industries[i]
  mean(y1$cap.usd, na.rm = TRUE) -> stock_caps
  percentofcap[i] <- stock_caps/total_cap
}


cbind(stock_industries, percentofcap) -> ohmygodihatethisstuff
df_cap_prec <- data.frame(ohmygodihatethisstuff)
df_cap_prec <- tbl_df(df_cap_prec)
as.character(unique(df_cap_prec$stock_industries)) -> i_list_prec
Avg.Mkt.Cap <- vector()
df_cap_prec$stock_industries <- as.character(df_cap_prec$stock_industries)
for(i in 1:69) {
  filter(df_cap_prec, stock_industries == i_list_prec[i]) -> df_cap_prec2
  as.numeric(levels(df_cap_prec2$percentofcap))[df_cap_prec2$percentofcap] -> df_cap_prec2
  sum(df_cap_prec2, na.rm = TRUE) -> Avg.Mkt.Cap[i]
}
cbind(i_list_prec, Avg.Mkt.Cap) -> Avg.Mkt.Cap_df
Avg.Mkt.Cap_df <- data.frame(Avg.Mkt.Cap_df)
Avg.Mkt.Cap_df <- tbl_df(Avg.Mkt.Cap_df)
arrange(Avg.Mkt.Cap_df, desc(Avg.Mkt.Cap)) -> Avg.Mkt.Cap_df

###### Avg.No.Stocks
alldemindustries <- unique(y$m.ind)
Avg.No.Stocks <- vector()
for(i in 1:69) {
  filter(y, m.ind == alldemindustries[i]) -> yindstuf
length(unique(yindstuf$symbol)) -> Avg.No.Stocks[i]
}
##### Final Combine
my_final_form <- cbind(alldemindustries, Avg.No.Stocks, Avg.Mkt.Cap, Avg.Ind.Ret)
my_final_form <- data.frame(my_final_form)
my_final_form <- tbl_df(my_final_form)
my_final_form <- arrange(my_final_form, desc(Avg.Mkt.Cap))
this_isnt_even <- slice(my_final_form, 1:20)
}
