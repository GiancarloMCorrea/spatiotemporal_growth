
# General parameters used for all scenarios:
flNsamEM = 100
saNsamEM = 100
iniModelyear = 1
nyears = 120
iniFyear = 40 # F positive for iniFyear + 1. fishery and len comps start here. Normal value = 10
maxFyear = 90 
Fmsy = 0.081
maxF = 1.1*Fmsy # 
lowF = 0.9*Fmsy #
iniSurYear = 81 # ini year for survey index and age comps
CVSur = 0.35
cPar = 2 # for len comps fishery
base_K = 0.16
base_Linf = 29
base_natM = 0.048
CVgrowth_K = 0.15
CVgrowth_Linf = 0.11
age_env_obs = 2
nSampsML = 187
CVgrowth_C = 0.45 # This should be for cohort specific type
Fmult = 0.1

# 1) Create F pattern
upFway = normalize(x = iniFyear:maxFyear, method = 'range', range = c(0,maxF))
downFway = normalize(x = maxFyear:nyears, method = 'range', range = c(maxF,lowF))


# Annual PDO index:
PDO_annual = read.csv('aux_files/PDO_annual_1940_2019.csv') # REAL PDO: only this will apply in EM

# Create index for year-specific temporal variability:
growthindex1 = PDO_annual
growthindex1$index = normalize(x = growthindex1$index, method = 'range', range = c(-CVgrowth_K, CVgrowth_K)) # apply to OM
growthindex1$index[1:iniFyear] = 0
write.csv(growthindex1, 'aux_files/K_year_devs.csv', row.names = FALSE)


# Create index for year-specific temporal variability: Linf
growthindex3 = PDO_annual
growthindex3$index = normalize(x = growthindex3$index, method = 'range', range = c(CVgrowth_Linf, -CVgrowth_Linf)) # apply to OM
growthindex3$index[1:iniFyear] = 0
write.csv(growthindex3, 'aux_files/Linf_year_devs.csv', row.names = FALSE)


# Create index for cohort-specific temporal variability:
growthindex2 = PDO_annual
#CVgrowth_C = ((base_K+CVgrowth)/base_K) - 1 # for cohort variability is different
growthindex2$index = normalize(x = growthindex2$index, method = 'range', range = c(-CVgrowth_C, CVgrowth_C)) # apply to OM
growthindex2$index[1:iniFyear] = 0
write.csv(growthindex2, 'aux_files/Cohort_devs.csv', row.names = FALSE)


# Create env index fake base:
  envIndex = data.frame(Yr = (iniFyear+1):nyears, 
                      Variable = 1,
                      Value = NA)

# --------------------------------------------------------
# --------------------------------------------------------
# Plot F trend:
years = c(1:nyears)
fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])


png('Figures/Fpattern_PDO.png', width = 100, height = 110, units = 'mm', res = 500)

par(mfrow = c(2,1))

par(mar = c(2.5,4,0.5,0.5))
plot(years, fvals, type = 'l', xlab = '', ylab = 'Fishing mortality (F)', axes = FALSE)
abline(h = Fmsy, lty = 2)
axis(1)
axis(2, las = 2, at = Fmsy, labels = bquote(F[msy]))
box()
#dev.off()

# Plot simulated env index:
# png('Figures/EnvIndexplot.png', width = 90, height = 110, units = 'mm', res = 500)
  par(mar = c(3,4,0,0.5))
  plot(PDO_annual$years, PDO_annual$index, type = 'l', xlab = '', ylab = 'PDO', axes = FALSE)
  axis(1)
  axis(2, las = 2)
  mtext(text = 'Years', side = 1, line = 2)
  #legend('bottomright', legend = 'Pattern1', bty = 'n')
  box()
  # plot(growthindex_2$years, growthindex_2$index, type = 'l', xlab = 'Years', ylab = 'Env index', axes = FALSE)
  # axis(1)
  # axis(2, las = 2)
  # legend('topright', legend = 'Pattern2', bty = 'n')
  # box()
dev.off()

