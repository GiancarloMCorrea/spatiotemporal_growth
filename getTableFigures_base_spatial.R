

# -----------------------------------------------------------
# PLOT 1:
# PLOT ALL MODELS (R0 AND R1): 
# -----------------------------------------------------------

require(dplyr)
require(ggplot2)
require(reshape2)
require(RColorBrewer)
library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)

setwd('C:/Users/moroncog/Documents/ss3sim_spatial')

YearsSh = 26:75

typeModel = 'D1-R1'

# Read all scenarios to compare:
#FigInx = 'Base_0'
#listScenarios = c('D0-E0-F0-R0-cod')
#scenario.labs <- c('base')


Wdth = 180 # 170 for 2 scenarios, 120 for 1 scenario
Hght = 180 # 200 for temporal

#FigInx = 'Spatial_1'
#listScenarios = c('D0-E0-F0-R1-cod', 'D0-E0-F1-R1-cod', 'D0-E0-F2-R1-cod')
#scenario.labs <- c('100% - 100%', '100% - 10%', '10% - 100%')

FigInx = 'Spatial_2'
listScenarios = c('D1-E0-F0-R1-cod', 'D1-E0-F1-R1-cod', 'D1-E0-F2-R1-cod')
scenario.labs <- c('100% - 100%', '100% - 10%', '10% - 100%')

#FigInx = 'D0_E0_F_R3'
#listScenarios = c('D0-E0-F0-R3-cod', 'D0-E0-F1-R3-cod', 'D0-E0-F2-R3-cod')
#scenario.labs <- c('1 - 1', '1 - 0.1', '0.1 - 1')

#FigInx = 'D1_E0_F_R3'
#listScenarios = c('D1-E0-F0-R3-cod', 'D1-E0-F1-R3-cod', 'D1-E0-F2-R3-cod')
#scenario.labs <- c('1 - 1', '1 - 0.1', '0.1 - 1')

#FigInx = 'D2_E0_F_R3'
#listScenarios = c('D2-E0-F0-R3-cod', 'D2-E0-F1-R3-cod', 'D2-E0-F2-R3-cod')
#scenario.labs <- c('1 - 1', '1 - 0.1', '0.1 - 1')

#FigInx = 'D3_E0_F_R3'
#listScenarios = c('D3-E0-F0-R3-cod', 'D3-E0-F1-R3-cod', 'D3-E0-F2-R3-cod')
#scenario.labs <- c('1 - 1', '1 - 0.1', '0.1 - 1')


parameterNames = c('VonBert_K_Fem_GP', 'L_at_Amax_Fem_GP', 'NatM_p_1_Fem_GP', 'SSB_MSY')
#par.labs <- c("Growth rate", 'Asymptotic length', 'Natural mortality', 'SSB at MSY')
#names(par.labs) <- parameterNames

group_name = c(expression(k),
               expression(L[infinity]),
               expression(M),
               expression(SSB[MSY]))

#parameterNames = c('L_at_Amax_Fem_GP', 'NatM_p_1_Fem_GP', 'SSB_MSY')
#par.labs <- c('Asymptotic length', 'Natural mortality', 'SSB at MSY')
#names(par.labs) <- parameterNames


#parameterNames = c('NatM_p_1_Fem_GP', 'SSB_MSY')
#par.labs <- c('Natural mortality', 'SSB at MSY')
#names(par.labs) <- parameterNames



# Set gray color
ColorsX1 = RColorBrewer::brewer.pal(n = 8, name = 'Greys')[5]
ColorsX2 = RColorBrewer::brewer.pal(n = 8, name = 'Greys')[3]

# New facet label names for scenario name
names(scenario.labs) <- listScenarios

# New facet label names for ts names
ts.labs <- c("SSB", 'Recruitment')
names(ts.labs) <- c("SSB", "R")


# --------------------------------------------------
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

# --------------------------------------------------


# Make plots:

# First, time series:

# Get SSB and R RE for time series:
base_ts = transform(base_ts,
                    SSB_RE = ((SpawnBio_em - SpawnBio_om)/SpawnBio_om)*100,
                    R_RE = ((Recruit_0_em - Recruit_0_om)/Recruit_0_om)*100)
base_ts = base_ts[base_ts$year %in% YearsSh, ]


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
upTh = 100
lwTh = -100

SSBRE$q95[which(SSBRE$q95 > maxssb & SSBRE$q95 > upTh)] = upTh
SSBRE$q5[which(SSBRE$q5 < minssb & SSBRE$q5 < lwTh)] = lwTh

