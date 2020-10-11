/*Author:  Mark J. Lamias, Leidos, Inc.
  About:  This is sample code that shows one method for quickly creating dummy variables for a given categorical variable.
	  In this example, we have a dataset with an Investment Type:  Stocks Bonds, IRA, or Land.  We want to generate
          Dummy variables (Data scientists call this "one hot encoding") for each category.  This is done with the proc logistic.
          This requies SAS/STAT.
  Output: A dataset in the work directory called dummyvars as well as the input dataset generated here called investmentdata;
*/

data work.investmentdata;
input id investmentType $;
cards;
1 Stocks
2 Bonds
3 Bonds
4 Bonds
5 Bonds
6 Stocks
7 IRA
8 IRA
9 Land
;
run;

proc logistic data=work.investmentdata outdesign=dummyvars(DROP=Intercept) outdesignonly;
class investmentType /param=glm;
model id = investmentType;
run;
