setwd("C:/Users/bmishra/Dropbox/Ph.D. Courseworks/Semester II, Spring 2019/Econometric Methods/Homeworks/Homework1")

# Question 1: Estimate, Standard Error, t-statistics and R- Squared:
# Solutions:
# A.  T-stat =  [coefficient (bk) - probablity (Bk)]/standard error of bk (Sebk)
# for (i), (ii), (iii) and (iv) use above formula.
# Solution: (v)

n = 1519
df = n - 3
sse = 8.752896
SE_Reg = sqrt(sse/df)
# B. Interpretations.

# C. 
# Step 1.
# Compute alpha
# alha = 1 - (confidence level/100)
alpha = 1 - 95/100
  
# Step 2:
# Find critical probablity
# P_cric = 1 - alpha/2
  
# Step 3:
#find degree of freedom (df):
n = 1519
df = n - 3

# Step 4:
# Find the critical value of T-stat (Tcric) using "p_cric" and "df" using 
# T-table. For 95% CI, Tcric = 1.96. Since we already have 1.96 for tcric,
# we don't need to go through above four steps.

# Step 5:
# find marginal error:
# ME = criticla value (TCric) * standard error

# Solution c, b2
reg_coeff_b2 = 0.527641
st_err_b2 = 0.07984133
# Computing 95% CI for b2
ME_b2 = 1.96 * st_err_b2
# CI = [ME - reg. coefficient , ME + reg. coefficient ]
CI_low_b2 = reg_coeff_b2 - ME_b2
CI_high_b2 = reg_coeff_b2 + ME_b2
# CI_b2 = [0.5236, 0.5317]
# CI_b3 = print((CI_low_b2
#                CI_high_b2), collapse = ",") Work on it.

# Solution c, b3
reg_coeff_b3 = -0.01448177
st_err_b3 = 0.00208
# Computing 95% CI for b3
ME_b3 = 1.96 * st_err_b3
# CI = [ME - reg. coefficient , ME + reg. coefficient ]
CI_low_b3 = reg_coeff_b3 - ME_b3
CI_high_b3 = reg_coeff_b3 + ME_b3
# CI_b3 = [-0.01855857, -0.01040497]

# Solution d, b4
reg_coeff_b4 = -0.013282
st_err_b4 = 0.003259
# Computing 95% CI for b4
ME_b4 = 1.96 * st_err_b4
# CI = [ME - reg. coefficient , ME + reg. coefficient ]
CI_low_b4 = reg_coeff_b4 - ME_b4
CI_high_b4 = reg_coeff_b4 + ME_b4
# CI_b4 = [-0.01966964, -0.00689436]

# Test of equation, C_0337
# Note: I use result from my (adoption paper) data analysis 
# to test this equation.
reg_coeff_C_0337 = 1.059543
st_err_C_0337 = 0.470864
# Computing 95% CI for b3
ME_C_0337 = 1.96 * st_err_C_0337
# CI = [ME - reg. coefficient , ME + reg. coefficient ]
CI_low_C_0337 = reg_coeff_C_0337 - ME_C_0337
CI_high_C_0337 = reg_coeff_C_0337 + ME_C_0337

########################################################################### 
# Question 2:


########################################################################### 

# # Question #3:
# setwd("C:/Users/bmishra/Dropbox/Ph.D. Courseworks/Semester II, Spring 2019/Econometric Methods/Homeworks/Homework1")
# # install.packages("tidyverse")
# install.packages("ggplot2")
# library(tidyverse)
# library(ggplot2)
# 
# mydata = read_csv("HW1-DATA.csv")
# View(mydata)
# str(mydata)
# # reg = lm(Y ~ X, E, T, data = mydata)
