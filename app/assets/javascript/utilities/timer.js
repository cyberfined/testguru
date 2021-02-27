document.addEventListener("DOMContentLoaded", () => {
    const timer = document.getElementById("js-timer");
    if(timer !== null) {
        showTimer(timer, timer.dataset.timeLeft);
        setTimer(timer);
    }
});

function twoDigitFormat(num) {
    return num.toLocaleString('en-US', {
        minimumIntegerDigits: 2,
        useGrouping: false
    });
}

function setTimer(timer) {
    let timeLeft = timer.dataset.timeLeft;
    const redirect = timer.dataset.redirect;
    const timerId = setInterval(() => {
        timeLeft--;
        if(timeLeft <= 0) {
            clearInterval(timerId);
            window.location.replace(redirect);
            return;
        }
        showTimer(timer, timeLeft);
    }, 1000);
}

function showTimer(timer, timeLeft) {
    const hours = twoDigitFormat(Math.floor(timeLeft / 3600));
    const minutes = twoDigitFormat(Math.floor(timeLeft / 60));
    const seconds = twoDigitFormat(timeLeft % 60);
    timer.innerHTML = `${hours}:${minutes}:${seconds}`;
}
