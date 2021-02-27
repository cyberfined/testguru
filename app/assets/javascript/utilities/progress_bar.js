document.addEventListener("DOMContentLoaded", () => {
    Array.from(document.querySelectorAll(".progress-bar")).forEach(progressBar => {
        const percent = (progressBar.dataset.value / progressBar.dataset.max) * 100;
        const fill = progressBar.getElementsByTagName("div")[0];
        fill.style.width = `${percent}%`;
    });
});
