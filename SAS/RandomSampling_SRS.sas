/*Author:  Mark J. Lamias, Stochastic Group, Inc.
  About:   This program performs simple random sampling without replacement of size n.
*/

proc surveyselect data=EastHigh method=srs n=50 out=sample;
run;
proc print data=sample;
run;
