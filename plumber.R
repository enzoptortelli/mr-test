#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(glue)
library(readr)
library(stringr)
library(tibble)
options("plumber.port" = 5555)

files.sources = list.files('R')
sapply(files.sources, function(file) {
  source(paste0('R/', file))
})

NUM_TESTE <- 10
NUM_DIGITOS <- 9
NUM_TESTE_TREINAMENTO <- 3
TIMER_RESPOSTA <- 20
TEMPO_DIGITO <- 1
TEMPO_ENTRE_DIGITOS <- 0.3
DELAY_COMECAR <- 10
DELAY_ENTRE_TESTES <- 3

mr_music <- list.files(file.path('static', 'music', 'mr_test'))
vol_test_music <- list.files(file.path('static', 'music', 'volume_test'))
if(length(mr_music) == 0) {
  stop('Coloque as músicas nas pastas indicadas no README')
}


setMrCookies <- function(res, treinamento) {
  res$setCookie('TIMER_RESPOSTA', TIMER_RESPOSTA)
  res$setCookie('TEMPO_DIGITO', TEMPO_DIGITO * 1000)
  res$setCookie('TEMPO_ENTRE_DIGITOS', TEMPO_ENTRE_DIGITOS * 1000)
  res$setCookie('DELAY_COMECAR', DELAY_COMECAR * 1000)
  res$setCookie('DELAY_ENTRE_TESTES', DELAY_ENTRE_TESTES * 1000)

  if(treinamento) res$setCookie('isPractice', '1')
  else res$setCookie('isPractice', '0')

  num_test <- ifelse(treinamento, NUM_TESTE_TREINAMENTO, NUM_TESTE)
  seqs <- getSeqs(num_test, NUM_DIGITOS)

  lapply(1:nrow(seqs), FUN = function(index) {
    res$setCookie(paste0('mrTeste_', index), paste0(seqs[index,], collapse = ""))
  })
}


#* @apiTitle Plumber Example API
#* @apiDescription Plumber example description.

#* @assets ./static /static
list()

#* @serializer html
#* @get /escolha-musica
#* @get /
function(req, res) {
  sapply(names(req$cookies), function(cookie) {
    res$removeCookie(cookie)
  })

  getEscolhaMusica(mr_music)

}


#* @serializer html
#* @post /introducao
function(req, res) {
  musica <- req$body['music_file_name']
  res$setCookie('music_file_name', musica)

  getIntroducao(num_teste = NUM_TESTE,
                num_digitos = NUM_DIGITOS,
                timer_resposta = TIMER_RESPOSTA,
                num_teste_treinamento = NUM_TESTE_TREINAMENTO,
                nome_musica = musica)
}

#* @serializer html
#* @get /aviso1
function(req) {
  musica <-
  getAviso1(DELAY_COMECAR, req$cookies['music_file_name'])
}

#* @serializer html
#* @get /teste-mr-treinamento
function(res, req) {
  setMrCookies(res, treinamento = TRUE)
  musica <- ifelse(req$cookies['music_file_name'] %>% unlist() == 'controle',
                   'controle',
                   vol_test_music)
  getTesteMR(treinamento = TRUE, musica = req$cookies['music_file_name'])
}

#* @serializer html
#* @get /pontuacao-treinamento
function(req) {
  respostas <- extractResponseFromCookies(req$cookies)
  seqs <- extractSequenceFromCookies(req$cookies)

  pontuacao <- calcularPontuacao(respostas, seqs, NUM_DIGITOS)
  getPontuacao(pontuacao, treinamento = TRUE)

}

#* @serializer html
#* @get /aviso2
function() {
  getAviso2(NUM_TESTE)
}

#* @serializer html
#* @get /teste-mr
function(res, req) {
  setMrCookies(res, treinamento = FALSE)
  getTesteMR(treinamento = FALSE, musica = req$cookies['music_file_name'])
}

#* @serializer html
#* @get /teste-personalidade
function() {
  getTestePersonalidade()
}

#* @serializer html
#* @post /pontuacao
function(req) {
  cookies <- req$cookies
  respostas <- cookies[names(cookies) %>% str_starts('mrResponse_')]
  seqs <- cookies[names(cookies) %>% str_starts('mrTeste_')]
  teste_personalidade <- req$body['extrovert_level'] %>% unlist()

  pontuacao <- calcularPontuacao(extractResponseFromCookies(req$cookies),
                                 extractSequenceFromCookies(req$cookies),
                                 NUM_DIGITOS)

  id <- sample(1:1000000000, 1)

  for(i in 1:length(respostas)) {
    insertData(id, i, seqs[[i]], respostas[[i]], pontuacao[i], req$cookies['music_file_name'] %>% unlist(), teste_personalidade[1])
  }

  getPontuacao(pontuacao, treinamento = FALSE)

}

#* @serializer html
#* @get /finalizacao
function() {
  getFinalizacao()
}


