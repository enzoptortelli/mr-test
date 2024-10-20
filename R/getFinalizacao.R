getFinalizacao <- function(num_testes) {
  page <- '
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
    </head>
    <body>
        <div class="main">
            <h1 class="title">Fim</h1>

            <div class="regular-text">
                <p>Obrigado por participart de nosso estudo!</p>
            </div>

            <a class="fake-button align-end last-button" href="/escolha-musica">
                Reiniciar teste
            </a>

        </div>
    </body>
</html>
  '
  return(page)
}
