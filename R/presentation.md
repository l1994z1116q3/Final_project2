Do Industries Explain Momentum?
========================================================
author: James Reed Sawyer,  Johnson Nei
date: January 28, 2015

History
========================================================
- 1993 Jegadeesh and Titman find that a momentum strategy, which buys past winning stocks and sells past losing stocks, can yield significant returns.
- 1999 Moskowitz and Grinblatt find that industry momentum is the source of momentum trading profits. By looking at winning and losing industries instead of just stocks, they demonstrated that individual stock momentum is not as profitable after controlling industry momentum.
- 2009 Paul Fraulo and Jimmy Nguyen found no correlation between industry size and optimal time horizon of industry momentum strategy
- 2015 Johnson Nei and James Reed Sawyer replicate Moskowitz and Grinblatt's findings, yielding similar results and proving that stock momentum is indeed not so profitable after controlling for industry momentum.

Moskowitz and Grinblatt's Findings
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Project Description
========================================================
- Using US capital stocks between 1998-01-02 and 2001-11-06, we repicate Moskowitz and Grinblatt's results and find that industry momentum strategies indeed yield significant returns and account for for most of the profits from individual stock momentum strategies.
- We also find that industry momentum strategies yield different results based on the price of a specific industry, showing that the higher the price, the higher the return ??????????????

Project Implementation
========================================================
- Since the data we are given have some unbelievable outliers and is arranged by date, we first clean and arrange our data into months, we will call this data monthly individual stock data.
- We then separate a copy and arrange that copy's data by industry which we will call monthly industry data.
- We write functions to find the returns for one month and six months on the monthly individual stock data.
- Similarly we alter the functions to apply to the monthly industry data.

Individual Stock / Industry
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```
As you can see, our results show that Industry Momentum does indeed account for the profits in Individual Stock Momentum.

Plot
========================================================

![plot of chunk unnamed-chunk-3](presentation-figure/unnamed-chunk-3-1.png) 

Are Industry Returns Affected by Price?
========================================================
- Hypothesis: higher priced industries's general higher price will allow these industries to overcome market inefficiency relatively faster than industries with lower priced stocks, due to the higher priced stock results in higher capital circulation (overlooking stock quantity), they will have more capital to maintain the inefficiencies.
- We test for this effect by grouping our industries into 3 categories by stock price: small, medium, and large.
- We ran our (1,1) and (6,6) industry momentum strategies on each group, and found


Plot
========================================================

![plot of chunk unnamed-chunk-4](presentation-figure/unnamed-chunk-4-1.png) 

Credits
========================================================
- David Kane
- Yuanchu Dang
- Econ 20 Class
- Johnson Nei/James Reed Sawyer
