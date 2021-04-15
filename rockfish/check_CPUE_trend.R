require(r4ss)
require(ggplot2)
library(dplyr)
library(purrr)
rm(list = ls())

setwd('C:/Users/moroncog/Documents/Codes/Growth_ss3sim_Correaetal2021_ICES/Manuscript_2_Codes_rock')
nSim  = 150
yMinPlot = -150
yMaxPlot = 75
yMinPlot_Nv = -150
yMaxPlot_Nv = 75

# Specify quantiles and function to plot later on
p <- c(0.025, 0.5, 0.975)
p_names <- map_chr(p, ~paste0(.x*100, "%"))
p_funs <- map(p, ~partial(quantile, probs = .x, na.rm = TRUE)) %>% 
  set_names(nm = p_names)
p_funs

# Create DF to save each part:
save_allcpue = NULL

#CRITERIO DE CONVERGENCIA AQUI NO IMPORTA YA QUE SON SIMPLEMENTE DATOS GENERADOS.

# -------------------------------------
# Spatial variability in growth parameters:

# F equally distributed:

allcpue = NULL

for(i in 1:nSim){

	mod_name = paste0('saveRuns/D2-E1-F1-R2-rock/', i, '/em')

	dat_file = SS_readdat(file = file.path(mod_name, 'ss3.dat'), verbose = FALSE)
	CPUE_data = dat_file$CPUE

	diff_obs = (CPUE_data$obs[CPUE_data$index == 3] - CPUE_data$obs[CPUE_data$index == 4])/CPUE_data$obs[CPUE_data$index == 3]
	temp = data.frame(year = CPUE_data$year[CPUE_data$index == 3], diffobs = diff_obs, iter = i)
	allcpue = rbind(allcpue, temp)

}

allcpue$diffobs = allcpue$diffobs*100
newdat = allcpue %>% 
		  group_by(year) %>% 
		  summarize_at(vars(diffobs), funs(!!!p_funs))
colnames(newdat) = c('year', 'q025', 'q50', 'q975')

p1 = ggplot(newdat, aes(x = year)) +
		  geom_ribbon(aes(ymin = q025, ymax = q975), colour = 'gray', alpha=0.2) +
		  geom_line(aes(y = q50), colour = 'black') +
		  xlab("") + 
		  ylab("Difference (%) - Growth Var") +
		  theme_bw() +
		  scale_x_continuous(expand=c(0, 0)) +
		  scale_y_continuous(breaks=c(-150, -100, -50, 0, 50), position = 'left') +
		  coord_cartesian(ylim = c(yMinPlot, yMaxPlot)) +
		  ggtitle('F:100%-100%') +
          theme(plot.title = element_text(hjust = 0.5))

# Save for future uses
allcpue$GrowVar = TRUE
allcpue$F_dist = 'F1'
save_allcpue = rbind(save_allcpue, allcpue)


# F 100% in Area 1. F 50% in Area 2.

allcpue = NULL

for(i in 1:nSim){

	mod_name = paste0('saveRuns/D2-E1-F2-R2-rock/', i, '/em')

	dat_file = SS_readdat(file = file.path(mod_name, 'ss3.dat'), verbose = FALSE)
	CPUE_data = dat_file$CPUE

	diff_obs = (CPUE_data$obs[CPUE_data$index == 3] - CPUE_data$obs[CPUE_data$index == 4])/CPUE_data$obs[CPUE_data$index == 3]
	temp = data.frame(year = CPUE_data$year[CPUE_data$index == 3], diffobs = diff_obs, iter = i)
	allcpue = rbind(allcpue, temp)

}

allcpue$diffobs = allcpue$diffobs*100
newdat = allcpue %>% 
		  group_by(year) %>% 
		  summarize_at(vars(diffobs), funs(!!!p_funs))
colnames(newdat) = c('year', 'q025', 'q50', 'q975')

