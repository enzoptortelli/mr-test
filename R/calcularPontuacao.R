calcularPontuacao <- function(respostas, seqs, num_digitos) {
  respostas_numeric_list <- respostas
  seqs_numeric_list <- seqs

  pontuacao <- vector()
  for(i in 1:length(respostas_numeric_list)) {
    seq <- seqs_numeric_list[[i]]

    resposta <- respostas_numeric_list[[i]]
    if(length(resposta) < length(seq)) resposta <- c(resposta, rep(NA, times = length(seq) - length(resposta)))
    if(length(resposta > num_digitos)) resposta <- resposta[1:num_digitos]

    pontuacao <- c(pontuacao, (seq == resposta) |> sum(na.rm = TRUE))
  }

  return(pontuacao)
}
