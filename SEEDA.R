args=commandArgs(trailingOnly = TRUE)
local=args[1]
sn=args[2]
fbas=args[3]
setwd(local)
n=as.numeric(sn); adress=fbas
fdata=readLines(adress)
num=nrow(fdata)
newdata=data.frame(id=fdata[seq(1,num,4),1],seq=fdata[seq(2,num,4),1],score=fdata[seq(4,num,4),1])
newdata=newdata[!grepl("N",newdata[,2]),]
ass=c(1,(1:n)*(nrow(newdata)%/%n))
ass[n+1]=nrow(newdata)
wf=function(x){write.table(newdata[(ass[x-1]+1):ass[x],2],paste(x-1,".seq",sep=""),row.names=F)}
sun=lapply(2:(n+1),wf)
write.table(1,"DoingNowA")
q("no")
