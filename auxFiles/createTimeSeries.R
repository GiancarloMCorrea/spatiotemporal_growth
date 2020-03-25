require(r4ss)
require(ggplot2)
require(BBmisc)

setwd('C:/Users/moroncog/Documents/ss3sim_spatial/auxFiles')

nyears = 75
rangestd = 0.025
#AR.mods <- arima.sim(n = nyears, list(ar=c(0.7,0.2), ma = c(-0.6, 0.6)))

# First temporal pattern
tmp1 = c(rep(rangestd, times = 25), rep(-rangestd, times = 25), rep(rangestd, times = 25))
tmp11 = tmp1 + rnorm(n = nyears, mean = 0, sd = 0.25*rangestd)
#plot(tmp11, type = 'l')

# Second temporal pattern
tmp2 = c(rep(-rangestd, times = 25), rep(rangestd, times = 25), rep(-rangestd, times = 25))
tmp22 = tmp2 + rnorm(n = nyears, mean = 0, sd = 0.25*rangestd)
#plot(tmp22, type = 'l')

#newts = normalize(x = as.vector(AR.mods), method = 'range', range = c(-1*rangestd, rangestd))
#obsts = newts + rnorm(n = nyears, mean = 0, sd = 0.25*rangestd)

#plot(newts, type = 'l')
#lines(obsts, col = 'gray50')
# standarize between -0.2 and 0.2 to use a exp relationship 

dfout1 = data.frame(years = 1:nyears, index = tmp11)
dfout2 = data.frame(years = 1:nyears, index = tmp22)

write.csv(dfout1, 'timeseriesgrowth_1.csv', row.names = FALSE)
write.csv(dfout2, 'timeseriesgrowth_2.csv', row.names = FALSE)