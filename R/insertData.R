insertData <- function(id, id_teste, seq, resposta, pontuacao, musica, personalidade) {
  if(!dir.exists('data')) dir.create('data')

  data_path <- file.path('data', 'db.csv')

  if(file.exists(data_path)) {
    db <- read_csv(data_path,
                   col_types = 'iiccicc',
                   show_col_types = FALSE)
    db[nrow(db) + 1, ] <- list(id = id,
                         id_teste = id_teste,
                         seq = seq,
                         resposta = resposta,
                         pontuacao = pontuacao,
                         musica = musica,
                         personalidade = personalidade)
  } else {
    db <- data.frame(id = id,
                 id_teste = id_teste,
                 seq = seq,
                 resposta = resposta,
                 pontuacao = pontuacao,
                 musica = musica,
                 personalidade = personalidade)
  }


  write_csv(db, file = data_path)
}
