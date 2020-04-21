
# General parameters used for all scenarios:
flNsamEM = 100
saNsamEM = 100
iniModelyear = 1
nyears = 75
iniFyear = 25 # F positive for iniFyear + 1. fishery and len comps start here. Normal value = 25
maxFyear = 60 
maxF = 0.36
lowF = 0.32
iniSurYear = 36 # ini year for survey index and age comps
CVSur = 0.2
cPar = 2 # for len comps fishery
Fmsy = 0.34
base_K = 0.195
base_Linf = 100
CVgrowth = 0.1

upFway = normalize(x = iniFyear:maxFyear, method = 'range', range = c(0,maxF))
downFway = normalize(x = maxFyear:nyears, method = 'range', range = c(maxF,lowF))

#indexTempG = 1 # 1 is high low high. 2 is low high low	

growthindex_1 = read.csv(paste0('auxFiles/timeseriesgrowth_', 1, '.csv')) # only this will apply in EM
growthindex_2 = read.csv(paste0('auxFiles/timeseriesgrowth_', 2, '.csv'))

growthindex1 = growthindex_1
growthindex2 = growthindex_2

growthindex1$index = normalize(x = growthindex1$index, method = 'range', range = c(-1, 1))
growthindex2$index = normalize(x = growthindex2$index, method = 'range', range = c(-1, 1))

growthindex1$index = growthindex_1$index*base_K*CVgrowth #Decide here
growthindex2$index = growthindex_2$index*base_Linf*CVgrowth #Decide here

write.csv(growthindex1, 'auxFiles/K_env.csv', row.names = FALSE)
write.csv(growthindex2, 'auxFiles/Linf_env.csv', row.names = FALSE)


envIndex = data.frame(Yr = (iniFyear+1):nyears, 
                      Variable = 1,
                      Value = growthindex_1$index[(iniFyear+1):nyears])

growthTempIndex = 'E0'

#if(indexTempG == 1) growthTempIndex = 'E0'
#if(indexTempG == 2) growthTempIndex = 'E1'

# Plot F trend:
years = c(1:nyears)
fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])


png('Figures/Fplot_envindex.png', width = 90, height = 110, units = 'mm', res = 500)
par(mfrow = c(2,1))
par(mar = c(4,4,0.5,0.5))
plot(years, fvals, type = 'l', xlab = '', ylab = 'Fishing mortality (F)', axes = FALSE)
abline(h = Fmsy, lty = 2)
axis(1)
axis(2, las = 2, at = Fmsy, labels = bquote(F[msy]))
box()
#dev.off()

# Plot simulated env index:
# png('Figures/EnvIndexplot.png', width = 90, height = 110, units = 'mm', res = 500)
  par(mar = c(4,4,0.5,0.5))
  plot(growthindex_1$years, growthindex_1$index, type = 'l', xlab = 'Years', ylab = 'PDO', axes = FALSE)
  axis(1)
  axis(2, las = 2)
  #legend('bottomright', legend = 'Pattern1', bty = 'n')
  box()
  # plot(growthindex_2$years, growthindex_2$index, type = 'l', xlab = 'Years', ylab = 'Env index', axes = FALSE)
  # axis(1)
  # axis(2, las = 2)
  # legend('topright', legend = 'Pattern2', bty = 'n')
  # box()
 dev.off()

