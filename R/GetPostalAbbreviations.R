# ****************************************************************************
# Title       : GetPostalAbbreviations.R
# Description : This program obtains a current list of postal abbreviations
#             : and state/territory full names from the US Postal Service
#             :  
# Author      : Mark J. Lamias, The Stochastic Group, Inc.
# Date        : 11/19/2020
# Email       : mlamias at stochasticgroup.com
# Outputs     : tibble named state_abbreviations
# Example Use : getStates()
# More info   : https://pe.usps.com/text/pub28/28apb.htm
#
# Copyright (c) Mark J. Lamias, 2020
# ****************************************************************************

library(rvest)
getStates <- function(){
URL <- "https://pe.usps.com/text/pub28/28apb.htm"
abbreviations <- read_html(URL) %>% 
  html_nodes("table") %>% 
  `[[`(4) %>% 
  html_table() %>% rename(state_name=1, state_abbreviation = 2)
abbreviations
}

#getStates()
