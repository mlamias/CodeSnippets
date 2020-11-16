#This code shows how one can read a zip file without unzipping it.
#It assumes the zip file contains a single text file
#This particular code assumes the text file is tab delimited format
#ByDefault readr will read zip files with an appropriate extension name in the file like .zip or .gz
#Additional options in the read_* function will allow yout to select a specific file to be read if the
#zip contains multiple files

library(readr)
OutputTibbleName <- read_delim(ZipFileName, delim = "\t")