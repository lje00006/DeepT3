DeepT3
=========================
DeepT3 is a deep learning tool for the prediction of Gram-Negative Bacterial Type III Secreted Effectors.


Author
=========================
ljs@swmu.edu.cn


Overview
=========================
We reproduced DeepT3 in the keras framework using the python. Compared to the previous mxnet version, we mainly re-adjusted the learning rate.


Usage
=========================
To run: $ python model_CNN.py
The model_CNN file implements the convolutional neural network to train the model, evaluate the model, plot loss-acc and ROC cruves, and save the model. If you want to use different training and test data, please change the file name inside the file.

To run: $ python DeepT3_scores.py
The DeepT3_scores file predicts the T3SEs using two CNN models. If you want to predict different data, please change the file name inside the file.


Requirements
=========================
The latest version of DeepT3 requires£º 

python 3.5
Keras 2.2.4
numpy 1.16.2
matplotlib 3.0.2
scikit-learn  0.20.3




Reference
=========================
Li Xue et al. DeepT3: deep convolutional neural networks accurately identify Gram-Negative Bacterial Type III Secreted Effectors using the N-terminal sequence







