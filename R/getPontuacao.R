getPontuacao <- function(pontuacoes, treinamento) {
  pontuacao_html <- ''
  i <- 1
  sapply(pontuacoes, function(pontuacao) {
    pontuacao_html <<- paste0(pontuacao_html, '<p><b>Teste ',i, '</b>: ', pontuacao,'</p>')
    i <<- i + 1
  })

  link <- ifelse(treinamento, '/aviso2', '/finalizacao')

  page <- glue('
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
    </head>
    <body>
        <div class="main">
            <h1 class="title">Resultados</h1>

            <div id="RESULTADO" class="regular-text">
               {pontuacao_html}
            </div>

            <a class="fake-button align-end last-button" href="{link}">
                Continuar
            </a>
        </div>
    </body>
</html>
  ')

  return(page)
}
