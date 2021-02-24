document.addEventListener("DOMContentLoaded", () => {
    password = document.getElementById("user_password");
    if(password === null)
        return;

    confirmation = document.getElementById("user_password_confirmation");
    successIcon = document.querySelector(".octicon-check-circle-fill");
    failureIcon = document.querySelector(".octicon-x-circle-fill");
    checkFunction = () => checkPasswordConfirmation(password, confirmation, successIcon, failureIcon);

    password.addEventListener("input", checkFunction);
    confirmation.addEventListener("input", checkFunction);
});

function checkPasswordConfirmation(password, confirmation, successIcon, failureIcon) {
    passwordContent = password.value;
    confirmationContent = confirmation.value;
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
