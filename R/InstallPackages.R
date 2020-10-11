#Read Package List (modify the directory on the next line to point to the location where PackageList.txt is stored)
  PackageListDirectory<-"d:\\PackageList.txt"
#Read in Packages
  PackageList<-read.table(PackageListDirectory, header = FALSE, as.is=TRUE)
#Find All packages that are not currently installed
  NonInstalledPackages<-setdiff(PackageList[, 1], rownames(installed.packages()))
#Install Packages not yet installed
  install.packages(pkgs = NonInstalledPackages[1:3], repos = "http://cran.us.r-project.org")




