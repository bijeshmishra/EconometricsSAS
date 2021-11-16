PROC IMPORT OUT= WORK.bm 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 5\HW5-DATA1.xl
s" 
            DBMS=EXCEL REPLACE;
     RANGE="SUGAR$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
proc print;
run;

/* Data Management */
data bm; set bm;
lna = log(a);
lnw = log(w);
lnb = log(b);
run;
proc print;
run;

/* Part I */
proc reg data = bm; /* OLS */
model lna = lnb lnw / dwprob; /* Q (a, b, d) */
test lnb + lnw = 0; /* Q (d) */
run;

proc autoreg data = bm;
model lna = lnw lnb / nlag = 1; /* Q (c) */
test lnw + lnb = 0; /* Q (d) */
output out = autoreg1 r = auregehatt;
run;

proc autoreg data = bm;
model lna = lnw lnb / nlag = 1; /* Q (c) */
test lnw + lnb = 0; /* Q (d) */
run;

