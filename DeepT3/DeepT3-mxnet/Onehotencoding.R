#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DeepT3
# 2018
# Jiesi Luo, Southwest Medical University, China
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Onehotencoding
#'
#' Onehotencoding: convert protein N-terminal first 100 residues into a one
#' -hot matrix with 20 rows and 100 columns. The 20 rows corresponds to the 
#' twenty amino acids G, A, V, L, I, P, F, Y, W, S, T, C, M, N, Q, D, E, K, 
#' R and H. The output file ("one-hot.csv") of this function can be used
#' directly for DeepT3 function.
#'
#'
#' @usage Onehotencoding(FileName)
#'
#' @examples
#' Onehotencoding("textsequence.txt")
#' @export one-hot.csv
#'
#'
#'@author:ljs@swmu.edu.cn
###########################################################################

Onehotencoding<-function(FileName) {
      
     seqAA<-read.fasta(FileName,seqtype=c("AA"),as.string=TRUE
                       ,seqonly=TRUE)

     one_hot1<-diag(1,20,20)
  
     one_hot2<-matrix(0,nrow=1,ncol=20)

     one_hot<-rbind(one_hot1,one_hot2)

     AA_type<-c("G","A","V","L","I","P","F","Y","W","S","T","C","M","N","Q","D","E","K","R","H","X")

   test<-vector()

     for (num in 1:length(seqAA)) {

          aminoacid<-substring(seqAA[num],1:100,1:100)

            for(AA in 1:21) {
             
              aminoacid<-str_replace_all(aminoacid,AA_type[AA],str_c(as.character(one_hot[AA,]),collapse=""))
               }
     test[num]<-str_split(str_c(aminoacid,collapse =""),"")
       }
    test_array <-t(do.call(rbind,test))

    output<-rbind(seqAA,test_array)
    
    write.csv(t(output),file="one-hot.csv",row.names=FALSE)

}
