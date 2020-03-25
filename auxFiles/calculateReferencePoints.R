
# Calculate Fmsy and Fmax  ----------------------------------------------------
rm(list = ls())

NatM = 0.34
FishM = seq(from = 0, to = 7, by = 0.01)
nAges = 20
allAges = seq(from = 0, to = nAges, by = 1)
wtA = 5.58883e-006
wtB = 3.18851
Linf = 103
Kpar = 0.195
t0 = -0.356
m50 = 2.2
m95 = 2.8
s50 = 2.2
s95 = 2.8

steep = 1
R0 = 442413
tau = 1

allLength = Linf*(1-exp(-Kpar*(allAges - t0))) 
allWeight = wtA*(allLength^wtB)
allMature = 1/(1+exp(-(allAges-m50)/((m95-m50)/log(19))))
allVulnera = 1/(1+exp(-(allAges-s50)/((s95-s50)/log(19))))
# allVulnera = c(0.00323456, 0.149085, 0.996062, 0.434392, 0.0388279, 0.0387926, 0.0387914, 0.0387912, 0.0387912)
allFecund = allWeight * allMature


virginN = numeric(length(allAges))
virginN[1] = 1
for(i in 2:length(virginN)){virginN[i] = virginN[i-1]*exp(-NatM)}
allVirgEggRec = sum(virginN*allWeight*allMature)

B0 = R0*allVirgEggRec
beta = (B0/R0)*(1-(steep-0.2)/(0.8*steep))
alpha = (steep - 0.2)/(0.8*steep*R0)


Beq = numeric(length(FishM))
SSBeq = numeric(length(FishM))
Ceq = numeric(length(FishM))


for(k in seq_along(FishM)){

  # Equation 6
  tmpx = allVulnera*FishM[k]*tau + NatM
  Q2vec = numeric(length(allAges))
  Q2vec[1] = allFecund[1]
  for(i in 2:length(Q2vec)){
    Q2vec[i] = allFecund[i]*exp(-sum(tmpx[1:(i-1)]))
  }
  Q2 = sum(Q2vec)
  
  Req = (Q2-beta)/(alpha*Q2)
  
  # Equation 4
  Nabun = numeric(length(allAges))
  Nabun[1] = Req
  for(i in 2:length(Nabun)){
    Nabun[i] = Req*exp(-sum(tmpx[1:(i-1)]))
  }
  
  Beq[k] = sum(allWeight*Nabun)
  SSBeq[k] = sum(allWeight*allMature*Nabun)
  Eeq = sum(allFecund*Nabun)
  Ceq[k] = sum(allWeight*Nabun*(FishM[k]*allVulnera/(FishM[k]*allVulnera + NatM))*(1-exp(-tau*(FishM[k]*allVulnera + NatM))))

}

findmsy = which.max(Ceq)
Bmsy = Beq[findmsy]
Fmsy = FishM[findmsy]
SSBmsy = SSBeq[findmsy]



plot(FishM/Fmsy, Ceq, type = 'l', main = c(paste0('h = ', steep, 
                                             ', Fmsy = ', Fmsy, ', Bmsy = ', round(Bmsy), 
                                             ', SSBmsy = ', round(SSBmsy))),
     xlab = 'F/Fmsy', ylab = 'Yield')
abline(h = 0, col = 2, lty = 2)


plot(Beq/Bmsy, Ceq, type = 'l', main = c(paste0('h = ', steep, 
                                                  ', Fmsy = ', Fmsy, ', Bmsy = ', round(Bmsy), 
                                                ', SSBmsy = ', round(SSBmsy))),
     xlab = 'B/Bmsy', ylab = 'Yield')
abline(h = 0, col = 2, lty = 2)