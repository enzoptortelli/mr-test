#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
options("plumber.port" = 5555)

NUM_TESTE <- 10
NUM_DIGITOS <- 12
NUM_TESTE_TREINAMENTO <- 3
TIMER_RESPOSTA <- 30
TEMPO_DIGITO <- 1.2
TEMPO_ENTRE_DIGITOS <- 0.5
DELAY_COMECAR <- 10
DELAY_ENTRE_TESTES <- 5


files.sources = list.files('R')
sapply(files.sources, function(file) {
  source(paste0('R/', file))
})

#* @apiTitle Plumber Example API
#* @apiDescription Plumber example description.

#* @assets ./static /static
list()

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
    list(msg = paste0("The message is: '", msg, "'"))
}

#* @serializer html
#* @get /introducao
function() {
  getIntroducao(num_teste = NUM_TESTE,
                num_digitos = NUM_DIGITOS,
                timer_resposta = TIMER_RESPOSTA,
                num_teste_treinamento = NUM_TESTE_TREINAMENTO)
}

#* @serializer html
#* @get /aviso1
function() {
  getAviso1()
}

#* @serializer html
#* @get /teste-mr
function(res) {
  res$setCookie('TIMER_RESPOSTA', TIMER_RESPOSTA)
  res$setCookie('TEMPO_DIGITO', TEMPO_DIGITO * 1000)
  res$setCookie('TEMPO_ENTRE_DIGITOS', TEMPO_ENTRE_DIGITOS * 1000)
  res$setCookie('DELAY_COMECAR', DELAY_COMECAR * 1000)
  res$setCookie('DELAY_ENTRE_TESTES', DELAY_ENTRE_TESTES * 1000)

  seqs <- getSeqs()

  lapply(1:nrow(seqs), FUN = function(index) {
    res$setCookie(paste0('mrTeste-', index), paste0(seqs[1,], collapse = ""))
  })

  getTesteMR()
}

#* @serializer html
#* @post /pontuacao
function() {
  getPontuacao()
}

#* @serializer html
#* @get /aviso2
function() {
  getAviso2()
}

#* @serializer html
#* @get /teste-personalidade
function() {
  getTestePersonalidade()
}

#* @serializer html
#* @get /finalizacao
function() {
  getFinalizacao()
}


