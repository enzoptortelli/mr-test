
const seqs = ['1234', '5678', '09123'];
const startDelay = 3000;
const numberDelay = 1000;
const inputTimer = 7;

let seqCount = 0


displayNumber = document.querySelector('#NUMBER-DISPLAY');
startButton = document.querySelector('#BUTTON');
formDisplay = document.querySelector('#FORM-DISPLAY');
formButton = document.querySelector('#FORM-BUTTON');
formInput = document.querySelector('#FORM-INPUT');
inputLabel = document.querySelector('#INPUT-LABEL');
audioElement = document.querySelector('audio');
titleElement = document.querySelector('#TEST-NUMBER')

tempoElement = document.querySelector('#TEMPO-RESTANTE');

tempoElement.innerHTML = inputTimer;
titleElement.innerHTML = (seqCount + 1) + '/' + seqs.length;

startButton.addEventListener('click', function(event) {
    audioElement.play();
    this.style.display = 'none';
    setTimers(seqs[seqCount]);
    seqCount++;
})

function showForm() {
    displayNumber.style.display = 'none';
    formDisplay.style.display = 'flex';
    let tempoRestante = inputTimer - 1;

    window.inputInterval = setInterval(() => {
        if(tempoRestante <= 0) {
            formInput.style.display = 'none';
            inputLabel.innerHTML = 'Tempo esgotado. Sua respota foi salva. Continue para o próximo teste.';
            clearInterval(inputInterval);
        }
        tempoElement.innerHTML = tempoRestante;
        tempoRestante--;
    }, 1000)
}

function setTimers(seq) {
    for(let i = 0; i <= seq.length; i++) {
        setTimeout(() => {displayNumber.innerHTML = seq[i]}, startDelay + numberDelay*i);
    } 
    
    setTimeout(() => {
        showForm();
    }, startDelay + numberDelay*seq.length);
    
}


formButton.addEventListener('click', function(event) {
    clearInterval(inputInterval);
    document.cookie = 'mrTest-' + seqCount + '=' + formInput.value + ';';
    formInput.value = '';

    if(seqCount == seqs.length) {
        window.location.href = "pontuacao.html";
        return;
    }

    inputLabel.innerHTML = 'Digite os números na ordem em que foram apresentados:';
    tempoElement.innerHTML = inputTimer;
    formInput.style.display = 'block';
    formDisplay.style.display = 'none';
    displayNumber.innerHTML = '';
    displayNumber.style.display = 'flex';

    titleElement.innerHTML = (seqCount + 1) + '/' + seqs.length;

    setTimers(seqs[seqCount]);
    seqCount++;
})





