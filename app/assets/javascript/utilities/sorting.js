document.addEventListener("DOMContentLoaded", () => {
    headers = document.getElementsByClassName("sort-by-title");
    for(i = 0; i < headers.length; i++) {
        let header = headers[i];
        header.addEventListener("click", () => sortRowsByTitle(header));
    }
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
    table = outerTable(header);
    columnIndex = Array.from(header.parentNode.children).indexOf(header);

    arrowUp = table.querySelector(".octicon-arrow-up");
    arrowDown = table.querySelector(".octicon-arrow-down");

    let sortFunction;
    if(arrowUp.classList.contains("hide")) {
        arrowUp.classList.remove("hide");
        arrowDown.classList.add("hide");
        sortFunction = (r1, r2) => compareRows(r1, r2, columnIndex, true);
    } else {
        arrowUp.classList.add("hide");
        arrowDown.classList.remove("hide");
        sortFunction = (r1, r2) => compareRows(r1, r2, columnIndex, false);
    }

    sortedRows = Array.from(table.getElementsByTagName("tr")).slice(1).sort(sortFunction);

    sortedTable = document.createElement("table");
    sortedTable.appendChild(header.parentNode);
    sortedRows.forEach(e => sortedTable.appendChild(e));
    table.parentNode.replaceChild(sortedTable, table);
}

function compareRows(r1, r2, index, isAscending) {
    val1 = r1.children[index].textContent;
    val2 = r2.children[index].textContent;
    if(isAscending)
        return val1 > val2 ? 1 : (val1 == val2 ? 0 : -1);
    return val2 > val1 ? 1 : (val1 == val2 ? 0 : -1);
}
