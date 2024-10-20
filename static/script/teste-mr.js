
const seqs = document.cookie.split('; ').filter(c => c.startsWith('mrTeste_')).map((seq) => {
    return seq.split('=')[1]
  });

startDelay = + document.cookie.split('; ').filter(c => c.startsWith('DELAY_COMECAR')).map((seq) => {
    return seq.split('=')[1]
  })[0];

const numberDelay = + document.cookie.split('; ').filter(c => c.startsWith('TEMPO_DIGITO')).map((seq) => {
    return seq.split('=')[1]
  })[0];

const inputTimer = + document.cookie.split('; ').filter(c => c.startsWith('TIMER_RESPOSTA')).map((seq) => {
    return seq.split('=')[1]
  })[0];

const delayBetweenNumber = + document.cookie.split('; ').filter(c => c.startsWith('TEMPO_ENTRE_DIGITOS')).map((seq) => {
    return seq.split('=')[1]
  })[0];


const delayBetweenTests = + document.cookie.split('; ').filter(c => c.startsWith('DELAY_ENTRE_TESTES')).map((seq) => {
    return seq.split('=')[1]
  })[0];

const isPractice = document.cookie.split('; ').filter(c => c.startsWith('isPractice')).map((seq) => {
  return seq.split('=')[1]
})[0] == true;

  



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
    startDelay = delayBetweenTests;
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
        setTimeout(() => {displayNumber.innerHTML = seq[i]}, startDelay + numberDelay*i + delayBetweenNumber*i);
        setTimeout(() => {displayNumber.innerHTML = ''}, startDelay + numberDelay*(i+1) + delayBetweenNumber*i)
    } 
    
    setTimeout(() => {
        showForm();
    }, startDelay + numberDelay*seq.length + delayBetweenNumber*seq.length);
    
}


formButton.addEventListener('click', function(event) {
    clearInterval(inputInterval);
    document.cookie = 'mrResponse_' + seqCount + '=' + formInput.value + ';';
    formInput.value = '';

    if(seqCount == seqs.length) {
      if(isPractice) window.location.href = "/pontuacao-treinamento";
      else window.location.href = "/teste-personalidade";       
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

formInput.addEventListener("keyup", function(event) {
    
    if (event.keyCode === 13) {
      event.preventDefault();
      formButton.click();
    }
});





