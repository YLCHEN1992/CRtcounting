args=commandArgs(trailingOnly = TRUE)
local=args[1]
fbas=args[2]
setwd(local)
basdata=read.table(fbas)
basdata=paste(basdata[,1],collapse ="")
basdata=unlist(strsplit(basdata,">"))[-1]
site=unlist(lapply(gregexpr("\\|",basdata),function(x){max(unlist(x))}))
names=substr(basdata,1,site)
sequence=substr(basdata,site+1,nchar(basdata))
rm(basdata);gc()
seqlength=nchar(sequence)
basdata=data.frame(sequence=sequence,gene=names,length=seqlength,count=0)
write.table(basdata,"sbase",row.names=F)
write.table(1,"DoingNowB")
q("no")