#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DeepT3
# 2018
# Jiesi Luo, Southwest Medical University, China
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'DeepT3_scores
#'
#'
#' DeepT3_scores: predict the T3SEs using the deep convolutional neural 
#' network.
#' 
#' @usage DeepT3_scores(FileName)
#'
#' @param FileName A character name of the "one-hot" matrix file
#'
#' @return result.csv A file containing two scores and a label 
#' including DeepT3-1 model T3SEs score, DeepT3-2 model T3SEs score
#' The difference between DeepT3-1 model and DeepT3-2 model is the     
#' negative sample used for the deep CNN construction. The final DeepT3 
#' combines the independent CNN predictions for each protein into a label  #' using a minority voting, in which a protein is classified as T3SE 
#' if all CNN classifiers agree
#' 
#'
#'
#' @examples
#' DeepT3("one-hot.csv")
#' @export result.csv
#'
#' @author£ºljs@swmu.edu.cn

###########################################################################

DeepT3_scores<-function(FileName) {
  
        test<-read.csv(FileName)

        test_onehot<-t(test[,-1])
  
        test_sequences<-as.character(test[,1])

        dim(test_onehot)<-c(20,100,1,ncol(test_onehot))
  
        DeepT3_score1<-predict(DeepT3_model1,test_onehot)

        DeepT3_score2<-predict(DeepT3_model2,test_onehot)

        DeepT3_1<-DeepT3_score1[2,]

        DeepT3_2<-DeepT3_score2[2,]

        DeepT3_1[which(DeepT3_1>0.5)]<-1
        
        DeepT3_1[which(DeepT3_1<=0.5)]<-0

        DeepT3_2[which(DeepT3_2>0.5)]<-1
        
        DeepT3_2[which(DeepT3_2<=0.5)]<-0

        DeepT3<-DeepT3_1+DeepT3_2

        DeepT3[which(DeepT3==2)]<-"T3SE"

        DeepT3[which(DeepT3==0|DeepT3==1)]<-"non-T3SE"


        result<-rbind(test_sequences,DeepT3_score1[2,],DeepT3_score2[2,], DeepT3)

       rownames(result)<-c("Sequence","DeepT3-1", "DeepT3-2", "DeepT3")

       write.csv(t(result),file="result.csv")
      
 }
