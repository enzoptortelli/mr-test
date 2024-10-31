getAviso1 <- function(delay_comecar, musica_path) {
  page <- glue('
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
    </head>
    <body>
        <div class="main">
            <h1 class="title">Avisos</h1>

            <div class="regular-text">
                <p>Durante os testes, haverá uma música tocando.</p>
                <p>Ajuste o volume da música tal que fique alto, mas sem que seja desconfortável. Depois desse ponto, evite alterar o volume da música.</p>
            </div>

            <a class="fake-button align-end last-button" href="/teste-mr-treinamento">
                Iniciar treinamento
            </a>

            <figure>
                <audio autoplay loop src="/static/music/mr_test/{musica_path}"></audio>
            </figure>
        </div>
    </body>
</html>
  ')
  return(page)
}
