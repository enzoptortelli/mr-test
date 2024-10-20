getAviso2 <- function(num_testes) {
  page <- glue('
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
    </head>
    <body>
        <div class="main">
            <h1 class="title">Aviso</h1>

            <div class="regular-text">
                <p>Com o treinamento encerrado, a próxima estapa consiste na realização dos {num_testes} testes propriamente ditos.</p>
            </div>

            <a class="fake-button align-end last-button" href="/teste-mr">
                Iniciar testes
            </a>

        </div>
    </body>
</html>
  ')
  return(page)
}
