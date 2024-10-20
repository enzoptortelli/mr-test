getIntroducao <- function(num_teste, num_digitos, timer_resposta, num_teste_treinamento, nome_musica) {
  link <- ifelse(nome_musica == 'controle', '/teste-mr-treinamento', '/aviso1')
  page <- glue('
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
    </head>
    <body>
        <div class="main">
            <h1 class="title">Introdução</h1>

            <div class="regular-text">
                <p>Você está prestes a iniciar um experimento sobre <i>serial recall</i> (recordação em série). </p>
                <p>O experimento é composto por {num_teste} testes, onde, em cada teste, serão apresentados {num_digitos} dígitos aleatórios, um por vez, e logo em seguida, você deverá relembrá-los na ordem em que apareceram.</p>
                <p>Você tem {timer_resposta} segundos para tentar relembrar a sequência de dígitos de cada teste. Caso você ultrapasse esse tempo, sua resposta será enviada da maneira como se encontra. De qualquer forma, continue com os outros testes normalmente.</p>
                <p>A dica que damos para se relembrar mais facilmente dos dígitos é memorizá-los de 3 em 3. Dito isso, você pode escolher o método que achar mais adequado.</p>
                <p>Antes de começarmos os testes, você fará um rápido treinamento a seguir com {num_teste_treinamento} testes.</p>
                <p>Lembre-se que ordem dos dígitos importa.</p>
            </div>

            <a class="fake-button align-end last-button" href="{link}">
                Continuar
            </a>
        </div>
    </body>
</html>')

  return(page)
}
