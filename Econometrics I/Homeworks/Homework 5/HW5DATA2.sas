PROC IMPORT OUT= WORK.HW5D2 
            DATAFILE= "C:\Users\bmishra\Dropbox\Ph.D. Courseworks\Semest
er II, Spring 2019\Econometric Methods\Homeworks\Homework 5\HW5-DATA2.tx
t" 
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
proc print;
run;

/* Part II */
data hw5d2; set hw5d2;
lny = log(y);
lnk = log(k);
lnw = log(w);
lnl = log(l);
lnp = log(p);
lnr = log(r);
run;
/* b */
proc reg data = hw5d2;
model lny = lnk lnl;
run;
/* c: Model Procedure */
proc model data = hw5d2;
instruments lnp lnr lnw;
endogenous lnk lnl;
production: lny = a0 + a1*lnk + a2*lnl;
demandk: lnk = b0 + b1*lnp + b2*lny + b3*lnr;
demandl: lnl = c0 + c1*lnp + c2*lny + c3*lnw;
fit lny / 2sls;
run;

/* c: Syslin Procedure */
proc syslin data = hw5d2;
instruments lnp lnr lnw;
endogenous lnk lnl lny;
production: model lny = lnk lnl / overid;
demandk: model lnk = lnp lny lnr / overid;
demandl: model lnl = lnp lny lnw / overid;
run;


