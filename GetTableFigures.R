# -----------------------------------------------------------
require(dplyr)
require(ggplot2)
require(reshape2)

setwd('C:/Users/moroncog/Documents/ss3sim_spatial')

# Read all scenarios to compare:
FigInx = 'D0_E0_F_sp_2'
listScenarios = c('D0-E0-F0-R1-cod', 'D0-E0-F1-R1-cod', 'D0-E0-F2-R1-cod')
#listScenarios = c('D0-E0-F0-R2-cod', 'D0-E1-F0-R2-cod')
#listScenarios = c('D1-E1-F0-R3-cod', 'D1-E1-F1-R3-cod', 'D1-E1-F2-R3-cod')

# Read scalar files
scalar_files = paste0(listScenarios, '/results_scalar_', listScenarios, '.csv')
all_scalar_dfs = lapply(scalar_files, read.csv)
base_scalar = bind_rows(all_scalar_dfs)

# Find interations no-convergence:
base_scalar$itindex = paste0(base_scalar$scenario, '_', base_scalar$iteration)
deleteiters = base_scalar$itindex[base_scalar$max_grad > 0.01 | base_scalar$params_on_bound_em > 0] # FIRST CRITERIUM. max grad level


# Read time series files
ts_files = paste0(listScenarios, '/results_ts_', listScenarios, '.csv')
all_ts_dfs = lapply(ts_files, read.csv)
base_ts = do.call(rbind, all_ts_dfs)

# Delete iterations no-convergence:
base_ts$itindex = paste0(base_ts$scenario, '_', base_ts$iteration)
base_scalar = base_scalar[-which(base_scalar$itindex %in% deleteiters), ]
base_ts = base_ts[-which(base_ts$itindex %in% deleteiters), ]


# Make plots:

# First, time series:

# Get SSB and R RE for time series:
base_ts = transform(base_ts,
                    SSB_RE = ((SpawnBio_em - SpawnBio_om)/SpawnBio_om)*100,
                    R_RE = ((Recruit_0_em - Recruit_0_om)/Recruit_0_om)*100)

# SSB RE data:
SSBRE50 = aggregate(base_ts$SSB_RE, list(year = base_ts$year, scenario = base_ts$scenario), FUN = median)
SSBRE2_5 = aggregate(base_ts$SSB_RE, list(year = base_ts$year, scenario = base_ts$scenario), FUN = quantile, probs = 0.025, na.rm = TRUE)
SSBRE97_5 = aggregate(base_ts$SSB_RE, list(year = base_ts$year, scenario = base_ts$scenario), FUN = quantile, probs = 0.975, na.rm = TRUE)

SSBRE = data.frame(year = SSBRE50$year, scenario = SSBRE50$scenario, q50 = SSBRE50$x,
                    q5 = SSBRE2_5$x, q95 = SSBRE97_5$x, type = 'SSB')

# R RE data:
RRE50 = aggregate(base_ts$R_RE, list(year = base_ts$year, scenario = base_ts$scenario), FUN = median)
RRE2_5 = aggregate(base_ts$R_RE, list(year = base_ts$year, scenario = base_ts$scenario), FUN = quantile, probs = 0.025, na.rm = TRUE)
RRE97_5 = aggregate(base_ts$R_RE, list(year = base_ts$year, scenario = base_ts$scenario), FUN = quantile, probs = 0.975, na.rm = TRUE)

RRE = data.frame(year = RRE50$year, scenario = RRE50$scenario, q50 = RRE50$x,
                    q5 = RRE2_5$x, q95 = RRE97_5$x, type = 'R')

maxssb = max(SSBRE$q50, na.rm = TRUE)
maxr = max(RRE$q50, na.rm = TRUE)
minssb = min(SSBRE$q50, na.rm = TRUE)
minr = min(RRE$q50, na.rm = TRUE)
upTh = 350
lwTh = -350

SSBRE$q95[which(SSBRE$q95 > maxssb & SSBRE$q95 > upTh)] = upTh
SSBRE$q5[which(SSBRE$q5 < minssb & SSBRE$q5 < lwTh)] = lwTh

RRE$q95[which(RRE$q95 > maxssb & RRE$q95 > upTh)] = upTh
RRE$q5[which(RRE$q5 < minssb & RRE$q5 < lwTh)] = lwTh


