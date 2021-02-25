document.addEventListener("DOMContentLoaded", () => {
    const password = document.getElementById("user_password");
    if(password === null)
        return;

    const confirmation = document.getElementById("user_password_confirmation");
    const successIcon = document.querySelector(".octicon-check-circle-fill");
    const failureIcon = document.querySelector(".octicon-x-circle-fill");
    const checkFunction = () => checkPasswordConfirmation(password, confirmation, successIcon, failureIcon);

    password.addEventListener("input", checkFunction);
    confirmation.addEventListener("input", checkFunction);
});

function checkPasswordConfirmation(password, confirmation, successIcon, failureIcon) {
    const passwordContent = password.value;
    const confirmationContent = confirmation.value;
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
