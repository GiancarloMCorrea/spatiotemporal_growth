rm(list = ls())
setwd('C:/Users/moroncog/Documents/Manuscript_2_Codes_rock')

# -------------------------------------------------------
# 3-1) Spatial scenario: (OM has two areas and EM one.) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-1A_Linf'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Linf'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 3-4) Spatial scenario: (OM has two areas and EM two.) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-2A_Linf'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Linf'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_2A'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 3-4) Spatial scenario: (OM has two areas and EM areas as fleet) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-AaF_Linf'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Linf'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_AaF'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))


# -------------------------------------------------------
# 2-2) Temporal scenario: (OM has year effect and EM consider it - ts)

nameScenario = 'scenario_temporal_OM-Y_EM-Y-ts_Linf'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-ts_Linf'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))


# -------------------------------------------------------
# 2-3) Temporal scenario: (OM has year effect and EM consider it - devs)

nameScenario = 'scenario_temporal_OM-Y_EM-Y-dev_Linf'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-dev_Linf'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))




