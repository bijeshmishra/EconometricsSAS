PROC IMPORT OUT= WORK.bijesh 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 3\HW3-DATA1_SEAS0.tx
t" 
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
proc print;
run;
proc reg data = bijesh;
model hwind = unemr q1 q2 q3;
run;
test q1 = q2 = q3 = 0;
run;
PROC IMPORT OUT= WORK.bijesh 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 3\HW3-DATA1_SEAS1.tx
t" 
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
proc print;
run;
proc reg data = bijesh;
model hwind = unemr q1 q2 q3;
run;
test q1 = q2 = q3 = 0;
run;

PROC IMPORT OUT= WORK.bijesh 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 3\HW3-DATA1_SEAS.tx
t" 
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
proc print;
run;
proc reg data = bijesh;
model hwind = unemr q1 q2 q3 st;
run;
test st = 0;
run;

proc autoreg data = bijesh;
model hwind = unemr q1 q2 q3/chow = (17);
run;
proc autoreg data = bijesh;
model hwind = unemr/chow = (17);
run;

proc print;
run;
