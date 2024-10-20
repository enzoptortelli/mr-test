getEscolhaMusica <- function(musicas) {
  music_html <- ''
  sapply(musicas, function(musica) {
    music_html <<- glue(music_html, '<option value="{musica}">{musica}</option>')
  })

  page <- glue('
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
    </head>
    <body>
        <div class="main">
            <h1 class="title">Escolha a música</h1>

            <form id="music-form" class="dropdown-form" action="/introducao" method="post">
                <select id="music_file_name" name="music_file_name">
               {music_html}
               <option value="controle">Controle</option>
                </select>
            </form>
            <button class="fake-button align-end last-button" type="submit" form="music-form">
                Iniciar
            </button>

        </div>
    </body>
</html>
  ')
  return(page)
}
