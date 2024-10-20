getSeqs <- function(qtt_teste, qtt_digitos) {

  seqs <- sample(0:9, qtt_teste*qtt_digitos, replace = TRUE)

  result <- matrix(seqs, nrow = qtt_teste)

  return(result)
}
