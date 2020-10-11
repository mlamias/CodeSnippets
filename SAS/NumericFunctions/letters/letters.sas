/*
Author:  Mark J. Lamias, The Stochastic Group, Inc.
Contact:  mlamias (-at-) stochasticgroup (-dot-) com
Copyright:  2019, United States of America
License:  Users are free to use this software at no cost so long as it is not altered in any way and these comments remain in tact with the source code.
This function takes returns a letter in the English alphabet corresponding to the position of the letter given by the first argument.
Inputs:	x - an integer between 1 and 26.
		lettercase - if "U" or "u" is specificed an uppercase letter is returned.  if "L" or "l" is specified, lowercase letters are returned.
Outputs:  An uppercase letter corresponding to the position specifieed by x when "U" is specified for the second argument.  
		  A lowercase version is returned if "L" is specified in teh second position.
		  The table below shows typical inputs and outputs

					Input							Output
					============================================
					letters(1, "U")			  		A
					letters(2, "U")					B
					letters(26, "u")				Z
					letters(1, "L")			  		a
					letters(2, "L")					b
					letters(26, "l")				a
					letters(24, "d")				ERROR: The second argument to the letters function must be one of U, u, L, or l.
					letters(30, "U")				ERROR: The second argument to the letters function must be one of U, u, L, or l.

Errors:  If either argument is invalid an error message is printed to the SAS log and a value of -1 is returned.
Usage Examples:  

options cmplib=sasuser.userfuncs;
data _null_;
do i = 1 to 30;
	lowerletters=letters(i, "L");
	upperletters=letters(i, "U");
	put i lowerletters upperletters;
end;
run;
*/

proc fcmp outlib=sasuser.userfuncs.NumericFunctions;
	function letters(x, lettercase $) $;
		lettercaseU=upcase(lettercase);	
		if lettercaseU not in("U", "L") then do;
            put "ERROR: The second argument to the letters function must be one of U, u, L, or l.";	
			return("-1");
		end;
		else if x not in(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26) then do;
			put "ERROR: The first argument to the letters function must be an integer between 1 and 26.";	
			return("-1");
 		end;
		else do;		
			if lettercaseU eq "U" then letterresult = collate(64 + x, 64 + x);
			if lettercaseU eq "L" then letterresult = collate(96 + x, 96 + x);
			return (letterresult);
		end;
		endsub;
run;
