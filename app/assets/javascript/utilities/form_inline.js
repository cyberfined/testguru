document.addEventListener("DOMContentLoaded", () => {
    const links = document.querySelectorAll(".js-form-inline-link");
    if(links.length == 0) return;
    console.log(links);

    Array.from(links).forEach(link => {
        link.addEventListener("click", formInlineClickHandler);
    });

    const errors = document.querySelector(".js-resource-errors");
    if(errors !== null) formTitleToggle(errors.dataset.resourceId);
});

function formInlineClickHandler(e) {
    e.preventDefault();
    formTitleToggle(this.dataset.testId);
}

function formTitleToggle(testId) {
    const link = document.querySelector(`.js-form-inline-link[data-test-id="${testId}"]`);
    const form = document.querySelector(`form[data-test-id="${testId}"]`);
    const title = document.querySelector(`.js-test-title[data-test-id="${testId}"]`);
    link.innerHTML = form.classList.contains("hide") ? "cancel" : "edit";
    form.classList.toggle("hide");
    title.classList.toggle("hide");
}
