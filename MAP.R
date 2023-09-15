args=commandArgs(trailingOnly = TRUE)
local=args[1]
fseq=args[2]
fbas="sbase"
setwd(local)
fdata=read.table(fseq,header=T)
basdata=read.table(fbas,header=T)
tcount=nrow(fdata);frq=0
matchf=function(x){basdata$count[grep(unlist(x),basdata[,1])] <<- basdata$count[grep(x,basdata[,1])]+1
print(paste(round(100*frq/tcount,4),"%"))
frq <<- frq+1}
sun=lapply(as.list(fdata[,1]),matchf)
write.table(basdata,paste(fseq,".count",sep=""))
file.remove(fseq)