rm(list = ls())
setwd('C:/Users/moroncog/Documents/Manuscript_2_Codes_cod')

# -------------------------------------------------------
# 1) Base scenario:

nameScenario = 'scenario_base'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# -------------------------------------------------------
# 2-1) Temporal scenario: (OM has year effect but EM ignores it)

nameScenario = 'scenario_temporal_OM-Y'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 2-2) Temporal scenario: (OM has year effect and EM consider it - ts)

nameScenario = 'scenario_temporal_OM-Y_EM-Y-ts'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 2-3) Temporal scenario: (OM has year effect and EM consider it - devs)

nameScenario = 'scenario_temporal_OM-Y_EM-Y-dev'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-dev'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 2-4) Temporal scenario: (OM has cohort effect but EM ignores it)

nameScenario = 'scenario_temporal_OM-C'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 2-5) Temporal scenario: (OM has cohort effect and EM consider it - ts)

nameScenario = 'scenario_temporal_OM-C_EM-C-ts'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_C-ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 2-6) Temporal scenario: (OM has cohort effect and EM consider it - devs)

nameScenario = 'scenario_temporal_OM-C_EM-C-dev'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_C-dev'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# -------------------------------------------------------
# 2-7) Temporal scenario: (OM has year effect and EM consider cohort effect - ts)

nameScenario = 'scenario_temporal_OM-Y_EM-C-ts'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_C-ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# -------------------------------------------------------
# 2-8) Temporal scenario: (OM has cohort effect but EM ignores it)

nameScenario = 'scenario_temporal_OM-Y_EM-C-dev'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_C-dev'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# -------------------------------------------------------
# 2-9) Temporal scenario: (OM has cohort effect and EM consider year effect - ts)

nameScenario = 'scenario_temporal_OM-C_EM-Y-ts'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 2-10) Temporal scenario: (OM has cohort effect and EM consider year effect - devs)

nameScenario = 'scenario_temporal_OM-C_EM-Y-dev'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_base'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_Y-dev'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))




# -------------------------------------------------------
# 3-1) Spatial scenario: (OM has two areas and EM one.) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-1A'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# 3-2) Spatial scenario: (OM has two areas and EM one.) R:90-10

# nameScenario = 'scenario_spatial_OM-2A-R90-10_EM-1A'
# dir.create(path = nameScenario)
# dir.create(path = paste0(nameScenario, '/cod-om'))
# dir.create(path = paste0(nameScenario, '/cod-em'))

# #Files OM:
# OMpath = 'core_omem/OM_2A_R90-10'
# listFiles = list.files(path = OMpath)
# file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
# #Files EM:
# EMpath = 'core_omem/EM_base'
# listFiles = list.files(path = EMpath)
# file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# # 3-3) Spatial scenario: (OM has two areas and EM one.) R:10-90

# nameScenario = 'scenario_spatial_OM-2A-R10-90_EM-1A'
# dir.create(path = nameScenario)
# dir.create(path = paste0(nameScenario, '/cod-om'))
# dir.create(path = paste0(nameScenario, '/cod-em'))

# #Files OM:
# OMpath = 'core_omem/OM_2A_R10-90'
# listFiles = list.files(path = OMpath)
# file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
# #Files EM:
# EMpath = 'core_omem/EM_base'
# listFiles = list.files(path = EMpath)
# file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# -------------------------------------------------------
# 3-4) Spatial scenario: (OM has two areas and EM two.) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-2A'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_2A'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 3-4) Spatial scenario: (OM has two areas and EM areas as fleet) R: 50-50

nameScenario = 'scenario_spatial_OM-2A_EM-AaF'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_AaF'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))




# -------------------------------------------------------
# 3-1-1) Spatial scenario: (OM has two areas and EM one.) R: 50-50. K equal between areas in OM

nameScenario = 'scenario_spatial_OM-2A_EM-1A_Kequal'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Kequal'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 3-4-1) Spatial scenario: (OM has two areas and EM two.) R: 50-50 K equal between areas in OM

nameScenario = 'scenario_spatial_OM-2A_EM-2A_Kequal'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Kequal'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_2A'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

# -------------------------------------------------------
# 3-4-1) Spatial scenario: (OM has two areas and EM areas as fleet) R: 50-50 K equal between areas in OM

