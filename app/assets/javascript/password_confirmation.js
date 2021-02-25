document.addEventListener("DOMContentLoaded", () => {
    let password = document.getElementById("user_password");
    if(password === null)
        return;

    let confirmation = document.getElementById("user_password_confirmation");
    let successIcon = document.querySelector(".octicon-check-circle-fill");
    let failureIcon = document.querySelector(".octicon-x-circle-fill");
    let checkFunction = () => checkPasswordConfirmation(password, confirmation, successIcon, failureIcon);

    password.addEventListener("input", checkFunction);
    confirmation.addEventListener("input", checkFunction);
});

function checkPasswordConfirmation(password, confirmation, successIcon, failureIcon) {
    let passwordContent = password.value;
    let confirmationContent = confirmation.value;
    if(confirmationContent.length == 0) {
        successIcon.classList.add("hide");
        failureIcon.classList.add("hide");
    } else if(passwordContent === confirmationContent) {
        successIcon.classList.remove("hide");
        failureIcon.classList.add("hide");
    } else {
        successIcon.classList.add("hide");
        failureIcon.classList.remove("hide");
    }
}
