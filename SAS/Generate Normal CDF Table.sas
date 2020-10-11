*Author:  Mark J. Lamias
*Copyright:  2018
*About:	This SAS Code creates a dataset work.temp that generates values of x from -3.49 to 3.49 in increments of 0.01.  For each of these values, 
	the program then calculates calculates the cumulative probability of observing the realized x value, by substituting in the x value into 
	the Gaussian Cumulative Distribution Function (cdf) and stores the resuling value in y.

data work.temp;
format y 8.4 x 8.2;
do x = -3.49 to 3.49 by .01;

z=scan(put(x, 8.2), 2, '.');
z1=substr(z, 1, 1);
z2=substr(z, 2, 1)*.01;
y=cdf('NORMAL', x, 0, 1);

output;
end;
run;
