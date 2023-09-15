args=commandArgs(trailingOnly = TRUE)
local=args[1]
num=args[2]
names=args[3]
setwd(local)
n=as.numeric(num)
af=function(x){assign(as.character(paste("S",unlist(x),sep="")),read.table(paste(unlist(x),".seq.count",sep=""),header=T),envir = globalenv())
file.remove(paste(unlist(x),".seq.count",sep=""))}
sun=sapply(1:n,af)
S=S1
for(i in 2:n){S$count=S$count+get(paste("S",n,sep=""))$count}
write.table(S[,2:4],paste("SumCounts[",names,"].count",sep=""))
write.table(1,"DoingNowD")
 