library(foreach)
library(doParallel)
library(doSNOW)
require(BBmisc)

rm(list = ls())
setwd('C:/Users/moroncog/Documents/Manuscript_2_Codes_sard')
source('parametersSimulation.R')

# -----------------------------------------------------------------------------
# THE GROWTH INDEX PATTERN DOES NOT MATTER HERE. DO NOT RUN TWICE!!!!!!
# First run these to get the bias_adjust parameters
nSim = 25
biasAdjust = TRUE

source('runScenario_base.R') # probably we need to run this script internally because there are convergence problems for some iterations (errors)
source('runScenario_temporal_Y.R') # probably we need to run this script internally because there are convergence problems for some iterations (errors)
source('runScenario_temporal_C.R') # probably we need to run this script internally because there are convergence problems for some iterations (errors)
source('runScenario_temporal_cross.R') # probably we need to run this script internally because there are convergence problems for some iterations (errors)
source('runScenario_spatial.R') # probably we need to run this script internally because there are convergence problems for some iterations (errors)
source('runScenario_spatiotemporal_Y.R') # probably we need to run this script internally because there are convergence problems for some iterations (errors)



#source('runScenario_C_spatiotemporal.R') # probably we need to run this script internally because there are convergence problems for some iterations (errors)

# Extract values for bias adjustment
scenNam = list.files()[grep(pattern = '-sard', x = list.files())]
averParams = matrix(NA, ncol = 5, nrow = length(scenNam))
for(i in seq_along(scenNam)){

	saveParms = matrix(NA, ncol = 5, nrow = nSim)
	for(k in 1:nSim){

		finder = grep(x = list.files(file.path(scenNam[i], k, 'em')), pattern = 'recruit_fit_bias')

		if(length(finder) > 0) {
			tmp = scan(file.path(scenNam[i], k, 'em', 'recruit_fit_bias_adjust_convergence.txt'), what = '', sep = '\n')
			y = strsplit(tmp, "[[:space:]]+")
			names(y) = sapply(y, `[[`, 1)
			y = lapply(y, `[`, -1)
			y2 = as.numeric(as.vector(y[['[1]']]))
			saveParms[k, ] = y2
		}

	}

	averParams[i, ] = colMeans(saveParms, na.rm = TRUE)

}

rownames(averParams) = scenNam
#write.csv(averParams, paste0('bias_adj_params_', 'std', '.csv'))

# -----------------------------------------------------------------------------
# After running model to estimate bias adj parms, run this chunk:
# DO NOT FORGET TO DELETE THE PREVIOUS FOLDERs:
averParams = read.csv(paste0('bias_adj_params_', 'std', '.csv'), row.names = 1)
averParams = as.matrix(averParams)
labelsBiasAdj = c('#_last_yr_nobias_adj_in_MPD; begin of ramp', '#_first_yr_fullbias_adj_in_MPD; begin of plateau',
				  '#_last_yr_fullbias_adj_in_MPD', '#_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)',
				  '#_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)')

# Now run the final simulations
# REMEMBER to delete previous folders.

nSim = 50
biasAdjust = FALSE

source('runScenario_base.R')
source('runScenario_temporal_Y.R') 
source('runScenario_temporal_C.R') 
source('runScenario_temporal_cross.R') 
source('runScenario_spatial.R') 
source('runScenario_spatiotemporal_Y.R') 

