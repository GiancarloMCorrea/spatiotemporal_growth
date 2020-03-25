# This is a code to create an operating model base:
# DATA FILE:

setwd('C:/Users/moroncog/Documents/ss3sim_spatial')

iniYear = 1
endYear = 50
years = iniYear:endYear

# 1: Catch
# year, season, fleet, catch, catch se

yearVec = rep(years, times = 2)
seasonVec = rep(1, times = 2*length(years))
fleetVec = rep(1:2, each = length(years))
catchVec = rep(1, times = 2*length(years)) # remember, this is OM, we do not need data
catchseVec = rep(0.01, times = 2*length(years))

catchDF = data.frame(year = c(-999, yearVec, -9999),
					 season = c(1, seasonVec, 0),
					 fleet = c(1, fleetVec, 0),
					 catch = c(0, catchVec, 0),
					 catchse = c(0.01, catchseVec, 0))

write.csv(catchDF, 'catch_dat.csv', row.names = FALSE)



# 2: Indices
# year, month, fleet, obs, obs se

yearVec = c(25:50, 25:50)
monthVec = rep(7, times = length(yearVec))
fleetVec = c(rep(3, times = length(25:50)), rep(4, times = length(25:50)))
obsVec = rep(1, times = length(yearVec)) # remember, this is OM, we do not need data
obsseVec = rep(0.2, times = length(yearVec))

indicesDF = data.frame(year = c(yearVec, -9999),
					 month = c(monthVec, 1),
					 fleet = c(fleetVec, 1),
					 obs = c(obsVec, 1),
					 obsse = c(obsseVec, 1))

write.csv(indicesDF, 'indices_dat.csv', row.names = FALSE)


# 3: Len Comps
# year, month, fleet, sex, partition, nsamps, vec (lens)

lenVec = seq(from = 3.5, to = 119.5, by = 1)

# for more than one fleet, just add a new object and then paste (e.g. yearVec1, yearVec2, paste0(yearVec1, yearVec2))
yearVec = c(10:50, 10:50, 25:50, 25:50)
monthVec = rep(7, times = length(yearVec))
fleetVec = c(rep(1, times = length(10:50)), rep(2, times = length(10:50)), rep(3, times = length(25:50)), rep(4, times = length(25:50)))
sexVec = rep(0, times = length(yearVec))
partVec = rep(0, times = length(yearVec))
nsampsVec = rep(100, times = length(yearVec)) # remember, this is OM, we do not need data

compMat = matrix(1, ncol = length(lenVec), nrow = length(yearVec))
compMat2 = rbind(compMat, matrix(0, ncol = length(lenVec), nrow = 1))
colnames(compMat2) = lenVec

lenDF_1 = data.frame(year = c(yearVec, -9999),
					 month = c(monthVec, 0),
					 fleet = c(fleetVec, 0),
					 sex = c(sexVec, 0),
					 partition = c(partVec, 0),
					 nsamps = c(nsampsVec, 0))

lenDF = cbind(lenDF_1, compMat2)

write.csv(lenDF, 'length_dat.csv', row.names = FALSE)


# 4: Age Comps
# year, month, fleet, sex, partition, nsamps, vec (lens)

ageVec = seq(from = 1, to = 12, by = 1)

# for more than one fleet, just add a new object and then paste (e.g. yearVec1, yearVec2, c(yearVec1, yearVec2))
yearVec = c(25:50, 25:50)
monthVec = rep(7, times = length(yearVec))
fleetVec = c(rep(3, times = length(25:50)), rep(4, times = length(25:50)))
sexVec = rep(0, times = length(yearVec))
partVec = rep(0, times = length(yearVec))
agerrVec = rep(1, times = length(yearVec))
lbinloVec = rep(-1, times = length(yearVec))
lbinhiVec = rep(-1, times = length(yearVec))
nsampsVec = rep(100, times = length(yearVec)) # remember, this is OM, we do not need data

compMat = matrix(1, ncol = length(ageVec), nrow = length(yearVec))
compMat2 = rbind(compMat, matrix(0, ncol = length(ageVec), nrow = 1))
colnames(compMat2) = ageVec

ageDF_1 = data.frame(year = c(yearVec, -9999),
					 month = c(monthVec, 0),
					 fleet = c(fleetVec, 0),
					 sex = c(sexVec, 0),
					 partition = c(partVec, 0),
					 agerr = c(partVec, 0),
					 lbinlo = c(lbinloVec,0),
					 lbinhi = c(lbinhiVec,0),
					 nsamps = c(nsampsVec, 0))

ageDF = cbind(ageDF_1, compMat2)

write.csv(ageDF, 'age_dat.csv', row.names = FALSE)



