pacotes<-c("dplyr","RPostgreSQL","data.table", "bizdays", "ctv")
lapply(pacotes, library, character.only = TRUE)

diasUteis <- data.frame(bizseq('2018-01-01', '2025-12-31', cal = "Brazil/ANBIMA"))
colnames(diasUteis) <- c("datas")

diasUteis <- arrange(diasUteis)

countDU <- 1
for(i in 1:nrow(diasUteis)){
  if(i == 1){
    mesAtual = as.character(format(diasUteis$datas[i],"%m"))
    diasUteis$ndu[i] <- countDU
    countDU <- countDU + 1
  } else {
    if(as.character(format(diasUteis$datas[i],"%m")) == mesAtual){
      diasUteis$ndu[i] <- countDU
      countDU <- countDU + 1
    } else {
      mesAtual = as.character(format(diasUteis$datas[i],"%m"))
      countDU <- 1
      diasUteis$ndu[i] <- countDU
      countDU <- countDU + 1
    }
  }
}
