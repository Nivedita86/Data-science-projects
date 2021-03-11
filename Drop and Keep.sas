/*DROP= and KEEP= Data Set Options:
Drop= and Keep= options in data step can be used to drop and keep variables in that data set
Drop=, omits all variables specified after it
Keep=, keeps all variables specified after it
Use the KEEP= option instead of the DROP= option if more variables are dropped than kept
Specify drop and keep options in parentheses after a SAS data set name
Syntax:
(DROP = variable(s)) (KEEP = variable(s))
where ,
the DROP= or KEEP= option, in parentheses, follows the name of the data set that contains the variables to be dropped or kept
variable(s)identifies the variables to drop or keep
*/

/* Orgin and MSRP are dropped from the data set sasprac.auto */

data auto1 (drop= origin msrp);
Set learn.auto;
Run;

/* Orgin and MSRP are kept from the data set sasprac.auto */

data auto2 (keep= origin msrp);
Set learn.auto; a=5; keep origin msrp make;       /* gives priority to the 1st keep */
Run;

/* below code by me */
data auto2;
set learn.auto;
a=5;
run;

data auto2a ;
Set learn.auto; a=5; keep origin msrp make ;  /* even if you are defining something after set statement the only variables in the output
                                                 dataset would be the ones in the keep statement or option */
Run;


/* performing calculation in it */

data auto3 (keep= origin msrp a);
Set learn.auto; a=5; msrp=a;
Run;



/* Drop and Keep Statements:
Another way to exclude variables from data set is to use the DROP statementor the KEEP statement
Like the DROP= and KEEP= data set options, these statements drop or keep variables
The DROP statement differs from the DROP= data set option in the following ways:
Cannot use the DROP statement in SAS procedure steps
The DROP statement applies to all output data sets that are named in the DATA statement.
To exclude variables from some data sets but not from others, place the appropriate DROP= data set option next to each data set name that is specified in the DATA statement.
The KEEP statement is similar to the DROP statement, except that the KEEP statement specifies a list of variables to write to output data sets
Use the KEEP statement instead of the DROP statement if the number of variables to keep is significantly smaller than the number to drop



Syntax:
                        DROPvariable(s);
                        KEEPvariable(s);
                 Where,
                 variable(s)identifies the variables to drop or keep */

data auto3;
Set learn.auto;
drop origin msrp;
Run;

data auto4;
Set learn.auto;
keep origin msrp;
Run;
