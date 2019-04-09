DeepT3
=========================
DeepT3 is a deep learning tool for the prediction of Gram-Negative Bacterial Type III Secreted Effectors.


Author
=========================
ljs@swmu.edu.cn


Overview
=========================
DeepT3 tool can be used to make T3SS secreted effectors prediction based on convolutions neural networks and a one-hot representation of N-terminal sequence.
At a high level, the tool consists of (a) a one-hot vector representation for raw N-termianl sequence of 100 residues, (b) two training models to learn weights to the classifier. (c) an inference model to make prediction new proteins.

Usage
=========================
The DeepT3 is performed running the script "main.R". This is a minimal example: source("main.R"). The default test file is "input_example.txt". To run it on other test files, please change the filename parameter in the Onehotencoding function in the "main.R" file.


Data
=========================
There are two folders in the train_test_data folder:

1) train_data_feature matrix: 
   
 pos_training_dataset: 283 T3SS secreted effectors 

 neg_training_dataset_1: 312 non-T3SS secreted effectors created by choosing secreted proteins from T1SS to T8SS in Gram-negative bacteria after removing the known T3SEs and their homologs

 neg_training_dataset_2: 876 non-secreted proteins.

 DeepT3_model_1: CNN model input one-hot vector (283 T3SS and 312 non-T3SS)

 DeepT3_model_2: CNN model input one-hot vector (283 T3SS and 876 non-T3SS)

2) test_data_feature matrix

  pos_independent_test_dataset: 35 T3SS secreted effectors 

  neg_independent_test_dataset: 86 non-T3SS secreted effectors 

  pos_P.syringae_test_dataset:  83 T3SS secreted effectors 

  neg_P.syringae_test_dataset:  14 non-T3SS secreted effectors 


R function and file
=========================

main: The main driver to the DeepT3 scripts 

Onehotencoding: Convert protein N-terminal first 100 residues into a one-hot matrix with 20 rows and 100 columns. The 20 rows corresponds to the twenty amino acids G, A, V, L, I, P, F, Y, W, S, T, C, M, N, Q, D, E, K, R and H.

DeepT3_scores: Predict the T3SEs using the deep convolutional neural network.

CNN£ºThis file implements the convolutional neural network to train, evaluate, and make inference prediction.


Requirements
=========================

The latest version of DeepT3 requires£º 

R 3.3.3
mxnet 0.9.4
seqinr 3.4-5
stringr 1.2.0


Installation
=========================
cran <- getOption("repos")
cran["dmlc"] <- "https://s3-us-west-2.amazonaws.com/apache-mxnet/R/CRAN/"
options(repos = cran)
install.packages("mxnet")


Reference
=========================
Li Xue et al. DeepT3: deep convolutional neural networks accurately identify Gram-Negative Bacterial Type III Secreted Effectors using the N-terminal sequence

 