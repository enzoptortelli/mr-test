getSeqs <- function() {
  qtt_teste <- 3
  qtt_num <- 12

  seqs <- sample(0:9, qtt_teste*qtt_num, replace = TRUE)

  result <- matrix(seqs, nrow = qtt_teste)

  return(result)
}
