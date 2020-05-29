
# ------------------------------------------------------------------------------
# Run scenario_temporal: (OM 1 area and EM 1 area). OM cohort effect and EM is constant

om = "scenario_C_temporal/cod-om"
em = "scenario_C_temporal/cod-em"
scenarioName = paste0('D0-', growthTempIndex, '-F0-R2-cod')

if(!biasAdjust){

    ctlfile <- readLines(file.path(em, 'codEM.ctl'))
    df = data.frame(value = averParams[which(rownames(averParams) == scenarioName), ], label = labelsBiasAdj)
    spot1 <- grep("last_early_yr|last_yr_nobias", ctlfile)
    spot2 <- grep("max_bias_adj_in_MPD", ctlfile)
    if (spot1 != spot2 - 4) 
      stop("error related to maxbias inputs in ctl file")
    ctlfile[spot1:spot2] <- apply(df, 1, paste, collapse = " ")
    writeLines(ctlfile, file.path(em, 'codEM.ctl'))

}



# First set of changes: This will apply for OM:
F0 = list(years = c(1:nyears), years_alter = c(1:nyears), fisheries = c(rep(1, times = nyears)),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1]))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) # This is not altering anything
# Standard (apply to OM):
G1 = list(CohortGrowDev = Cgrowthindex1$index) # check time varying parameters later
R2 = list(retro_yr = 0)

# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F0, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R2, om_dir = om, em_dir = em, 
              tv_params = G1, bias_adjust = biasAdjust)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 


# ------------------------------------------------------------------------------
# Run scenario_temporal: (OM 1 area and EM 1 area): misspecified (EM as a year effect and OM is Cohort effect)

om = "scenario_C_2_temporal/cod-om"
em = "scenario_C_2_temporal/cod-em"
scenarioName = paste0('D1-', growthTempIndex, '-F0-R2-cod')

if(!biasAdjust){

    ctlfile <- readLines(file.path(em, 'codEM.ctl'))
    df = data.frame(value = averParams[which(rownames(averParams) == scenarioName), ], label = labelsBiasAdj)
    spot1 <- grep("last_early_yr|last_yr_nobias", ctlfile)
    spot2 <- grep("max_bias_adj_in_MPD", ctlfile)
    if (spot1 != spot2 - 4) 
      stop("error related to maxbias inputs in ctl file")
    ctlfile[spot1:spot2] <- apply(df, 1, paste, collapse = " ")
    writeLines(ctlfile, file.path(em, 'codEM.ctl'))

}



# First set of changes: This will apply for OM:
F0 = list(years = c(1:nyears), years_alter = c(1:nyears), fisheries = c(rep(1, times = nyears)),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1]))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) # This is not altering anything
# Standard (apply to OM):
G1 = list(CohortGrowDev = Cgrowthindex1$index) # check time varying parameters later
R2 = list(retro_yr = 0)

# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F0, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R2, om_dir = om, em_dir = em, 
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 

# ------------------------------------------------------------------------------
# Run scenario_temporal: (OM 1 area and EM 1 area): correct (EM is Cohort and OM is Cohort)

om = "scenario_C_3_temporal/cod-om"
em = "scenario_C_3_temporal/cod-em"
scenarioName = paste0('D2-', growthTempIndex, '-F0-R2-cod')

if(!biasAdjust){

    ctlfile <- readLines(file.path(em, 'codEM.ctl'))
    df = data.frame(value = averParams[which(rownames(averParams) == scenarioName), ], label = labelsBiasAdj)
    spot1 <- grep("last_early_yr|last_yr_nobias", ctlfile)
    spot2 <- grep("max_bias_adj_in_MPD", ctlfile)
    if (spot1 != spot2 - 4) 
      stop("error related to maxbias inputs in ctl file")
    ctlfile[spot1:spot2] <- apply(df, 1, paste, collapse = " ")
    writeLines(ctlfile, file.path(em, 'codEM.ctl'))

}



# First set of changes: This will apply for OM:
F0 = list(years = c(1:nyears), years_alter = c(1:nyears), fisheries = c(rep(1, times = nyears)),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1]))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) # This is not altering anything
# Standard (apply to OM):
G1 = list(CohortGrowDev = Cgrowthindex1$index) # check time varying parameters later
R2 = list(retro_yr = 0)

# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F0, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R2, om_dir = om, em_dir = em, 
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 

