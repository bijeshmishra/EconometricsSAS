PROC IMPORT OUT= WORK.bm 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 4\HW4-DATA.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="hw9$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
data bm; set bm;
/* Condition I */
y = trport;
a = a;
k = k;
x = x;
lnx = log(x);

/* White Test */
a2 = a**2;
k2 = k**2;
lnx2 = lnx**2;

/* Condition II */
ylnx = trport/lnx;
intlnx = 1/lnx;
alnx = a/lnx;
klnx = k/lnx;

/* Condition III */
ylnx2 = trport/lnx2;
intlnx2 = 1/lnx2;
alnx2 = a/lnx2;
klnx2 = k/lnx2;
run;
proc print;
run;
proc reg data = bm;
model y = lnx a k; /* Condition I */
test a = 10;
test k = 2;
test lnx = 24;
run;
proc reg data = bm; 
model ylnx = intlnx alnx klnx; /* Condition II */
test alnx = 10;
test klnx = 2;
test intercept = 24;
run;
proc reg data = bm;
model ylnx2 = intlnx intlnx2 alnx2 klnx2 /noint; /* Condition III */
test alnx2 = 10;
test klnx2 = 2;
test intlnx = 24;
run;

/*GQ Test Data Preparation */
data bm;
set bm;
proc sort;
by descending x;
run;
data bm1; set bm;/* Newly created data = bm1 and bm1 contains first 500 cases */
if x le 610;
run;
data bm2; set bm; /* Newly created data = bm2 and bm1 contains last 500 cases */
if x ge 611;
run;
proc reg data = bm1; 
model ylnx2 = intlnx intlnx2 alnx2 klnx2 /noint; /* Condition III */ /* Change this model for different conditions */
output out = out1 r = ehat1;
run;
proc reg data = bm2;
model ylnx2 = intlnx intlnx2 alnx2 klnx2 /noint; /* Condition III */ /* Change this model for different conditions */
output out = out2 r = ehat2;
run;
/* G-Q Test */
data bmout;
merge out1 out2;
keep ehat1 ehat2;
run;
proc means uss data = bmout;
var ehat1 ehat2;
output out = out3 uss = sse1 sse2;
run;
data bmout1; set out3;
x1 = 500; x2 = 500; k = 4;
sig1sq = sse1/(x1-k);
sig2sq = sse2/(x2-k);
GQ1 = sig1sq/sig2sq; /* Stay with this value if GQ > 1. If not use another line code */
GQ2 = sig2sq/sig1sq; /* Use this GQ value if GQ < 1 from above line code */
run;
proc print;
run;

/* E */ /* White Heteroskedasticity Test */
proc reg data = bm;
model y = lnx a k; /* Condition I */
output out = white
p = whyhatt /* Predicted Value of dependent Variable y */
r = whyresid; /*Residual values of y */
run;

data white; set white;
whyressq = whyresid**2;
run;

proc reg data = white;
model whyressq = lnx k a lnx2 k2 a2/selection = forward;
test lnx = k = a = lnx2 = k2 = a2 = 0;
run;
proc print;
run;

/* F */
/*Variance condition = Linear; Test = Lagrange Multiplier*/
proc autoreg data = bm;
model y = lnx k a;
hetero lnx / link = linear test = lm; 
run;

/*Variance condition = Linear; Test = GLS */
proc autoreg data = bm;
model y = lnx k a /method = ml maxiter = 1000; /*   */
hetero lnx / link = linear test = lm; /*Variance condition = Linear */
run;
