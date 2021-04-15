rm(list = ls())
setwd('C:/Users/moroncog/Documents/Codes/Growth_ss3sim_Correaetal2021_ICES/Manuscript_2_Codes_rock')

# -------------------------------------------------------
# 1) Base scenario:

nameScenario = 'scenario_base'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 2-1) Temporal scenario: (OM has year effect and EM consider it - ts)

nameScenario = 'scenario_temporal_OM-Y_EM-Y-ts_K'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-ts_K'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))


# -------------------------------------------------------
# 2-2) Temporal scenario: (OM has year effect and EM consider it - devs)

nameScenario = 'scenario_temporal_OM-Y_EM-Y-dev_K'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-dev_K'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 2-3) Temporal scenario: (OM has year effect and EM consider it - ts)

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
# 2-4) Temporal scenario: (OM has year effect and EM consider it - devs)

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


# -------------------------------------------------------
# 2-6) Temporal scenario: (OM has cohort effect and EM consider it - ts)

nameScenario = 'scenario_temporal_OM-C_EM-C-ts'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_C-ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 2-7) Temporal scenario: (OM has cohort effect and EM consider it - devs)

nameScenario = 'scenario_temporal_OM-C_EM-C-dev'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_C-dev'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))


# -------------------------------------------------------
# 2-7) Temporal scenario: (OM has year effect and EM consider cohort effect - ts)

# nameScenario = 'scenario_temporal_OM-Y_EM-C-ts'
# dir.create(path = nameScenario)
# dir.create(path = paste0(nameScenario, '/rock-om'))
# dir.create(path = paste0(nameScenario, '/rock-em'))

# #Files OM:
# OMpath = 'core_omem/OM_base'
# listFiles = list.files(path = OMpath)
# file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
# #Files EM:
# EMpath = 'core_omem/EM_C-ts'
# listFiles = list.files(path = EMpath)
# file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))


# -------------------------------------------------------
# 2-8) Temporal scenario: (OM has cohort effect but EM ignores it)

# nameScenario = 'scenario_temporal_OM-Y_EM-C-dev'
# dir.create(path = nameScenario)
# dir.create(path = paste0(nameScenario, '/cod-om'))
# dir.create(path = paste0(nameScenario, '/cod-em'))

# #Files OM:
# OMpath = 'core_omem/OM_base'
# listFiles = list.files(path = OMpath)
# file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
# #Files EM:
# EMpath = 'core_omem/EM_C-dev'
# listFiles = list.files(path = EMpath)
# file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# -------------------------------------------------------
# 2-9) Temporal scenario: (OM has cohort effect and EM consider year effect - ts)

# nameScenario = 'scenario_temporal_OM-C_EM-Y-ts'
# dir.create(path = nameScenario)
# dir.create(path = paste0(nameScenario, '/rock-om'))
# dir.create(path = paste0(nameScenario, '/rock-em'))

# #Files OM:
# OMpath = 'core_omem/OM_base'
# listFiles = list.files(path = OMpath)
# file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
# #Files EM:
# EMpath = 'core_omem/EM_Y-ts'
# listFiles = list.files(path = EMpath)
# file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 2-10) Temporal scenario: (OM has cohort effect and EM consider year effect - devs)

# nameScenario = 'scenario_temporal_OM-C_EM-Y-dev'
# dir.create(path = nameScenario)
# dir.create(path = paste0(nameScenario, '/cod-om'))
# dir.create(path = paste0(nameScenario, '/cod-em'))

# #Files OM:
# OMpath = 'core_omem/OM_base'
# listFiles = list.files(path = OMpath)
# file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
# #Files EM:
# EMpath = 'core_omem/EM_Y-dev'
# listFiles = list.files(path = EMpath)
# file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 3-1) Spatial scenario: (OM has two areas and EM one.) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-1A'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 3-4) Spatial scenario: (OM has two areas and EM two.) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-2A'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_2A'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 3-4) Spatial scenario: (OM has two areas and EM areas as fleet) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-AaF'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_AaF'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))


# -------------------------------------------------------
# 3-1-1) Spatial scenario: (OM has two areas and EM one.) R: 50-50. K equal between areas in OM

nameScenario = 'scenario_spatial_OM-2A_EM-1A_Equal'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Equal'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 3-4-1) Spatial scenario: (OM has two areas and EM two.) R: 50-50 K equal between areas in OM

nameScenario = 'scenario_spatial_OM-2A_EM-2A_Equal'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Equal'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_2A'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

# -------------------------------------------------------
# 3-4-1) Spatial scenario: (OM has two areas and EM areas as fleet) R: 50-50 K equal between areas in OM

nameScenario = 'scenario_spatial_OM-2A_EM-AaF_Equal'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/rock-om'))
dir.create(path = paste0(nameScenario, '/rock-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Equal'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/rock-om'))
#Files EM:
EMpath = 'core_omem/EM_AaF'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/rock-em'))

