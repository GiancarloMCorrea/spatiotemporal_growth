
# General parameters used for all scenarios:
flNsamEM = 500
saNsamEM = 500
iniModelyear = 1
nyears = 75
iniFyear = 0 # F positive for iniFyear + 1. fishery and len comps start here. Normal value = 25
maxFyear = 60 
maxF = 0.35
lowF = 0.25
iniSurYear = 36 # ini year for survey index and age comps
CVSur = 0.2
cPar = 2 # for len comps fishery
Fmsy = 0.3

upFway = normalize(x = iniFyear:maxFyear, method = 'range', range = c(0,maxF))
downFway = normalize(x = maxFyear:nyears, method = 'range', range = c(maxF,lowF))

indexTempG = 1 # 1 is high low high. 2 is low high low	
growthindex = read.csv(paste0('auxFiles/timeseriesgrowth_', indexTempG, '.csv'))

if(indexTempG == 1) growthTempIndex = 'E0'
if(indexTempG == 2) growthTempIndex = 'E1'

# Plot F trend:
years = c(1:nyears)
fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])


png('Figures/Fplot.png', width = 90, height = 70, units = 'mm', res = 500)
par(mar = c(4,4,0.5,0.5))
plot(years, fvals, type = 'l', xlab = 'Years', ylab = 'Fishing mortality (F)', axes = FALSE)
abline(h = Fmsy, lty = 2)
axis(1)
axis(2, las = 2, at = Fmsy, labels = bquote(F[msy]))
box()
dev.off()


# Plot simulated env index:
# png('Figures/EnvIndexplot.png', width = 90, height = 110, units = 'mm', res = 500)
#  par(mar = c(4,4,0.5,0.5), mfrow = c(2,1))
#  plot(growthindex$years, growthindex$index, type = 'l', xlab = '', ylab = 'Env index', axes = FALSE)
#  axis(1)
#  axis(2, las = 2)
#  legend('bottomright', legend = 'Pattern1', bty = 'n')
#  box()
#  plot(growthindex_2$years, growthindex_2$index, type = 'l', xlab = 'Years', ylab = 'Env index', axes = FALSE)
#  axis(1)
#  axis(2, las = 2)
#  legend('topright', legend = 'Pattern2', bty = 'n')
#  box()
# dev.off()

