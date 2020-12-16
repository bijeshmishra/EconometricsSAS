PROC IMPORT OUT= WORK.bm 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 3\HW3-DATA2.xl
s" 
            DBMS=EXCEL REPLACE;
     RANGE="'FOOD COST$'"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
proc print;
run;

data bm; set bm;
y = y;
x = x;
sqx = x**2;
cubx = X**3;
lny = log(y);
lnx = log(x);
sqlnx = lnx**2;
run;
proc print;
run;
proc reg data = bm;
model y = x sqx cubx;
run;
test x = 0;
test sqx = 0;
test cubx = 0;
test x = sqx = cubx = 0;
run;

proc autoreg data = bm;
model y = x sqx/reset;
run;
proc autoreg data = bm;
model y = x sqx cubx/reset;
run;

data bm; set bm;
y = y;
x = x;
lny = log(y);
lnx = log(x);
sqlnx = lnx**2;
run;
proc autoreg data = bm;
model y = x sqx cubx/reset;
run;
proc autoreg data = bm;
model lny = lnx sqlnx/reset;
run;
