
mrScore = document.cookie.split('; ').filter(c => c.startsWith('mrScore-'));

tabelaResultado = document.querySelector('#RESULTADO');

function getScoreHtml(testNumber, score) {
    let text = document.createTextNode('Resultado teste ' + testNumber + ': ' + score + '/' + mrScore.length + 'acertos');
    let paragraph = document.createElement('p');
    paragraph.appendChild(text);
    return paragraph;

}

mrScore.forEach(function(element, index) {
    tabelaResultado.appendChild(getScoreHtml(index, element.split('=')[1]));
})