nameScenario = 'scenario_spatial_OM-2A_EM-AaF_Kequal'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A_Kequal'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_AaF'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))









# -------------------------------------------------------
# 4-1) Spatiotemporal scenario: (OM has Y effect temporal variability and spatial, EM ignores them)

nameScenario = 'scenario_spatial_temporal_OM-2A-Y_EM-1A'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# 4-2) Spatiotemporal scenario: (OM has Y effect temporal variability and spatial, EM considers both (env obs))

nameScenario = 'scenario_spatial_temporal_OM-2A-Y_EM-2A-Y-ts'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_2A_Y-ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))

























# -------------------------------------------------------
# 4-1) Spatiotemporal scenario: (OM has year effect temporal variability and spatial, EM ignores them)

nameScenario = 'scenario_spatial_temporal_OM-2A-Y_EM-1A'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_base'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))


# 4-2) Spatiotemporal scenario: (OM has year effect temporal variability and spatial, EM spatial and temporal: devs)

nameScenario = 'scenario_spatial_temporal_OM-2A-Y_EM-2A-Y-dev'
dir.create(path = nameScenario)
dir.create(path = paste0(nameScenario, '/cod-om'))
dir.create(path = paste0(nameScenario, '/cod-em'))

#Files OM:
OMpath = 'core_omem/OM_2A'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), paste0(nameScenario, '/cod-om'))
#Files EM:
EMpath = 'core_omem/EM_2A_Y-dev'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), paste0(nameScenario, '/cod-em'))











# 4-1) Spatiotemporal scenario: (OM as 4, and EM only considers spatial effects)

dir.create(path = 'scenario_Y_2_spatiotemporal')
dir.create(path = 'scenario_Y_2_spatiotemporal/cod-om')
dir.create(path = 'scenario_Y_2_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas_2'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_Y_2_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_2areas'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_Y_2_spatiotemporal/cod-em')


# 4-2) Spatiotemporal scenario: (OM as 4, and EM only considers temporal year-effect)

dir.create(path = 'scenario_Y_3_spatiotemporal')
dir.create(path = 'scenario_Y_3_spatiotemporal/cod-om')
dir.create(path = 'scenario_Y_3_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas_2'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_Y_3_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area_ts_2'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_Y_3_spatiotemporal/cod-em')



# 4-3) Spatiotemporal scenario: (EM assumes ts)

dir.create(path = 'scenario_Y_4_spatiotemporal')
dir.create(path = 'scenario_Y_4_spatiotemporal/cod-om')
dir.create(path = 'scenario_Y_4_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas_2'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_Y_4_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_2areas_ts_2'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_Y_4_spatiotemporal/cod-em')



# -------------------------------------------------------
# THIS GROUP WILL BE FOR THE NEW APPROACH (COHORT EFFECT IN K)
# NO EFFECT ON Linf

# -------------------------------------------------------
# 4) Spatiotemporal scenario: (OM spatiotemporal variability - cohort effect-, and EM ignores it)

dir.create(path = 'scenario_C_spatiotemporal')
dir.create(path = 'scenario_C_spatiotemporal/cod-om')
dir.create(path = 'scenario_C_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/C_OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_C_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_C_spatiotemporal/cod-em')


# 4-1) Spatial scenario: (OM as 4, but EM only includes spatial variability)

dir.create(path = 'scenario_C_2_spatiotemporal')
dir.create(path = 'scenario_C_2_spatiotemporal/cod-om')
dir.create(path = 'scenario_C_2_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/C_OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_C_2_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/C_EM_2areas'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_C_2_spatiotemporal/cod-em')


# 4-2) Spatiotemporal scenario: (OM as 4, but EM only includes temporal cohort variability)

dir.create(path = 'scenario_C_3_spatiotemporal')
dir.create(path = 'scenario_C_3_spatiotemporal/cod-om')
dir.create(path = 'scenario_C_3_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/C_OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_C_3_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/C_EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_C_3_spatiotemporal/cod-em')


# 4-3) Spatiotemporal scenario: (OM as 4, and EM consider both)

dir.create(path = 'scenario_C_4_spatiotemporal')
dir.create(path = 'scenario_C_4_spatiotemporal/cod-om')
dir.create(path = 'scenario_C_4_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/C_OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_C_4_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/C_EM_2areas'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_C_4_spatiotemporal/cod-em')

