# ****************************************************************************
# Title       : Read XLSX File.R
# Description : This program reads a Microsoft Excel File (xlsx extension) and
#             : and stores the result in a tibble that is printed to screen.
#             :  
# Author      : Mark J. Lamias, Leidos, Inc.
# Date        : 10/06/2020
# Email       : mlamias@cdc.gov  
# Inputs      : Microsoft Excel Files (xlsx extension)
# Outputs     : tibble named IQVIAEestimates, but this can be modified
#
# Copyright (c) Mark J. Lamias, 2020
# ****************************************************************************

require(readxl)

#MODIFY CONSTANTS TO POINT TO FILENAME AND DIRECTORY
PATH_TO_FILES <- "C:\\MY DIRECTORY PATH"
IQVIAFILE <- "NAME OF FILE.xlsx"

#READ IN DATA FILE
IQVIAEestimates <- read_xlsx(path = paste0(PATH_TO_FILES, IQVIAFILE))

#PRINT A THE TOP 10 ROWS AND FIRST FEW COLUMNS OF READ IN DATA FILE
print(IQVIAEestimates)
