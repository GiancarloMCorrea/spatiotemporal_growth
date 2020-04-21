
# ------------------------------------------------------------------------------
# Run scenario_spatiotemporal: (OM 2 area and EM 1 area)

om = "scenario_spatiotemporal/cod-om"
em = "scenario_spatiotemporal/cod-em"
scenarioName = paste0('D0-', growthTempIndex, '-F0-R3-cod')

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



# Transform list:
tranfList = list('Fleet1' = c('Fleet1', 'Fleet2'),
                 'Fleet2' = c('Fleet3', 'Fleet4'))
areaList = data.frame(area = c(1,1), fleetname = c('Fleet1', 'Fleet2'))


# First set of changes: This will apply for OM:
F0 = list(years = c(1:nyears), years_alter = c(1:nyears), fisheries = c(rep(1, times = nyears)),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1]))
F0 = lapply(X = F0, FUN = rep, times = 2)
F0$fisheries = rep(c(1,2), each = length(1:nyears))

# This will affect EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(0.2))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) # This is not altering anything
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # check time varying parameters later
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F0, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em, 
              tv_params = G1, bias_adjust = biasAdjust, transform_fleets = tranfList, area_fleet_em = areaList)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 

# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Run scenario_spatiotemporal: (OM 2 area and EM 1 area)

om = "scenario_spatiotemporal/cod-om"
em = "scenario_spatiotemporal/cod-em"
scenarioName = paste0('D0-', growthTempIndex, '-F1-R3-cod')

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



# Transform list:
tranfList = list('Fleet1' = c('Fleet1', 'Fleet2'),
                 'Fleet2' = c('Fleet3', 'Fleet4'))
areaList = data.frame(area = c(1,1), fleetname = c('Fleet1', 'Fleet2'))


# First set of changes: This will apply for OM:
F1 = list(years = c(1:nyears), years_alter = c(1:nyears), fisheries = c(rep(1, times = nyears)),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1]))
F1 = lapply(X = F1, FUN = rep, times = 2)
F1$fisheries = rep(c(1,2), each = length(1:nyears))
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F1$fvals = c(Fvector, Fvector*0.1)

# This will affect EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(0.2))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) # This is not altering anything
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # check time varying parameters later
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F1, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em, 
              tv_params = G1, bias_adjust = biasAdjust, transform_fleets = tranfList, area_fleet_em = areaList)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 

# ------------------------------------------------------------------------------
# Run scenario_spatiotemporal: (OM 2 area and EM 1 area)

om = "scenario_spatiotemporal/cod-om"
em = "scenario_spatiotemporal/cod-em"
scenarioName = paste0('D0-', growthTempIndex, '-F2-R3-cod')

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



# Transform list:
tranfList = list('Fleet1' = c('Fleet1', 'Fleet2'),
                 'Fleet2' = c('Fleet3', 'Fleet4'))
areaList = data.frame(area = c(1,1), fleetname = c('Fleet1', 'Fleet2'))


# First set of changes: This will apply for OM:
F2 = list(years = c(1:nyears), years_alter = c(1:nyears), fisheries = c(rep(1, times = nyears)),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1]))
F2 = lapply(X = F2, FUN = rep, times = 2)
F2$fisheries = rep(c(1,2), each = length(1:nyears))
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F2$fvals = c(Fvector*0.1, Fvector)

# This will affect EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(0.2))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) # This is not altering anything
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # check time varying parameters later
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F2, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em, 
              tv_params = G1, bias_adjust = biasAdjust, transform_fleets = tranfList, area_fleet_em = areaList)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# FOR THIS SET OF RUNS, A SPATIAL EM MODEL WILL BE CONSIDERED.
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_2_spatiotemporal/cod-om"
em = "scenario_2_spatiotemporal/cod-em"
scenarioName = paste0('D1-', growthTempIndex, '-F0-R3-cod')

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
F0 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1], rep(0, times = iniFyear), upFway[-1], downFway[-1]))

# This will affect EM:
index0 = list(fleets = c(3,4), years = list(iniSurYear:nyears, iniSurYear:nyears), 
              sds_obs = list(0.2,0.2))
