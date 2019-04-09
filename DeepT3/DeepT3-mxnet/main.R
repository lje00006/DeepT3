#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DeepT3
# 2018
# Jiesi Luo, Southwest Medical University, China
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#The main driver to the DeepT3 scripts 
#@author: ljs@swmu.edu.cn

library(mxnet)
library(seqinr)
library(stringr)
DeepT3_model1<-mx.model.load("DeepT3-1",iteration = 300)
DeepT3_model2<-mx.model.load("DeepT3-2",iteration = 300)
source("Onehotencoding.R")
source("DeepT3_scores.R")
Onehotencoding("input_example.txt")
DeepT3_scores("one-hot.csv")


