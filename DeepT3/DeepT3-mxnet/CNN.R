#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DeepT3
# 2018
# Jiesi Luo, Southwest Medical University, China
#'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'This file implements the convolutional neural network to train,
#'evaluate, and make inference prediction.
#'
#'
#' @author: ljs@swmu.edu.cn
###########################################################################

     library("mxnet")

     train<-read.csv("DeepT3_model_1.csv")

     test<-read.csv("pos_independent test dataset.csv")

     train <- data.matrix(train)

     train_x <- t(train[, -1])

     train_y <- train[, 1]

     train_array <- train_x

     dim(train_array) <- c(20, 100, 1, ncol(train_x))

     test_x <- t(test[, -1])

     test_y <- test[, 1]

     test_array <- test_x

     dim(test_array) <- c(20, 100, 1, ncol(test_x))

     data <- mx.symbol.Variable('data')

     conv_1 <- mx.symbol.Convolution(data = data, kernel = c(20,12), num_filter = 50)

    relu_1 <- mx.symbol.Activation(data = conv_1, act_type = "relu")

    pool_1 <- mx.symbol.Pooling(data = relu_1, pool_type = "max", kernel = c(1, 2), stride = c(1, 2))

    flatten <- mx.symbol.Flatten(data = pool_1)

    fc_1 <- mx.symbol.FullyConnected(data = flatten, num_hidden =650)

    relu_2 <- mx.symbol.Activation(data = fc_1, act_type = "relu")

    dr_1<-mx.symbol.Dropout(data = relu_2)

    fc_2 <- mx.symbol.FullyConnected(data = dr_1, num_hidden = 2)

    NN_model <- mx.symbol.SoftmaxOutput(data = fc_2)

    mx.set.seed(100)

    devices <- mx.cpu()

    model <- mx.model.FeedForward.create(NN_model,X = train_array, y = train_y, ctx = devices, num.round = 300, array.batch.size = 80,learning.rate = 0.005,momentum = 0.9, eval.metric = mx.metric.accuracy, epoch.end.callback = mx.callback.log.train.metric(100))

    predicted <- predict(model, test_array)

   predicted_labels <- max.col(t(predicted)) - 1

    table(test_y, predicted_labels)


