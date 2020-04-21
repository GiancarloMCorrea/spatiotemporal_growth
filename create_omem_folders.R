
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

# -------------------------------------------------------
# 2) Spatial scenario:

dir.create(path = 'scenario_spatial')
dir.create(path = 'scenario_spatial/cod-om')
dir.create(path = 'scenario_spatial/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_spatial/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_spatial/cod-em')

# -------------------------------------------------------
# 3) Temporal scenario:

dir.create(path = 'scenario_temporal')
dir.create(path = 'scenario_temporal/cod-om')
dir.create(path = 'scenario_temporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_1area'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_temporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_temporal/cod-em')

# -------------------------------------------------------
# 3-1) Temporal scenario: (EM with ts in em)

dir.create(path = 'scenario_2_temporal')
dir.create(path = 'scenario_2_temporal/cod-om')
dir.create(path = 'scenario_2_temporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_1area'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_2_temporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area_ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_2_temporal/cod-em')



# -------------------------------------------------------
# 4) Spatiotemporal scenario:

dir.create(path = 'scenario_spatiotemporal')
dir.create(path = 'scenario_spatiotemporal/cod-om')
dir.create(path = 'scenario_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_spatiotemporal/cod-em')


# -------------------------------------------------------
# 5) Spatial scenario:

dir.create(path = 'scenario_2_spatial')
dir.create(path = 'scenario_2_spatial/cod-om')
dir.create(path = 'scenario_2_spatial/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_2_spatial/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_2areas'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_2_spatial/cod-em')

# -------------------------------------------------------
# 6) Spatiotemporal scenario:

dir.create(path = 'scenario_2_spatiotemporal')
dir.create(path = 'scenario_2_spatiotemporal/cod-om')
dir.create(path = 'scenario_2_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_2_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_2areas'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_2_spatiotemporal/cod-em')

# -------------------------------------------------------
# 6-1) Spatiotemporal scenario: (EM assumes ts in em)

dir.create(path = 'scenario_3_spatiotemporal')
dir.create(path = 'scenario_3_spatiotemporal/cod-om')
dir.create(path = 'scenario_3_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_3_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_2areas_ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_3_spatiotemporal/cod-em')


# -------------------------------------------------------
# 6-1) Spatiotemporal scenario: (EM assumes ts in em but only one area)

dir.create(path = 'scenario_4_spatiotemporal')
dir.create(path = 'scenario_4_spatiotemporal/cod-om')
dir.create(path = 'scenario_4_spatiotemporal/cod-em')

#Files OM:
OMpath = 'auxFiles/OM_2areas'
listFiles = list.files(path = OMpath)
file.copy(file.path(OMpath, listFiles), 'scenario_4_spatiotemporal/cod-om')
#Files EM:
EMpath = 'auxFiles/EM_1area_ts'
listFiles = list.files(path = EMpath)
file.copy(file.path(EMpath, listFiles), 'scenario_4_spatiotemporal/cod-em')
