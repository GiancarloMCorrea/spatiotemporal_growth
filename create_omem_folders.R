rm(list = ls())
setwd('C:/Users/moroncog/Documents/ss3sim_spatial')

# -------------------------------------------------------
# 1) Base scenario:

dir.create(path = 'scenario_base')
dir.create(path = 'scenario_base/cod-om')
dir.create(path = 'scenario_base/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_1area'
listFiles = list.files(path = 'auxFiles/OM_1area')
file.copy(file.path('auxFiles/OM_1area', listFiles), 'scenario_base/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = 'auxFiles/EM_1area')
file.copy(file.path('auxFiles/EM_1area', listFiles), 'scenario_base/cod-em')


# ----------------------------------------------------------------
# 2) Spatial scenario: OM spatial difference and EM constant

dir.create(path = 'scenario_spatial')
dir.create(path = 'scenario_spatial/cod-om')
dir.create(path = 'scenario_spatial/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas_2'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_spatial/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_spatial/cod-em')

# 2.1) Spatial scenario: both OM and EM assume spatial differences

dir.create(path = 'scenario_2_spatial')
dir.create(path = 'scenario_2_spatial/cod-om')
dir.create(path = 'scenario_2_spatial/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas_2'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_2_spatial/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_2areas'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_2_spatial/cod-em')


# -------------------------------------------------------
# THIS GROUP WILL BE FOR THE CLASSIC APPROACH (YEAR EFFECT IN K)
# NO EFFECT ON Linf
# -------------------------------------------------------

# -------------------------------------------------------
# 3) Temporal scenario: (OM has year effect but EM ignores it)

dir.create(path = 'scenario_Y_temporal')
dir.create(path = 'scenario_Y_temporal/cod-om')
dir.create(path = 'scenario_Y_temporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_1area'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_Y_temporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_Y_temporal/cod-em')

# 3-1) Temporal scenario: (both OM and EM includes year-effects)

dir.create(path = 'scenario_Y_2_temporal')
dir.create(path = 'scenario_Y_2_temporal/cod-om')
dir.create(path = 'scenario_Y_2_temporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_1area'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_Y_2_temporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area_ts_2'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_Y_2_temporal/cod-em')



# -------------------------------------------------------
# 4) Spatiotemporal scenario: (OM has year effect temporal variability and spatial, EM ignores them)

dir.create(path = 'scenario_Y_spatiotemporal')
dir.create(path = 'scenario_Y_spatiotemporal/cod-om')
dir.create(path = 'scenario_Y_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas_2'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_Y_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_Y_spatiotemporal/cod-em')


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
# 3) Temporal scenario: (OM cohort effect temporal variability but EM ignores it)

dir.create(path = 'scenario_C_temporal')
dir.create(path = 'scenario_C_temporal/cod-om')
dir.create(path = 'scenario_C_temporal/cod-em')

#Files OM:
OMpath = 'auxFiles/C_OM_1area'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_C_temporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_C_temporal/cod-em')


# 3-1) Temporal scenario: (OM as 3, and EM includes a wrong year effect)

dir.create(path = 'scenario_C_2_temporal')
dir.create(path = 'scenario_C_2_temporal/cod-om')
dir.create(path = 'scenario_C_2_temporal/cod-em')

#Files OM:
OMpath = 'auxFiles/C_OM_1area'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_C_2_temporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area_ts_2'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_C_2_temporal/cod-em')


# 3-2) Temporal scenario: (OM as 3, and EM includes the right cohort effect)

dir.create(path = 'scenario_C_3_temporal')
dir.create(path = 'scenario_C_3_temporal/cod-om')
dir.create(path = 'scenario_C_3_temporal/cod-em')

#Files OM:
OMpath = 'auxFiles/C_OM_1area'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_C_3_temporal/cod-om')
#Files EM:
EMpath = 'auxFiles/C_EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_C_3_temporal/cod-em')


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