RRE$q95[which(RRE$q95 > maxssb & RRE$q95 > upTh)] = upTh
RRE$q5[which(RRE$q5 < minssb & RRE$q5 < lwTh)] = lwTh


# Data to plot:
tsdataplot = rbind(SSBRE, RRE)


# Plot time series:
p5 = ggplot(tsdataplot, aes(x = year)) +
  geom_ribbon(aes(ymin = q5, ymax = q95), colour = 'gray', alpha=0.2) +
  geom_line(aes(y = q50), colour = 'black') +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  xlab("Year") + 
  ylab("Relative error %") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_grid(type ~ scenario, scales = 'free', labeller = labeller(type = ts.labs, scenario = scenario.labs))


# -----------------------------------------------------------
# PLOT 2:
# PLOT BASE AND SPATIAL MODELS (R0 AND R1): 
# -----------------------------------------------------------

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

  # For type 0 :
  if(typeModel == 'D0-R0'){

    ColorsX = c('black')

          valsOM = c(base_scalar[, selCols2[1]])
          valsEM = c(base_scalar[, selCols2[2]])
          number_par = 1
          scenariovec = c(base_scalar$scenario)

        tmpdf = data.frame(scenario = scenariovec, 
                                parName = parameterNames[i], 
                                number_par = number_par, 
                                #modeltype = modelType[j],
                                parValue_om = valsOM,
                                parValue_em = valsEM)

  }



  # For type 1 :
  if(typeModel == 'D0-R1'){

    ColorsX = c('blue', 'red', 'black')

        if(i == 4){

          valsOM = c(base_scalar[, selCols2[1]])
          valsEM = c(base_scalar[, selCols2[2]])
          number_par = 3
          scenariovec = c(base_scalar$scenario)

        } else {

          valsOM = c(base_scalar[, selCols2[1]], base_scalar[, selCols2[2]])
          valsEM = rep(base_scalar[, selCols2[3]], times = 2)
          number_par = rep(1:2, each = nrow(base_scalar))
          scenariovec = rep(base_scalar$scenario, times = 2)

        }

        tmpdf = data.frame(scenario = scenariovec, 
                                parName = parameterNames[i], 
                                number_par = number_par, 
                                #modeltype = modelType[j],
                                parValue_om = valsOM,
                                parValue_em = valsEM)

  }

    # For type 2 :
  if(typeModel == 'D1-R1'){

        ColorsX = c('blue', 'red', 'black')

        if(i == 4){

          valsOM = c(base_scalar[, selCols2[1]])
          valsEM = c(base_scalar[, selCols2[2]])
          number_par = 3
          scenariovec = c(base_scalar$scenario)

        } else {

          valsOM = c(base_scalar[, selCols2[1]], base_scalar[, selCols2[2]])
          valsEM = c(base_scalar[, selCols2[3]], base_scalar[, selCols2[4]])
          number_par = rep(1:2, each = nrow(base_scalar))
          scenariovec = rep(base_scalar$scenario, times = 2)

        }

        tmpdf = data.frame(scenario = scenariovec, 
                                parName = parameterNames[i], 
                                number_par = number_par, 
                                #modeltype = modelType[j],
                                parValue_om = valsOM,
                                parValue_em = valsEM)

  }

  finaldf[[i]] = tmpdf


}

plotdf = do.call(rbind, finaldf)
plotdf = transform(plotdf, RE = ((parValue_em - parValue_om)/parValue_om)*100)

# Plot parameters:
ploty1 = ggplot(data = plotdf, aes(x = factor(parName), y = RE)) +
            stat_summary(fun.data = "mean_sdl", size = 0.5, aes(color = factor(number_par)), position=position_dodge(0.3)) +
            scale_color_manual(values = ColorsX) 


