#This simple script shows how to make a character string a variable name in R
#see comments in https://stackoverflow.com/questions/33079039/r-append-a-list-wih-assign#comment113872422_33079039

myCharString <- "MyNewVariableNameAsCharacterString"
.GlobalEnv[[myCharString]]<-65
MyNewVariableNameAsCharacterString