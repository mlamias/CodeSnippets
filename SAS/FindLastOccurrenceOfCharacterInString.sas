data _null_;
  string='What were your terminal degree(s) when you entered the program?  (4/6 - DDS)';
  /*findc Searches a string for any character in a list of characters, and the search is modified by the 3rd argument to the function.
  'b' searches from right to left, instead of from left to right, regardless of the sign ofthe start-position argument.*/
  position=findc(string,'(','b');
  put position=;
run;