lcomp0 = list(fleets = c(1,2), Nsamp = list(flNsamEM,flNsamEM), 
              years = list((iniFyear+1):nyears, (iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar,cPar))
agecomp0 = list(fleets = c(3,4), Nsamp = list(saNsamEM,saNsamEM), 
                years = list(iniSurYear:nyears,iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA,NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Fem_GP_2"),
          par_int = c(0.34, 0.34), par_phase = c(6,6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F0, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 


# ------------------------------------------------------------------------------
# F = 0 for fast growth area
# ------------------------------------------------------------------------------

# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_2_spatiotemporal/cod-om"
em = "scenario_2_spatiotemporal/cod-em"
scenarioName = paste0('D1-', growthTempIndex, '-F1-R3-cod')

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
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F1 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(Fvector, Fvector*0.1))

# This will affect EM:
index0 = list(fleets = c(3,4), years = list(iniSurYear:nyears, iniSurYear:nyears), 
              sds_obs = list(0.2,0.2))
lcomp0 = list(fleets = c(1,2), Nsamp = list(flNsamEM,flNsamEM), 
              years = list((iniFyear+1):nyears, (iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar,cPar))
agecomp0 = list(fleets = c(3,4), Nsamp = list(saNsamEM,saNsamEM), 
                years = list(iniSurYear:nyears,iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA,NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Fem_GP_2"),
          par_int = c(0.34, 0.34), par_phase = c(6,6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F1, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 


# ------------------------------------------------------------------------------
# F = 0 for slow growth area
# ------------------------------------------------------------------------------

# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_2_spatiotemporal/cod-om"
em = "scenario_2_spatiotemporal/cod-em"
scenarioName = paste0('D1-', growthTempIndex, '-F2-R3-cod')

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
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F2 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(Fvector*0.1, Fvector))

# This will affect EM:
index0 = list(fleets = c(3,4), years = list(iniSurYear:nyears, iniSurYear:nyears), 
              sds_obs = list(0.2,0.2))
lcomp0 = list(fleets = c(1,2), Nsamp = list(flNsamEM,flNsamEM), 
              years = list((iniFyear+1):nyears, (iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar,cPar))
agecomp0 = list(fleets = c(3,4), Nsamp = list(saNsamEM,saNsamEM), 
                years = list(iniSurYear:nyears,iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA,NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Fem_GP_2"),
          par_int = c(0.34, 0.34), par_phase = c(6,6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F2, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# FOR THIS SET OF RUNS, A SPATIAL EM MODEL WILL BE CONSIDERED.
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# FULL MODEL!!!!!!!!!!!!!!!!!!!!!!!!!!
# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_3_spatiotemporal/cod-om"
em = "scenario_3_spatiotemporal/cod-em"
scenarioName = paste0('D2-', growthTempIndex, '-F0-R3-cod')

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
F0 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1], rep(0, times = iniFyear), upFway[-1], downFway[-1]))

# This will affect EM:
index0 = list(fleets = c(3,4), years = list(iniSurYear:nyears, iniSurYear:nyears), 
              sds_obs = list(0.2,0.2))
lcomp0 = list(fleets = c(1,2), Nsamp = list(flNsamEM,flNsamEM), 
              years = list((iniFyear+1):nyears, (iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar,cPar))
agecomp0 = list(fleets = c(3,4), Nsamp = list(saNsamEM,saNsamEM), 
                years = list(iniSurYear:nyears,iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA,NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Fem_GP_2"),
          par_int = c(0.34, 0.34), par_phase = c(6,6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F0, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 


# ------------------------------------------------------------------------------
# F = 0 for fast growth area
# ------------------------------------------------------------------------------

# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_3_spatiotemporal/cod-om"
em = "scenario_3_spatiotemporal/cod-em"
scenarioName = paste0('D2-', growthTempIndex, '-F1-R3-cod')

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
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F1 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(Fvector, Fvector*0.1))

# This will affect EM:
index0 = list(fleets = c(3,4), years = list(iniSurYear:nyears, iniSurYear:nyears), 
              sds_obs = list(0.2,0.2))
lcomp0 = list(fleets = c(1,2), Nsamp = list(flNsamEM,flNsamEM), 
              years = list((iniFyear+1):nyears, (iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar,cPar))
agecomp0 = list(fleets = c(3,4), Nsamp = list(saNsamEM,saNsamEM), 
                years = list(iniSurYear:nyears,iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA,NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Fem_GP_2"),
          par_int = c(0.34, 0.34), par_phase = c(6,6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F1, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 


# ------------------------------------------------------------------------------
# F = 0 for slow growth area
# ------------------------------------------------------------------------------

# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_3_spatiotemporal/cod-om"
em = "scenario_3_spatiotemporal/cod-em"
scenarioName = paste0('D2-', growthTempIndex, '-F2-R3-cod')

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
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F2 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(Fvector*0.1, Fvector))

# This will affect EM:
index0 = list(fleets = c(3,4), years = list(iniSurYear:nyears, iniSurYear:nyears), 
              sds_obs = list(0.2,0.2))
lcomp0 = list(fleets = c(1,2), Nsamp = list(flNsamEM,flNsamEM), 
              years = list((iniFyear+1):nyears, (iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar,cPar))
agecomp0 = list(fleets = c(3,4), Nsamp = list(saNsamEM,saNsamEM), 
                years = list(iniSurYear:nyears,iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA,NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Fem_GP_2"),
          par_int = c(0.34, 0.34), par_phase = c(6,6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F2, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 



# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# FOR THIS SET OF RUNS, A TEMPORAL EM MODEL WILL BE CONSIDERED.
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# SCENARIO THAT I FORGOT!!
# Run scenario_spatiotemporal: (OM 2 area and EM 1 area)

om = "scenario_4_spatiotemporal/cod-om"
em = "scenario_4_spatiotemporal/cod-em"
scenarioName = paste0('D3-', growthTempIndex, '-F0-R3-cod')

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

# Transform list:
tranfList = list('Fleet1' = c('Fleet1', 'Fleet2'),
                 'Fleet2' = c('Fleet3', 'Fleet4'))
areaList = data.frame(area = c(1,1), fleetname = c('Fleet1', 'Fleet2'))


# First set of changes: This will apply for OM:
F0 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(rep(0, times = iniFyear), upFway[-1], downFway[-1], rep(0, times = iniFyear), upFway[-1], downFway[-1]))

# This will affect EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(0.2))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0)  # for EM
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F0, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex,
              transform_fleets = tranfList, area_fleet_em = areaList)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 


# ------------------------------------------------------------------------------
# F = 0 for fast growth area
# ------------------------------------------------------------------------------

# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_4_spatiotemporal/cod-om"
em = "scenario_4_spatiotemporal/cod-em"
scenarioName = paste0('D3-', growthTempIndex, '-F1-R3-cod')

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

# Transform list:
tranfList = list('Fleet1' = c('Fleet1', 'Fleet2'),
                 'Fleet2' = c('Fleet3', 'Fleet4'))
areaList = data.frame(area = c(1,1), fleetname = c('Fleet1', 'Fleet2'))


# First set of changes: This will apply for OM:
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F1 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(Fvector, Fvector*0.1))

# This will affect EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(0.2))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F1, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex,
              transform_fleets = tranfList, area_fleet_em = areaList)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 


# ------------------------------------------------------------------------------
# F = 0 for slow growth area
# ------------------------------------------------------------------------------

# Run scenario_spatiotemporal: (OM 2 area and EM 2 area)

om = "scenario_4_spatiotemporal/cod-om"
em = "scenario_4_spatiotemporal/cod-em"
scenarioName = paste0('D3-', growthTempIndex, '-F2-R3-cod')

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

# Transform list:
tranfList = list('Fleet1' = c('Fleet1', 'Fleet2'),
                 'Fleet2' = c('Fleet3', 'Fleet4'))
areaList = data.frame(area = c(1,1), fleetname = c('Fleet1', 'Fleet2'))


# First set of changes: This will apply for OM:
Fvector = c(rep(0, times = iniFyear), upFway[-1], downFway[-1])
F2 = list(years = c(1:nyears,1:nyears), years_alter = c(1:nyears,1:nyears), 
      fisheries = rep(c(1,2), each = nyears),
          fvals = c(Fvector*0.1, Fvector))

# This will affect EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(0.2))
lcomp0 = list(fleets = c(1), Nsamp = list(flNsamEM), years = list((iniFyear+1):nyears),
              lengthbin_vector = NULL, cpar = c(cPar))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), years = list(iniSurYear:nyears),
                agebin_vector = NULL, cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(0.34), par_phase = c(6), forecast_num = 0) 
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index, VonBert_K_Fem_GP_2 = growthindex1$index,
          L_at_Amax_Fem_GP_1 = growthindex2$index, L_at_Amax_Fem_GP_2 = growthindex2$index) # Applies to OM
R3 = list(retro_yr = 0)


# Detect number of cores:
cores = detectCores()
cl = makeCluster(cores[1] - 3)
registerDoSNOW(cl)


foreach(ix = 1:nSim) %dopar% {
  
  library(ss3sim)
  ss3sim_base(iterations = ix, scenarios = scenarioName,
              f_params = F2, index_params = index0, lcomp_params = lcomp0,
              agecomp_params = agecomp0, estim_params = E0,
              retro_params = R3, om_dir = om, em_dir = em,
              tv_params = G1, bias_adjust = biasAdjust, indexDFem = envIndex,
              transform_fleets = tranfList, area_fleet_em = areaList)
  
}


stopCluster(cl)

if(!biasAdjust){

  ss3sim::get_results_scenario(scenario = scenarioName)

} 
