# ****************************************************************************
# Title       : GetADGroupMembers.R
# Description : This program reads Queries Active Directory (AD) for a group
#             : name and returns a tibble of group members.
#             :  
# Author      : Mark J. Lamias, Leidos, Inc.
# Date        : 10/10/2020
# Email       : mlamias@cdc.gov  
# Inputs      : GroupName = <AD Group Name>
#             : PplObjects = <Principal AD Objects>
#             : Recursive = <TRUE/VALSE> to get all members in the hierarchy
#             : of a group that do not contain child objects.
#             : One of "distinguishedName","name","objectClass","objectGUID",
#             : "SamAccountName","SID", or "*"
# Outputs     : tibble named IQVIAEestimates, but this can be modified
# Example Use : GetADGroupMember("Administrators", 
#             : "name", Recursive=TRUE)
# More info   : https://docs.microsoft.com/en-us/powershell/module/
#               addsadministration/get-adgroupmembe
#
# Copyright (c) Mark J. Lamias, 2020
# ****************************************************************************

GetADGroupMember<-function(GroupName = "", 
                           PplObjects = c("name", "SamAccountName"),
                           Recursive = TRUE){
  #Check inputs
  if (!nzchar(GroupName)){
    stop("`GroupName` must be specified as a character value, ", call. = FALSE)  
  } else if (sum(!nzchar(PplObjects)) > 0){
    stop("`Columns` must be specified as a character value, ", call. = FALSE)  
  } else if (!Recursive %in% c(TRUE,FALSE)){
    stop("`Recursive` must be specified as TRUE or FALSE, ", call. = FALSE)  
  }
  #Call Powershell Query
  PSQuery <- glue::glue('Get-ADGroupMember -Recursive "{GroupName}" | Select {paste(columns, collapse=", ")} | ConvertTo-Csv -NoTypeInformation')
  readr::read_delim(system2("powershell", PSQuery, stdout = TRUE), delim=",")
}