p2 = ggplot(newdat, aes(x = year)) +
		  geom_ribbon(aes(ymin = q025, ymax = q975), colour = 'gray', alpha=0.2) +
		  geom_line(aes(y = q50), colour = 'black') +
		  xlab("") + 
		  ylab("") +
		  theme_bw() +
		  scale_x_continuous(expand=c(0, 0)) +
		  scale_y_continuous(breaks=c(-150, -100, -50, 0, 50), position = 'left') +
		  coord_cartesian(ylim = c(yMinPlot, yMaxPlot)) +
		  ggtitle('F:100%-10%') +
          theme(plot.title = element_text(hjust = 0.5))

# Save for future uses
allcpue$GrowVar = TRUE
allcpue$F_dist = 'F2'
save_allcpue = rbind(save_allcpue, allcpue)



# F 50% in Area 1. F 100% in Area 2.

allcpue = NULL

for(i in 1:nSim){

	mod_name = paste0('saveRuns/D2-E1-F3-R2-rock/', i, '/em')

	dat_file = SS_readdat(file = file.path(mod_name, 'ss3.dat'),  verbose = FALSE)
	CPUE_data = dat_file$CPUE

	diff_obs = (CPUE_data$obs[CPUE_data$index == 3] - CPUE_data$obs[CPUE_data$index == 4])/CPUE_data$obs[CPUE_data$index == 3]
	temp = data.frame(year = CPUE_data$year[CPUE_data$index == 3], diffobs = diff_obs, iter = i)
	allcpue = rbind(allcpue, temp)

}

allcpue$diffobs = allcpue$diffobs*100
newdat = allcpue %>% 
		  group_by(year) %>% 
		  summarize_at(vars(diffobs), funs(!!!p_funs))
colnames(newdat) = c('year', 'q025', 'q50', 'q975')

p3 = ggplot(newdat, aes(x = year)) +
		  geom_ribbon(aes(ymin = q025, ymax = q975), colour = 'gray', alpha=0.2) +
		  geom_line(aes(y = q50), colour = 'black') +
		  xlab("") + 
		  ylab("") +
		  theme_bw() +
		  scale_x_continuous(expand=c(0, 0)) +
		  scale_y_continuous(breaks=c(-150, -100, -50, 0, 50), position = 'left') +
		  coord_cartesian(ylim = c(yMinPlot, yMaxPlot)) +
		  ggtitle('F:10%-100%') +
          theme(plot.title = element_text(hjust = 0.5))

# Save for future uses
allcpue$GrowVar = TRUE
allcpue$F_dist = 'F3'
save_allcpue = rbind(save_allcpue, allcpue)


# -------------------------------------------------------
# NO spatial variability in growth

# F equally distributed:

allcpue = NULL

for(i in 1:nSim){

	mod_name = paste0('saveRuns/D2-E3-F1-R2-rock/', i, '/em')

	dat_file = SS_readdat(file = file.path(mod_name, 'ss3.dat'), verbose = FALSE)
	CPUE_data = dat_file$CPUE

	diff_obs = (CPUE_data$obs[CPUE_data$index == 3] - CPUE_data$obs[CPUE_data$index == 4])/CPUE_data$obs[CPUE_data$index == 3]
	temp = data.frame(year = CPUE_data$year[CPUE_data$index == 3], diffobs = diff_obs, iter = i)
	allcpue = rbind(allcpue, temp)

}

allcpue$diffobs = allcpue$diffobs*100
newdat = allcpue %>% 
		  group_by(year) %>% 
		  summarize_at(vars(diffobs), funs(!!!p_funs))
colnames(newdat) = c('year', 'q025', 'q50', 'q975')

p4 = ggplot(newdat, aes(x = year)) +
		  geom_ribbon(aes(ymin = q025, ymax = q975), colour = 'gray', alpha=0.2) +
		  geom_line(aes(y = q50), colour = 'black') +
		  xlab("") + 
		  ylab("Difference (%) - No Growth Var") +
		  theme_bw() +
		  scale_x_continuous(expand=c(0, 0)) +
		  scale_y_continuous(breaks=c(-150, -100, -50, 0, 50), position = 'left') +
		  coord_cartesian(ylim = c(yMinPlot_Nv, yMaxPlot_Nv)) +
		  ggtitle('') +
          theme(plot.title = element_text(hjust = 0.5))

# Save for future uses
allcpue$GrowVar = FALSE
allcpue$F_dist = 'F1'
save_allcpue = rbind(save_allcpue, allcpue)


