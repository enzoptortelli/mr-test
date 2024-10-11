seq = '123456789';
startDelay = 3000;
numberDelay = 1000;

displayNumber = document.querySelector('#NUMBER-DISPLAY')
button = document.querySelector('#BUTTON')
formDisplay = document.querySelector('#FORM-DISPLAY')

button.addEventListener('click', function(event) {
    this.style.display = 'none';
    setTimers()
})

function setTimers() {
    for(let i = 0; i <= seq.length; i++) {
        setTimeout(() => {displayNumber.innerHTML = seq[i]}, startDelay + numberDelay*i)
    } 
    
    setTimeout(() => {
        displayNumber.hidden = true;
        formDisplay.style.display = 'flex';
    }, startDelay + numberDelay*seq.length)
    
}

