/****************************************************************************/
/*AUTHOR:		Mark J. Lamias												*/
/*COPYRIGHT:	2003														*/
/*USAGE:		%order(libname.datasetin, libname.datasetout);				*/
/*DESCRIPTION:	This macro takes an input dataset as returns the output		*/
/*dateset with the columns sorted in alphabetical order						*/
/*EXAMPLE:		%order(sashelp.class, work.temp);							*/
/****************************************************************************/

%macro order(dsn1, dsn2);
%let libname=%upcase(%substr(&dsn1, 1, %eval(%index(&dsn1, .)-1)));
%let memname=%upcase(%substr(&dsn1, %eval(%index(&dsn1, .)+1)));

proc sql noprint;
select
name
into :columns separated by ', '
from
sashelp.vcolumn
where
libname="&libname" and
memname="&memname"
order by name;
quit;

proc sql;
create table &dsn2 as
select
&columns
from
&dsn1;
quit;
%mend;


%order(sashelp.class, work.temp);