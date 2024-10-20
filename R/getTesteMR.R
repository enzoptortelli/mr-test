getTesteMR <- function(treinamento, musica) {
  titulo <- ifelse(treinamento, 'Treinamento', 'Teste')
  musica <- ifelse(musica == 'controle',
                   '',
                   glue('<audio loop src="/static/music/{ifelse(treinamento, "volume_test/", "mr_test/")}{musica}"></audio>'))

  page <- paste0('
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
        <style>
            #FORM-DISPLAY {
                display: none;
                flex-direction: column;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <h1 class="title">', titulo, ' <span id="TEST-NUMBER"></span></h1>

            <div id="NUMBER-DISPLAY" class="number-display">

            </div>

            <button id="BUTTON" class="fake-button align-end last-button">
                    Iniciar
            </button>



            <div id="FORM-DISPLAY">
                <div class="regular-text"><p>Tempo restante: <span id="TEMPO-RESTANTE"></span>s</p></div>
                <div class="regular-text">
                    <p id="INPUT-LABEL">Digite os números na ordem em que foram apresentados:</p>
                </div>

                    <input class="trial-input" id="FORM-INPUT" name="trial-input" type="text" spellcheck="false" required autocomplete="off">

                <button id="FORM-BUTTON" class="fake-button align-end last-button">
                    Avançar
                </button>
            </div>

        </div>
    </body>
    <figure>', musica,
    '</figure>
    <script src="/static/script/teste-mr.js"></script>
</html>
  ')

  return(page)
}
