install.packages('XLConnect')
library(XLConnect) 

#Read workbook
wb <- loadWorkbook("d:\\MyWorkbook.xlsx")

#Read all the Sheets in the workbook
a<-readWorksheet(wb, sheet = getSheets(wb))

#Print data from all worksheets
a

#Print data from Sheet 1
a$Sheet1

#Print data from Sheet 2
a$Sheet2

