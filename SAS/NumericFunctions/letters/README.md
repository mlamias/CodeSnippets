# Letters.sas
|  |  |
|--|--|
|**Author:**  |Mark J. Lamias  |
|E**mail Contact:**  |mlamias (-at-) stochasticgroup (-dot-) com  |
|**Copyright:**  |2019, The Stochastic Group, Inc.  |

### License:  
Users are free to use this software at no cost so long as it is not altered in any way and these comments remain intact with the source code.

### About:  
This function returns a letter in the English alphabet corresponding to the position of the letter given by the first argument.

<table>
<tr>
<td><b>Inputs:</b></td><td><b>x</b> - an integer between 1 and 26.<br><b>lettercase</b> - if "U" or "u" is specified an uppercase letter is returned.  if "L" or "l" is specified, lowercase letters are returned. </td>
</tr>
<tr>
<td><b>Outputs:</b></td><td>An uppercase letter corresponding to the position specifieed by x when "U" is specified for the second argument.  A lowercase version is returned if "L" is specified in the second position.  The table below shows typical inputs and outputs. </td>
</tr>
<tr>
<td><b>Errors:</b></td><td>If either argument is invalid an error message is printed to the SAS log and a value of -1 is returned.</td>
</tr>
</table>




### Typical Inputs & Output:  
<table>
<tr>
<td><b>Input:</b></td>
<td><b>Output:</b></td>
</tr>
<tr>
<td>letters(1, "U") </td>
<td>A</td>
</tr>
<tr>
<td>letters(2, "U") </td>
<td>B</td>
</tr>
<tr>
<td>letters(26, "U")</td>
<td>Z</td>
</tr>
<tr>
<td>letters(1, "L")</td>
<td>a</td>
</tr>
<tr>
<td>letters(24, "d")</td>
<td>-1 is the returned value<br/>ERROR: The second argument to the letters function must be one of:<br> U, u, L, or l.</td>
</tr>
<tr>
<td>letters(30, "U")</td>
<td>-1<br/>ERROR: The second argument to the letters function must be one of:<br/> U, u, L, or l. </td>
</tr>
</table>

### Example Usage:
This shows example usage ***after*** running letters.sas

    options cmplib=sasuser.userfuncs;
    data _null_;
    do i = 1 to 30;
    	lowerletters=letters(i, "L");
    	upperletters=letters(i, "U");
    	put i lowerletters upperletters;
    end;
    run;

### Example Usage Output:

    1    options cmplib=sasuser.userfuncs;
    2    data _null_;
    3    do i = 1 to 30;
    4        lowerletters=letters(i, "L");
    5        upperletters=letters(i, "U");
    6        put i lowerletters upperletters;
    7    end;
    8    run;
    
    1 a A
    2 b B
    3 c C
    4 d D
    5 e E
    6 f F
    7 g G
    8 h H
    9 i I
    10 j J
    11 k K
    12 l L
    13 m M
    14 n N
    15 o O
    16 p P
    17 q Q
    18 r R
    19 s S
    20 t T
    21 u U
    22 v V
    23 w W
    24 x X
    25 y Y
    26 z Z
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    27 -1 -1
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    28 -1 -1
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    29 -1 -1
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    ERROR:  The first argument to the letters function must be an integer between 1 and 26.
    30 -1 -1
    NOTE: DATA statement used (Total process time):
          real time           0.16 seconds
          cpu time            0.17 seconds


			  		
				