# F 100% in Area 1. F 50% in Area 2.

allcpue = NULL

for(i in 1:nSim){

	mod_name = paste0('saveRuns/D2-E3-F2-R2-rock/', i, '/em')

	dat_file = SS_readdat(file = file.path(mod_name, 'ss3.dat'), verbose = FALSE)
	CPUE_data = dat_file$CPUE

	diff_obs = (CPUE_data$obs[CPUE_data$index == 3] - CPUE_data$obs[CPUE_data$index == 4])/CPUE_data$obs[CPUE_data$index == 3]
	temp = data.frame(year = CPUE_data$year[CPUE_data$index == 3], diffobs = diff_obs, iter = i)
	allcpue = rbind(allcpue, temp)

}

allcpue$diffobs = allcpue$diffobs*100
newdat = allcpue %>% 
		  group_by(year) %>% 
		  summarize_at(vars(diffobs), funs(!!!p_funs))
colnames(newdat) = c('year', 'q025', 'q50', 'q975')

p5 = ggplot(newdat, aes(x = year)) +
		  geom_ribbon(aes(ymin = q025, ymax = q975), colour = 'gray', alpha=0.2) +
		  geom_line(aes(y = q50), colour = 'black') +
		  xlab("Year") + 
		  ylab("") +
		  theme_bw() +
		  scale_x_continuous(expand=c(0, 0)) +
		  scale_y_continuous(breaks=c(-150, -100, -50, 0, 50), position = 'left') +
		  coord_cartesian(ylim = c(yMinPlot_Nv, yMaxPlot_Nv))+
		  ggtitle('') +
          theme(plot.title = element_text(hjust = 0.5))

# Save for future uses
allcpue$GrowVar = FALSE
allcpue$F_dist = 'F2'
save_allcpue = rbind(save_allcpue, allcpue)


# F 50% in Area 1. F 100% in Area 2.

allcpue = NULL

for(i in 1:nSim){

	mod_name = paste0('saveRuns/D2-E3-F3-R2-rock/', i, '/em')

	dat_file = SS_readdat(file = file.path(mod_name, 'ss3.dat'), verbose = FALSE)
	CPUE_data = dat_file$CPUE

	diff_obs = (CPUE_data$obs[CPUE_data$index == 3] - CPUE_data$obs[CPUE_data$index == 4])/CPUE_data$obs[CPUE_data$index == 3]
	temp = data.frame(year = CPUE_data$year[CPUE_data$index == 3], diffobs = diff_obs, iter = i)
	allcpue = rbind(allcpue, temp)

}


allcpue$diffobs = allcpue$diffobs*100
newdat = allcpue %>% 
		  group_by(year) %>% 
		  summarize_at(vars(diffobs), funs(!!!p_funs))
colnames(newdat) = c('year', 'q025', 'q50', 'q975')

p6 = ggplot(newdat, aes(x = year)) +
		  geom_ribbon(aes(ymin = q025, ymax = q975), colour = 'gray', alpha=0.2) +
		  geom_line(aes(y = q50), colour = 'black') +
		  xlab("") + 
		  ylab("") +
		  theme_bw() +
		  scale_x_continuous(expand=c(0, 0)) +
		  scale_y_continuous(breaks=c(-150, -100, -50, 0, 50), position = 'left') +
		  coord_cartesian(ylim = c(yMinPlot_Nv, yMaxPlot_Nv)) +
		  ggtitle('') +
          theme(plot.title = element_text(hjust = 0.5))

# Save for future uses
allcpue$GrowVar = FALSE
allcpue$F_dist = 'F3'
save_allcpue = rbind(save_allcpue, allcpue)


# --------------------
# MERGE ALL PLOTS:

# MERGE ALL PLOTS:
require(gridExtra)

png('Supp_Indices_Diff_Rock.png', width = 170, height = 120, units = 'mm', res = 500)

grid.arrange(p1,p2,p3,p4,p5,p6, nrow = 2, ncol = 3)

dev.off()

# Save data:
write.csv(save_allcpue, 'indices_differences.csv', row.names = FALSE)
