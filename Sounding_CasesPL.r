#Maaybe make a vector somehow of line 500 level 
#  http://www.r-tutor.com/r-introduction/data-frame/data-frame-row-slice
#CASE1
# http://stackoverflow.com/questions/7534466/filtering-a-data-frame


#Case 1 Standard 
so1997082 <-read.table("ttC1_1996_02_20_00Z_pk.txt", header=T, sep=",", row.names = NULL )
  names(so1997082) # case 1 ''

so200107 <-read.table("ttC1_1994_11_1106Z_PK.txt", header=T, sep=",", row.names = NULL )
  names(so200107) 

test1PL<-rbind(so1997082, so200107)

##??
so198608 <-read.table("ttC1_1995_11_3012Z_pk.txt", header=T, sep=",", row.names = NULL )
  names(so198608) 

test2PL<-rbind(so198608, test1PL)



so1997083 <-read.table("ttC1_1994_03_1800_pk.txt", header=T, sep=",", row.names = NULL )
  names(so1997083) 

test3PL<-rbind(test2PL, so1997083)


so200210 <-read.table("ttC1_1993_01_3112Z_stpk.txt", header=T, sep=",", row.names = NULL )
  names(so200210) 
test44PL<-rbind(test3PL, so200210)


so201509 <-read.table("ttC1_1996_02_2300Z_pk.txt", header=T, sep=",", row.names = NULL )
  names(so201509) # Case1''

test4PL<-rbind(test44PL, so201509)

#so200107 <-read.table("tPeak_July05_00Z_2001.txt", header=T, sep=",", row.names = NULL )
#  names(so200107) 




test4PL[test4PL$PRES==200,]
test4PL[test4PL$PRES==500,]
test4PL[test4PL$PRES==700,]
test4PL[test4PL$PRES==850,]
test4PL[test4PL$PRES==900,]
test4PL[test4PL$PRES==925,]


test4925<-test4PL[test4PL$PRES==925,]
test4850<-test4PL[test4PL$PRES==850,]
test4700<-test4PL[test4PL$PRES==700,]
test4500<-test4PL[test4PL$PRES==500,]


boxplot(test4PL$GUST, main="GUST ONE EVENT", ylab=("mph"))

boxplot(test4PL$DIR, main="GUST ONE EVENT", ylab=("mph"))
 boxplot(test4PL$SPD, main="GUST ONE EVENT", ylab=("mph"))
 boxplot(test4PL$PCP01, main="GUST ONE EVENT", ylab=("mph"))
boxplot(test4PL$GUST, test4PL$SPD, names=c("GUST","SPEED"), col="lightgray", horizontal=TRUE, main="GUST ONE EVENT", ylab=("mph"))


#CASE2


so19890812 <-read.table("tPeakc_Aug26_12_1989.txt", header=T, sep=",", row.names = NULL )
  names(so19890812) 

so198908 <-read.table("tPeak_Aug26_00Z_1989.txt", header=T, sep=",", row.names = NULL )
  names(so19890808) 

test7PL<-rbind(so198908, so19890812)

so201209 <-read.table("tPeakc_Sept20_00Z_2012.txt", header=T, sep=",", row.names = NULL )
  names(so201209) 


test8PL<-rbind(so201209, test7PL)

so198610 <-read.table("tPeakc_Oct11_00Z_1986.txt", header=T, sep=",", row.names = NULL )
  names(so198610) #CASE 2''

test10PL<-rbind(so198610, test8PL)




puppy <- subset(test10PL, test10PL$PRES %in% c("925", "938.5","928.7","913.1", "943.3", "943.7"))



test10PL[test10PL$PRES==500,]
test10PL[test10PL$PRES==700,]
test10PL[test10PL$PRES==850,]
test10PL[test10PL$PRES==925 || test10PL$PRES==928.7,]
test10PL[test10PL$PRES==925] || test10PL[test10PL$PRES==928.7,]

test4925<-test4PL[test4PL$PRES==925,]
test4850<-test4PL[test4PL$PRES==850,]
test4700<-test4PL[test4PL$PRES==700,]
test4500<-test4PL[test4PL$PRES==500,]
test10500 <- test10PL[test10PL$PRES==500,]> test10700 <- test10PL[test10PL$PRES==700,]
puppy925 <- subset(test10PL, test10PL$PRES %in% c("925", "938.5","928.7","913.1", "943.3", "943.7"))
test10500 <- test10PL[test10PL$PRES==500,]
test10700 <- test10PL[test10PL$PRES==700,]
test10850 <- test10PL[test10PL$PRES==850,]

#####PLOT PL###################

png(filename="Sounding2_925_SPD_hist_Cases.png")
boxplot(puppy$SKNT,test4850$SKNT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="925mb Wind Direction During Peak", ylab=("Speed (kts)"))
dev.off()

png(filename="Sounding2_925_DIR_hist_Cases.png")
boxplot(puppy$DRCT,test4850$DRCT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="925mb Wind Direction During Peak", ylab=("DEGREES"))
dev.off()


png(filename="Sounding2_850DIR_hist_Cases.png")
boxplot(test10850$DRCT,test4850$DRCT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="850mb Wind Direction During Peak", ylab=("DEGREES"))
dev.off()

png(filename="Sounding2_850DIR_hist_Cases.png")
boxplot(test10850$DRCT,test4850$DRCT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="850mb Wind Direction During Peak", ylab=("DEGREES"))
dev.off()


png(filename="Sounding2_850SPEED_hist_Cases.png")
boxplot(test10850$SKNT,test4850$SKNT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="850mb Wind SPEED During Peak", ylab=("KTS"))
dev.off()

png(filename="Sounding2_700DIR_hist_Cases.png")
boxplot(test10700$DRCT,test4700$DRCT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="700mb Wind Direction During Peak", ylab=("DEGREES"))
dev.off()

png(filename="Sounding2_700SPD_hist_Cases.png")
boxplot(test10700$SKNT,test4700$SKNT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="700mb Wind Speed During Peak", ylab=("DEGREES"))
dev.off()


png(filename="Sounding2_500DIR_hist_Cases.png")
boxplot(test10500$DRCT,test4500$DRCT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="500mb Wind Direction During Peak", ylab=("DEGREES"))
dev.off()

png(filename="Sounding2_500SPD_hist_Cases.png")
boxplot(test10500$SKNT,test4500$SKNT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="500mb Wind Speed During Peak", ylab=("DEGREES"))
dev.off()



png(filename="Sounding2_500RH_hist_Cases.png")
boxplot(test10500$RELH,test4500$RELH, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="500mb RH During Peak", ylab=("DEGREES"))
dev.off()

png(filename="Sounding2_500SPD_hist_Cases.png")
boxplot(test10500$SKNT,test4500$SKNT, names=c("Case2","Case1"), col="lightgray", horizontal=TRUE, main="500mb Wind Speed During Peak", ylab=("DEGREES"))
dev.off()
