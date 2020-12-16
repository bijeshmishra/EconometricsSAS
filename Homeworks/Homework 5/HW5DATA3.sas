PROC IMPORT OUT= WORK.HW5D3 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 5\HW5-DATA3.xl
s" 
            DBMS=EXCEL REPLACE;
     RANGE="data"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
proc print;
run;
/* Part III */
/* a */
proc reg data = hw5d3;
model y = xper cap lab;
run;
/* b */
proc reg data  = hw5d3;
model xper = cap lab age;
output out = aut r = resid p = pred;
run;
proc reg data  = aut;
model y = pred cap lab;
run;

/* c */
proc model data = hw5d3;
instruments age cap lab;
endogenous xper;
BeerProdn: y = a0 + a1*xper + a2*cap + a3*lab;
fit y / 2sls hausman;
run;

proc model data = hw5d3;
instruments age cap lab;
endogenous xper;
BeerProdn: y = a0 + a1*xper + a2*cap + a3*lab;
fit y / 2sls gmm;
run;
