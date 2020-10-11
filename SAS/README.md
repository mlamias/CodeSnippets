# CustomSASFunctions
This repository contains a number of custom SAS functions.  Once Executed, they can be called like regular SAS Function calls in subsequent SAS sessions.

Script Name | Description   | Location
------------| ------------- | ---------
letters.sas | Converts Numbers to their corresponding positional letters in the English Alphabet.  For example 1->A, 2->B, 26->Z.  This function is modeled after the "letters" and "LETTERS" functions in R, only this is single fucntion with capitalization controlled by the second argument which is either "U" (uppercase) or "L" lowercase.  | NumericFunctions




### How to run these scripts?
Simply open each .sas file in the SAS editor and run them by pressing F8 in windows or by clicking the "running man"" icon in SAS.  Once you run the program, the custom function will be saved into SAS catalogues where they can be accessed in future SAS sessions, so there is no need to re-run the programs again.

### How do I execute these custom functions.
Once you have run the SAS scripts that define the custom functions, you simply call the function like any other function in SAS, except that you should place the following at the top of your code:

```{sas eval=FALSE}
options cmplib=sasuser.userfuncs;
```

So, for example, if you wanted to run the `letters` function, which converts values like 1, 2, 26 to A, B, and Z respectively, then, after running the main letters.sas script to create the function, you'd run something like the following (Note the options cmplib statement):

```{sas eval=FALSE}
options cmplib=sasuser.userfuncs;
data _null_;
do i = 1 to 30;
	lowerletters=letters(i, "L");
	upperletters=letters(i, "U");
	put i lowerletters upperletters;
end;
run;
```


### How do I remove these custom functions form my SAS system?
To remove any function simply execute the following code in the SAS system editor:
   
   ```{sas eval=FALSE}
   proc fcmp outlib=sasuser.userfuncs;
     deletefunc <FUNCTION NAME>;
   run;
   ```

where `<FUNCTION NAME>` is the name of the function you want to remove.  For example, to remove the "letters" function, you would execute the following code:

   ```{sas eval=FALSE}
   proc fcmp outlib=sasuser.userfuncs;
        deletefunc letters;
   run;
   ```      


