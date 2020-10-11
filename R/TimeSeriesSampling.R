#Sample Blocks for Time Series Data insted
#In this example, we have a facility associated with measured years from 2012-
#2018.
#We randomly sample SampleRate*100% of the facilities and then obtain all
#measured years from those facilities.

sampleRate<-0.80
year<-2012:2018
facility<-rep(1:5, each=length(year))

cbind(facility, year)
emissions<-rnorm(length(facility*length(year)))
mydata<-data.frame(cbind(facility, year, emissions))

sampledFacilities<-sample(x=unique(mydata$facility), size=sampleRate*length(facility))

mydata[mydata$facilityID %in% sampledFacilities,]
