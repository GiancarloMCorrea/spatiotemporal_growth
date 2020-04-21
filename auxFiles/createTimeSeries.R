require(r4ss)
require(ggplot2)
require(BBmisc)

setwd('C:/Users/moroncog/Documents/ss3sim_spatial/auxFiles')

# nyears = 75
# rangestd = 1
# #AR.mods <- arima.sim(n = nyears, list(ar=c(0.7,0.2), ma = c(-0.6, 0.6)))

# # First temporal pattern (for k)
# tmp1 = c(rep(rangestd, times = 15), 
# 		 rep(-rangestd, times = 15), 
# 		 rep(rangestd, times = 15),
# 		 rep(-rangestd, times = 15),
# 		 rep(rangestd, times = 15))
# tmp11 = tmp1 + rnorm(n = nyears, mean = 0, sd = 0.25*rangestd) # for K
# #plot(tmp11, type = 'l')

# # Second temporal pattern (for Linf)
# #tmp2 = c(rep(-rangestd, times = 25), rep(rangestd, times = 25), rep(-rangestd, times = 25))
# tmp22 = tmp11*-1 # (for Linf)
# #plot(tmp22, type = 'l')

# #newts = normalize(x = as.vector(AR.mods), method = 'range', range = c(-1*rangestd, rangestd))
# #obsts = newts + rnorm(n = nyears, mean = 0, sd = 0.25*rangestd)

# #plot(newts, type = 'l')
# #lines(obsts, col = 'gray50')
# # standarize between -0.2 and 0.2 to use a exp relationship 

# dfout1 = data.frame(years = 1:nyears, index = tmp11)
# dfout2 = data.frame(years = 1:nyears, index = tmp22)

# write.csv(dfout1, 'timeseriesgrowth_1.csv', row.names = FALSE)
# write.csv(dfout2, 'timeseriesgrowth_2.csv', row.names = FALSE)



# --------------------------------------------------------------------
# PDO index:

pdoindex = read.csv('pdo_index.csv')
pdoindex = pdoindex[which(pdoindex$Date == '197001'):which(pdoindex$Date == '201912'), ]
pdoindex$index = rep(1970:2019, each = 12)

tmp = tapply(X = pdoindex$Value, INDEX = pdoindex$index, FUN = mean)
newdat = data.frame(years = names(tmp), value = as.vector(tmp))
#newdat$index2 = normalize(x = newdat$value, method = 'range', range = c(-1, 1))

newdata2 = data.frame(years = 1:75, index = c(rep(0, times = 25), newdat$value))
newdata3 = newdata2
newdata3$index = newdata3$index * -1

write.csv(newdata2, 'timeseriesgrowth_1.csv', row.names = FALSE)
write.csv(newdata3, 'timeseriesgrowth_2.csv', row.names = FALSE)

