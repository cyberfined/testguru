document.addEventListener("DOMContentLoaded", () => {
    Array.from(document.getElementsByClassName("js-sort-by-title")).forEach(header => {
        header.addEventListener("click", () => sortRowsByTitle(header));
    });
});

function outerTable(element) {
    while(element !== null) {
        if(element.tagName == "TABLE")
            break;
        element = element.parentNode;
    }
    return element;
}

function sortRowsByTitle(header) {
    let table = outerTable(header);
    let columnIndex = Array.from(header.parentNode.children).indexOf(header);

    let arrowUp = table.querySelector(".octicon-arrow-up");
    let arrowDown = table.querySelector(".octicon-arrow-down");

    let sortFunction;
    if(arrowUp.classList.contains("hide")) {
        arrowUp.classList.remove("hide");
        arrowDown.classList.add("hide");
        sortFunction = (r1, r2) =>
            r1.cells[columnIndex].innerHTML > r2.cells[columnIndex].innerHTML ? 1 : -1;
    } else {
        arrowUp.classList.add("hide");
        arrowDown.classList.remove("hide");
        sortFunction = (r1, r2) =>
            r2.cells[columnIndex].innerHTML > r1.cells[columnIndex].innerHTML ? 1 : -1;
    }

    let sortedRows = Array.from(table.rows).slice(1).sort(sortFunction);
    table.tBodies[0].append(...sortedRows);
}
