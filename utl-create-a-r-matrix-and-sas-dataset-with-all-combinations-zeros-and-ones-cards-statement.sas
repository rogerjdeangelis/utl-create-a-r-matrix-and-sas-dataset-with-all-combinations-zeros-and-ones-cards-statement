%let pgm=utl-create-a-r-matrix-and-sas-dataset-with-all-combinations-zeros-and-ones-cards-statement;

Create a state matrix and dataset with all combinations zeros and ones in sas and r cards statement;

   1 sas parsing cards
   2 sas scan binary string

github
https://tinyurl.com/2e7ndtem
https://github.com/rogerjdeangelis/utl-create-a-r-matrix-and-sas-dataset-with-all-combinations-zeros-and-ones-cards-statement

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                            |                                                          |                                */
/*   INPUT                    | PROCESS (SCRIPT MAKES INPUT)                             |      OUTPUT                    */
/*                            |                                                          |                                */
/*   1 SAS PARSING CARDS      | Note the inital @1 allows reading the strig              |                                */
/*   ===================      | input @1 (n1-n&n) (&n*1.) @@;                            |                                */
/*                            |                                                          |                                */
/*   Number of columns        | %let n=3;                                                |   N1    N2    N3               */
/*   for all possible         | data bincards;                                           |                                */
/*   combination of           |   infile cards4 ;                                        |    0     0     1               */
/*   zeros and ones           |   if _n_=1 then input @;                                 |    0     1     0               */
/*                            |    do b=1 to 2**&n;                                      |    0     1     1               */
/*    %let n=3;               |    _infile_=put(b,binary&n..);                           |    1     0     0               */
/*                            |    input @1 (n1-n&n) (&n*1.) @@;                         |    1     0     1               */
/*                            |    output;                                               |    1     1     0               */
/*                            |   end;                                                   |    1     1     1               */
/*                            |   stop;                                                  |    0     0     0               */
/*                            | cards;                                                   |                                */
/*                            | *                                                        |                                */
/*                            | ;;;;                                                     |                                */
/*                            | run;quit;                                                |                                */
/*                            |                                                          |                                */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                            |                                                          |                                */
/*   2 SAS SCAN BINARY STRING |                                                          |                                */
/*   ======================== |                                                          |                                */
/*      %let n=3;             |  data bincards;                                          |    N1    N2    N3              */
/*                            |   infile cards4 ;                                        |                                */
/*                            |   if _n_=1 then input @;                                 |     0     0     1              */
/*                            |    do b=1 to 2**&n;                                      |     0     1     0              */
/*                            |    _infile_=put(b,binary&n..);                           |     0     1     1              */
/*                            |    input @1 (n1-n&n) (&n*1.) @@;                         |     1     0     0              */
/*                            |    output;                                               |     1     0     1              */
/*                            |   end;                                                   |     1     1     0              */
/*                            |   stop;                                                  |     1     1     1              */
/*                            | cards;                                                   |     0     0     0              */
/*                            | *                                                        |                                */
/*                            | ;;;;                                                     |                                */
/*                            | run;quit;                                                |                                */
/*                            |                                                          |                                */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                            |                                                          |                                */
/*  3 R NATIVE                |                                                          |                                */
/*  ===========               |                                                          |                                */
/*     %let n=3;              | %utl_submit_r64x(resolve('                               |  Var3 Var2 Var1                */
/*                            | create_binary_matrix <- function(n) {                    |     0    0    0                */
/*                            |   expand.grid(rep(list(c(0, 1)), n))                     |     0    0    1                */
/*                            |   [,order(ncol(expand.grid(rep(list(c(0,1)),n))):1)];    |     0    1    0                */
/*                            | };                                                       |     0    1    1                */
/*                            | binary_matrix <- create_binary_matrix(&n);               |     1    0    0                */
/*                            | print(binary_matrix);                                    |     1    0    1                */
/*                            | '));                                                     |     1    1    0                */
/*                            | ;;;;                                                     |     1    1    1                */
/*                            | %utl_rend;                                               |                                */
/*                            |                                                          |                                */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
