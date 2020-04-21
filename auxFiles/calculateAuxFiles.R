setwd('C:/Users/moroncog/Documents/ss3sim_spatial/auxFiles')

data4 = read.csv('paccod_age_1994_2016.csv')

data4$YEAR = as.factor(data4$YEAR)

# fit vonBertalanfy growth equation :
data4$AGE = as.numeric(data4$AGE)
data4$LENGTH = data4$LENGTH/10 #OJO, only once 
stdage = 0:17

outd = NULL

fac = unique(data4$YEAR)
for(i in seq_along(fac)){
  
  selyr = fac[i]
  tmp = data4[data4$YEAR == selyr, ]
  #xa = nls(formula = LENGTH ~ Linf + (L_min - Linf)*exp(-Kpar*(AGE - 1.5)),
  #    data = tmp, start = list(Linf = 100, L_min = 16.4, Kpar = 0.195))
  xa = nls(formula = LENGTH ~ Linf + (L_min - Linf) + Linf*(1 - exp(-Kpar*(AGE - 1.5))),
      data = tmp, start = list(Linf = 100, L_min = 16.4, Kpar = 0.195))
  pred1 = as.numeric(xa$m$getPars()[1])
  pred2 = as.numeric(xa$m$getPars()[2]) 
  pred3 = as.numeric(xa$m$getPars()[3])
  predlen = pred1 * (1-exp(-pred2*(stdage-pred3)))
  tmp5 = data.frame(AGE = stdage, LENGTH = predlen, YEAR = selyr,
                    linf = pred1, k = pred2, t0 = pred3) 
  outd = rbind(outd, tmp5)
  print(i)  
}

outd$YEAR = as.factor(outd$YEAR)
data4$YEAR = as.factor(data4$YEAR)

require(ggplot2)

  ggplot(data4, aes(x = AGE, y = LENGTH)) +
          geom_point(aes(colour = AGE), size = 0.7) +
          facet_wrap( ~ YEAR, ncol = 4) + # print in a loop
          geom_line(data = outd,
            aes(x = AGE, y = LENGTH),
            color = "black", size = 0.85) 