p1 =  ploty1 + xlab("") +  # this is for temporal and spatiotemporal scenarios
  ylab("Relative error %") +
  labs(color = 'Area') +
  theme_bw() + 
  ggtitle("") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  scale_x_discrete(labels=group_name) +
  theme(
        #axis.title.x=element_blank(),
        axis.text=element_text(size=12),
        #axis.ticks.x=element_blank(),
        legend.position = "none",
        axis.line = element_line(colour = "black"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      #panel.border = element_blank(),
      panel.background = element_blank()) +
  facet_grid(~ scenario, scales = 'free', labeller = labeller(scenario = scenario.labs))

  if(length(listScenarios) == 1){

    p1 =  ploty1 + xlab("") +  # this is for temporal and spatiotemporal scenarios
      ylab("Relative error %") +
      labs(color = 'Area') +
      theme_bw() + 
      ggtitle("") +
      geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
      scale_x_discrete(labels=group_name) +
      theme(
            #axis.title.x=element_blank(),
            axis.text=element_text(size=12),
            #axis.ticks.x=element_blank(),
            legend.position = "none",
            axis.line = element_line(colour = "black"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          #panel.border = element_blank(),
          panel.background = element_blank()) 

  }

# Plot all figures -----------------------------------------------------------------
#lay <- rbind(c(1,2))
 lay <- rbind(c(1,1),
               c(1,1),
               c(2,2))

png(paste0('Figures/C_', FigInx, '_2.png'), width = Wdth, height = Hght, units = 'mm', res = 500)

 grid.arrange(p5, p1, layout_matrix = lay)

 dev.off()





# # -------------------------------------------------------------------------
# # PLOT 2:
# # PLOT TEMPORAL MODELS (R2): 
# # -------------------------------------------------------------------------

# ColorsX = c('blue', 'red')
# ColorsX2 = ColorsX
# #ColorsX = 'gray'
# #ColorsX2 = 'black'

# yearseq = 26:75 #I do not want to show the first 25 years
# nAreas = 2 # in the OM
# parameterNames = c('VonBert_K_Fem_GP', 'L_at_Amax_Fem_GP')
# par.labs <- c("Growth rate", 'Asymptotic length')
# names(par.labs) <- parameterNames
# posParams = lapply(X = parameterNames, FUN = function(x) grep(pattern = x, x = colnames(base_scalar)))

# # for temporal and spatiotemporal:
# scenariosNames = unique(base_scalar$scenario)

# finaldf = NULL
# for(i in seq_along(parameterNames)){

#   tmpdf = list()

#   selCols1 = colnames(base_scalar[, posParams[[i]]])
#   selCols2 = selCols1
#   #posEnvParams = grep(pattern = 'ENV', x = selCols1)
#   #if(length(posEnvParams) > 0) {
#   #  selCols2 = selCols1[-(posEnvParams)]
#   #}
#   findem = grep(pattern = '_em', x = selCols2)
#   selCols2 = selCols2[findem] # eliminate om

#   tmpDat = base_scalar[ , c('scenario', selCols2)]
#   tmpDat$parName = parameterNames[i]
  
#   #This for R2
#   #colnames(tmpDat) = c('scenario', 'parValue', 'parValueENV', 'parName')
#   #tmpDat$parValueENV[is.na(tmpDat$parValueENV)] = 0
 
#   # This for R3 and D0
#    #colnames(tmpDat) = c('scenario', 'parValue', 'parName')
#    #tmpDat$parValueENV = 0
#    #areaVec = rep(1:nAreas, each = nrow(tmpDat))
#    #tmpDat = tmpDat[rep(seq_len(nrow(tmpDat)), times = nAreas), ]
#    #tmpDat$area = areaVec # CHANGE THIS FOR SPATIOTEMPORAL SCENARIO

#      # This for R3 and D3
#    colnames(tmpDat) = c('scenario', 'parValue', 'parValueENV', 'parName')
#    areaVec = rep(1:nAreas, each = nrow(tmpDat))
#    tmpDat = tmpDat[rep(seq_len(nrow(tmpDat)), times = nAreas), ]
#    tmpDat$area = areaVec # CHANGE THIS FOR SPATIOTEMPORAL SCENARIO

#   #This for R3 and D1
#   #tmpDat2 = tmpDat[rep(seq_len(nrow(tmpDat)), times = nAreas), c('scenario', 'parName')]
#   #tmpDat2$parValue = c(tmpDat[,c(2)], tmpDat[,c(3)])
#   #tmpDat2$area = rep(1:nAreas, each = nrow(tmpDat))
#   #tmpDat = tmpDat2
#   #tmpDat$parValueENV = 0

#   #This for R3 and D2
#    #tmpDat2 = tmpDat[rep(seq_len(nrow(tmpDat)), times = nAreas), c('scenario', 'parName')]
#    #tmpDat2$parValue = c(tmpDat[,c(2)], tmpDat[,c(3)])
#    #tmpDat2$parValueENV = c(tmpDat[,c(4)], tmpDat[,c(5)])
#    #tmpDat2$area = rep(1:nAreas, each = nrow(tmpDat))
#    #tmpDat = tmpDat2

#   finaldf = rbind(finaldf, tmpDat)

# }
  
# finaldf$parName = factor(finaldf$parName, levels = parameterNames)

# # For all scenarios: -------------------------------------
# # TRUE values:
# # Growth parameter
# mydata2 = read.csv('auxFiles/K_env.csv')
# colnames(mydata2)[2] = 'parValue'

#  mydata2_1 = mydata2
#  mydata2_1$parValue = mydata2$parValue + 0.175 # fix value for K area 1
#  mydata2_1$area = 1
#  mydata2_2 = mydata2
#  mydata2_2$parValue = mydata2$parValue + 0.215 # fix value for K area 2
#  mydata2_2$area = 2
#  mydata2 = rbind(mydata2_1, mydata2_2)

# #mydata2$parValue = mydata2$parValue + 0.195 # fix value for K

# mydata2$parName = parameterNames[1]
# mydata2 = mydata2[mydata2$years %in% yearseq, ]
# # First repeat by number of scenarios
# mydata2 = mydata2[rep(seq_len(nrow(mydata2)), times = length(scenariosNames)), ]
# mydata2$scenario = rep(scenariosNames, each = length(yearseq))
# ## Second repeat by number of areas
# ##mydata2 = mydata2[rep(seq_len(nrow(mydata2)), times = nAreas), ]
# ##mydata2$area = rep(1:nAreas, each = length(yearseq))

# # Linf parameter
# mydata3 = read.csv('auxFiles/Linf_env.csv')
# colnames(mydata3)[2] = 'parValue'

#  mydata3_1 = mydata3
#  mydata3_1$parValue = mydata3$parValue + 103 # fix value for K area 1
#  mydata3_1$area = 1
#  mydata3_2 = mydata3
#  mydata3_2$parValue = mydata3$parValue + 97 # fix value for K area 2
#  mydata3_2$area = 2
#  mydata3 = rbind(mydata3_1, mydata3_2)

# #mydata3$parValue = mydata3$parValue + 100 # fix value for Linf

# mydata3$parName = parameterNames[2]
# mydata3 = mydata3[mydata3$years %in% yearseq, ]
# # First repeat by number of scenarios
# mydata3 = mydata3[rep(seq_len(nrow(mydata3)), times = length(scenariosNames)), ]
# mydata3$scenario = rep(scenariosNames, each = length(yearseq))
# ## Second repeat by number of areas
# ##mydata3 = mydata3[rep(seq_len(nrow(mydata3)), times = nAreas), ]
# ##mydata3$area = rep(1:nAreas, each = length(yearseq))

# # Merge data:
# mydata = rbind(mydata2, mydata3)
# mydata$parName = factor(mydata$parName, levels = parameterNames) # THESE ARE TRUE VALUES

# # estimated values: ------------------------------------------
# pdoindex = read.csv('auxFiles/timeseriesgrowth_1.csv')
# pdoindex = pdoindex[pdoindex$years %in% yearseq, ]
# plotdf = finaldf 

# alldata = NULL
# for(i in 1:nrow(plotdf)){

#   vals = plotdf$parValue[i] +  plotdf$parValueENV[i] * pdoindex$index
#    tmpdf = data.frame(years = yearseq, value_em = vals, iteration = i,
#                        parName = plotdf$parName[i], scenario = plotdf$scenario[i], area = plotdf$area[i])
#   #tmpdf = data.frame(years = yearseq, value_em = vals, iteration = i,
#   #                    parName = plotdf$parName[i], scenario = plotdf$scenario[i])
#   alldata = rbind(alldata, tmpdf)

# }

# # Merge both data sets:
# #alldata$index = paste0(alldata$years, alldata$scenario, alldata$parName)
# #mydata$index = paste0(mydata$years, mydata$scenario, mydata$parName)
# #alldata$value_om = mydata$parValue[match(alldata$index, mydata$index)]

# alldata$index = paste0(alldata$years, alldata$scenario, alldata$parName, alldata$area)
# mydata$index = paste0(mydata$years, mydata$scenario, mydata$parName, mydata$area)
# alldata$value_om = mydata$parValue[match(alldata$index, mydata$index)]

# alldata2 = transform(alldata, errorPar = ((value_em - value_om)/value_om)*100)

# # SSB RE data:
# #par50 = aggregate(alldata2$errorPar, list(year = alldata2$years, scenario = alldata2$scenario, parName = alldata2$parName), 
# #                      FUN = median)
# #par2_5 = aggregate(alldata2$errorPar, list(year = alldata2$years, scenario = alldata2$scenario, parName = alldata2$parName), 
# #                      FUN = quantile, probs = 0.025, na.rm = TRUE)
# #par97_5 = aggregate(alldata2$errorPar, list(year = alldata2$years, scenario = alldata2$scenario, parName = alldata2$parName), 
# #                      FUN = quantile, probs = 0.975, na.rm = TRUE)
# #alldata3 = data.frame(year = par50$year, scenario = par50$scenario, q50 = par50$x,
# #                      q5 = par2_5$x, q95 = par97_5$x, parName = par50$parName)


# # SSB RE data:
#  par50 = aggregate(alldata2$errorPar, list(year = alldata2$years, scenario = alldata2$scenario, parName = alldata2$parName, area = alldata2$area), 
#                        FUN = median)
#  par2_5 = aggregate(alldata2$errorPar, list(year = alldata2$years, scenario = alldata2$scenario, parName = alldata2$parName, area = alldata2$area), 
#                        FUN = quantile, probs = 0.025, na.rm = TRUE)
#  par97_5 = aggregate(alldata2$errorPar, list(year = alldata2$years, scenario = alldata2$scenario, parName = alldata2$parName, area = alldata2$area), 
#                        FUN = quantile, probs = 0.975, na.rm = TRUE)
#  alldata3 = data.frame(year = par50$year, scenario = par50$scenario, q50 = par50$x,
#                        q5 = par2_5$x, q95 = par97_5$x, parName = par50$parName, area = par50$area)


# # p3 = ggplot(alldata3, aes(x = year)) +
# #   #geom_ribbon(aes(ymin = q5, ymax = q95), colour = ColorsX, alpha=0.2) +
# #   #geom_line(aes(y = q50), colour = ColorX2) +
# #   geom_ribbon(aes(ymin = q5, ymax = q95), colour = 'gray', alpha=0.2) +
# #   geom_line(aes(y = q50), colour = 'black') +
# #   geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
# #   xlab("Year") +
# #   ylab("Relative error %") +
# #   theme_bw() + 
# #   theme(plot.title = element_text(hjust = 0.5), legend.position = "none") +
# #   facet_grid(parName ~ scenario, scales = 'free', labeller = labeller(parName = par.labs, scenario = scenario.labs))


#  p3 = ggplot(alldata3, aes(x = year)) +
#    #geom_ribbon(aes(ymin = q5, ymax = q95), colour = ColorsX, alpha=0.2) +
#    #geom_line(aes(y = q50), colour = ColorX2) +
#    geom_ribbon(aes(ymin = q5, ymax = q95, fill = factor(area)), alpha=0.2) +
#    geom_line(aes(y = q50, colour = factor(area))) +
#    geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
#    xlab("Year") +
#    scale_color_manual(values = ColorsX) + 
#    scale_fill_manual(values = ColorsX) + 
#    ylab("Relative error %") +
#    theme_bw() + 
#    theme(plot.title = element_text(hjust = 0.5), legend.position = "none") +
#    facet_grid(parName ~ scenario, scales = 'free', labeller = labeller(parName = par.labs, scenario = scenario.labs))

# # Plot all figures -----------------------------------------------------------------
# lay <- rbind(c(1,2),
#              c(1,3))

# png(paste0('Figures/C_', FigInx, '.png'), width = 190, height = 170, units = 'mm', res = 500)

# grid.arrange(p5, p3, p1, layout_matrix = lay)

# dev.off()



# # -----------------------------------------------------------------------------------
# # -----------------------------------------------------------------------------------
# # -----------------------------------------------------------------------------------
# # -----------------------------------------------------------------------------------
# # -----------------------------------------------------------------------------------
# # Plot data generation by OMs

# require(r4ss)

# setwd('C:/Users/moroncog/Documents/ss3sim_spatial')

# tmp0 = SS_output(dir = 'D0-E0-F0-R0-cod/1/em')
# tmp1 = SS_output(dir = 'D1-E0-F0-R1-cod/1/em')
# #tmp2 = SS_output(dir = 'saveRuns/D1-E0-F1-R1-cod/1/em')
# #tmp3 = SS_output(dir = 'saveRuns/D1-E0-F2-R1-cod/1/em')

# png('Figures/D_dataplot.png', width = 190, height = 100, units = 'mm', res = 500)

# par(mfrow = c(1,2))
# r4ss::SSplotData(tmp0, subplot = 1, fleetcol = c('black', 'gray'), margins = c(4, 0.5, 0.5, 4))
# r4ss::SSplotData(tmp1, subplot = 1, fleetcol = c(4,2), margins = c(4, 0.5, 0.5, 4))
# #r4ss::SSplotData(tmp2, subplot = 2, fleetcol = c(2,4), margins = c(4, 0.5, 0.5, 4))
# #r4ss::SSplotData(tmp3, subplot = 2, fleetcol = c(2,4), margins = c(4, 0.5, 0.5, 4))

# dev.off()