# Data to plot:
tsdataplot = rbind(SSBRE, RRE)


png(paste0('Figures/Ts_plots_', FigInx, '.png'), width = 190, height = 130, units = 'mm', res = 500)
ggplot(tsdataplot, aes(x = year)) +
  geom_ribbon(aes(ymin = q5, ymax = q95), colour = 'gray', alpha=0.2) +
  geom_line(aes(y = q50), colour = 'black') +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  xlab("Year") + 
  ylab("Relative error %") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_grid(type ~ scenario, scales = 'free')
dev.off()


# Get boxplots of RE for parameters: ----------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------

ColorsX = c('red', 'blue')
parameterNames = c('VonBert_K_Fem_GP', 'L_at_Amax_Fem_GP', 'NatM_p_1_Fem_GP', 'LnQ_base')
posParams = lapply(X = parameterNames, FUN = function(x) grep(pattern = x, x = colnames(base_scalar)))

finaldf = list()
for(i in seq_along(parameterNames)){


	selCols1 = colnames(base_scalar[, posParams[[i]]])
	selCols2 = selCols1
	posEnvParams = grep(pattern = 'ENV', x = selCols1)
	if(length(posEnvParams) > 0) {
		selCols2 = selCols1[-(posEnvParams)]
	}

	splitinfo = strsplit(x = sub(pattern = parameterNames[i], replacement = '', x = selCols2), split = '_')
	if(length(splitinfo[[1]]) > 2) {
		nPar = sapply(splitinfo, '[[', 2)
		modelType = sapply(splitinfo, '[[', 3)

    if(parameterNames[i] == 'LnQ_base') {
        modelType = sapply(splitinfo, '[[', 4)
        nPar = rep(1, times = length(modelType))
    }
    
	} else {

    modelType = sapply(splitinfo, '[[', 2)
    nPar = rep(1, times = length(modelType))  

	} 


	tmpdf = list()
	for(j in seq_along(selCols2)){
		tmpdf[[j]] = data.frame(scenario = base_scalar$scenario, parName = parameterNames[i], number_par = nPar[j], modeltype = modelType[j],
						   parValue = base_scalar[, selCols2[j]])
	}

	finaldf[[i]] = do.call(rbind, tmpdf)

}

plotdf = do.call(rbind, finaldf)

# Plot boxplots:
plotdfem = plotdf[plotdf$modeltype == 'em', ]
plotdfom = plotdf[plotdf$modeltype == 'om', ]

ploty1 = ggplot(data = plotdfem, aes(y = parValue))

# Select colors for points and boxplots:
nAreasOM = max(as.numeric(as.character(plotdfom$number_par)))
nAreasEM = max(as.numeric(as.character(plotdfem$number_par)))

  if(nAreasOM > 1 & nAreasEM > 1) {
    ploty1 = ploty1 + geom_boxplot(aes(color = number_par), outlier.size = -1) +
    geom_point(data = plotdfom, aes(x = 0, y = parValue, color = number_par), size = 2) +
    scale_color_manual(values = alpha(ColorsX, 0.3)) 
  } 
  if(nAreasOM > 1 & nAreasEM == 1) {
    ploty1 = ploty1 + geom_boxplot(color = 'gray', alpha = 0.5)+
    geom_point(data = plotdfom, aes(x = 0, y = parValue, color = number_par), size = 2) +
    scale_color_manual(values = ColorsX) 
  }
  if(nAreasOM == 1 & nAreasEM == 1) {
    ploty1 = ploty1 + geom_boxplot(color = 'gray', alpha = 0.5)+
    geom_point(data = plotdfom, aes(x = 0, y = parValue), size = 2) 
  }


png(paste0('Figures/Scalar_plots_', FigInx, '.png'), width = 190, height = 130, units = 'mm', res = 500)

  ploty1 + xlab("") + 
  ylab("Estimated value") +
  labs(color = 'Area') +
  theme_bw() + 
  ggtitle("") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        legend.position = "none",
        axis.line = element_line(colour = "black"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      #panel.border = element_blank(),
      panel.background = element_blank()) +
  facet_grid(parName ~ scenario, scales = 'free')

dev.off()
