#dataframe <- r_df
#dataframe <- ardvark
final_sort_6 <- function(dataframe) {
  r_df_6 <- dataframe
  r_df_6[] <- lapply(dataframe, as.character)
  r_df_6[] <- lapply(r_df_6, as.numeric)
  
  c_n  = colnames(dataframe)
  
  test_object <- vector()
  #######  
  t_means <- vector()
  b_means <- vector()
  for(i in 2:115){
    
    current_month <- c_n[i]
    trailing_1 <- c_n[i-1]
    trailing_2 <- c_n[i-2]
    trailing_3 <- c_n[i-3]
    trailing_4 <- c_n[i-4]
    trailing_5 <- c_n[i-5]
    
    #i <- 2
    if(i == 2) {
      call <- substitute(mutate(r_df_6, trailing_mean = (temp)/1,na.rm = TRUE),
                         list(temp = as.name(current_month) ))
    }
    if(i == 3) {
      call <- substitute(mutate(r_df_6, trailing_mean = (temp +temp1)/2,na.rm = TRUE),
                         list(temp = as.name(current_month), temp1 = as.name(trailing_1) ))
    }
    if(i == 4) {
      call <- substitute(mutate(r_df_6, trailing_mean = (temp +temp1 + temp2)/3,na.rm = TRUE),
                         list(temp = as.name(current_month), temp1 = as.name(trailing_1),temp2 = as.name(trailing_2) ))
    }
    if(i == 5) {
      call <- substitute(mutate(r_df_6, trailing_mean = (temp +temp1 + temp2 +temp3)/4,na.rm = TRUE),
                         list(temp = as.name(current_month), temp1 = as.name(trailing_1),temp2 = as.name(trailing_2),
                              temp3 = as.name(trailing_3) ))
    }
    if(i == 6) {
      call <- substitute(mutate(r_df_6, trailing_mean = (temp +temp1 + temp2 +temp3 + temp4)/5,na.rm = TRUE),
                         list(temp = as.name(current_month), temp1 = as.name(trailing_1),temp2 = as.name(trailing_2),
                              temp3 = as.name(trailing_3), temp4 = as.name(trailing_4) ))
    }
    ########
    
    
    if(i>6)
      call <- substitute(mutate(r_df_6, trailing_mean = (temp +temp1 + temp2 +temp3 + temp4 + temp5)/6,na.rm = TRUE),
                         list(temp = as.name(current_month), temp1 = as.name(trailing_1),temp2 = as.name(trailing_2),
                              temp3 = as.name(trailing_3), temp4 = as.name(trailing_4), temp5 = as.name(trailing_5) ))
    
    
    
    temp_df_industry_6_calcs <- eval(call)
    arrange(temp_df_industry_6_calcs, desc(trailing_mean)) -> t_df_6
    sum(is.na(t_df_6$trailing_mean)) -> numberofna
    #sum(is.na(df_arranged$January.1998)) -> numberofna
    numberofna <- as.numeric(numberofna)
    nrow(dataframe) -> numberofrows
    adjusted <- numberofrows*.3
    t_frame <- (numberofrows - adjusted) - numberofna
    b_frame <- numberofrows - numberofna
    df_arranged_top <- t_df_6[1:adjusted,]
    df_arranged_bot <- t_df_6[t_frame:b_frame,]
    ######
    call <- substitute(mutate(df_arranged_top, abc = (f1+f2+f3+f4+f5+f6)/6, na.rm = TRUE),
                       list(f1 = as.name(c_n[i+1]), f2 = as.name(c_n[i+2]),
                            f3 = as.name(c_n[i+3]), f4 = as.name(c_n[i+4]),
                            f5 = as.name(c_n[i+5]), f6 = as.name(c_n[i+6])))
    
    df_arranged_top_f <- eval(call)
    mean(df_arranged_top_f$abc, na.rm = T) -> t_means[i]
    ######
    call <- substitute(mutate(df_arranged_bot, abc = (f1+f2+f3+f4+f5+f6)/6, na.rm = TRUE),
                       list(f1 = as.name(c_n[i+1]), f2 = as.name(c_n[i+2]),
                            f3 = as.name(c_n[i+3]), f4 = as.name(c_n[i+4]),
                            f5 = as.name(c_n[i+5]), f6 = as.name(c_n[i+6])))
    
    df_arranged_bot_f <- eval(call)
    mean(df_arranged_bot_f$abc, na.rm = T) -> b_means[i]
    
  }
  
  #industry66<-tbl_df(industry66)
  
  means_df_6 <- cbind(t_means, b_means, stringsAsFactors = FALSE)
  means_df_6 <- data.frame(means_df_6)
  means_df_6 <- tbl_df(means_df_6)
  mutate(means_df_6, difference = (t_means-b_means)) -> means_df_6
  
  mean(means_df_6$difference, na.rm = TRUE)
}

