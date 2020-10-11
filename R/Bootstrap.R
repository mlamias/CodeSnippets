population.x<-rpois(1000, lambda=4)
population.mean<-mean(population.x)
population.median<-median(population.x)
population.mean
population.median


sample.x<-sample(population.x, 20)
sample.mean<-mean(sample.x)
sample.median<-median(sample.x)
sample.mean
sample.median


myfunction<-function(thesample){
  boot.sample<-sample(x=thesample, size=length(thesample), replace=TRUE)
  boot.mean<-mean(boot.sample)
  boot.median<-median(boot.sample)
  mylist<-list(boot.mean=boot.mean, boot.median=boot.median)
  return(mylist)
}

a<-data.frame(boot.mean=rep(NA, 1000), boot.median=rep(NA, 1000))

for(i in 1:1000){
  a[i,]<-myfunction(sample.x)
}

#Computer Boostrap Confidence Intervals
upper.ci<-apply(a, 2, mean)+1.96*sqrt(diag(var(a)))
lower.ci<-apply(a, 2, mean)-1.96*sqrt(diag(var(a)))

cbind(lower.ci, upper.ci)
population.mean
population.median
sample.median
