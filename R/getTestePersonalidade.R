getTestePersonalidade <- function() {
  page <- glue('
  <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/static/styles/styles.css">
    </head>
    <body>
        <div class="main">
            <h1 class="title">Aviso</h1>

            <form class="radio-form" id="extrovert-form" action="/pontuacao" method="post">
                <fieldset>
                    <legend>Como você se define?</legend>
                    <div>
                        <input type="radio" id="radio-1" name="extrovert_level" value="introvertido">
                        <label for="radio-1">Introvertido</label>
                    </div>

                    <div>
                        <input type="radio" id="radio-2" name="extrovert_level" value="pouco-introvertido">
                        <label for="radio-2">Um pouco introvertido</label>
                    </div>

                    <div>
                        <input type="radio" id="radio-3" name="extrovert_level" value="pouco-extrovertido">
                        <label for="radio-3">Um pouco extrovertido</label>
                    </div>

                    <div>
                        <input type="radio" id="radio-4" name="extrovert_level" value="extrovertido">
                        <label for="radio-4">Extrovertido</label>
                    </div>

                </fieldset>
            </form>

            <button class="fake-button align-end last-button" type="submit" form="extrovert-form">
                Finalizar
            </button>

        </div>
    </body>
</html>
  ')
  return(page)
}
