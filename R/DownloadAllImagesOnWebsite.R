library(rvest)
library(httr)
library(tidyverse)
library(tesseract)
library(stringr)
library(readxl)
library("fs")

#Set data directory
DATA_DIRECTORY <- "D:\\images\\"

uastring <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36"
session <- html_session(URL, user_agent(uastring))

#Connect to SDDPH website and read web page
URL <- "REPLACE WITH WEBSITE URL"
ession <- html_session(URL, user_agent(uastring))
html <- read_html(session)

image.tags <- html %>% html_nodes("img")
img.url <- image.tags %>% html_attr("src")




mydownload<-function(imageurl){
  download.file(imageurl, paste0(DATA_DIRECTORY, path_file(imageurl)), mode="wb", method = "libcurl")
}

lapply(img.url, mydownload)


download.file(img.url, paste0(DATA_DIRECTORY, path_file(img.url)), mode="wb", method = "libcurl")
