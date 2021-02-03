document.addEventListener("DOMContentLoaded", () => {
    prepareLinks();
});

function reload() {
    window.location.reload(true);
}

function prepareLinks() {
    links = document.getElementsByTagName("a");
    for(i = 0; i < links.length; i++) {
        let link = links[i];
        let method = link.dataset.method;
        let confMsg = link.dataset.confirm;

        if(method !== undefined && method.toLowerCase() !== "get" || confMsg !== undefined) {
            method = method === undefined ? "get" : method.toLowerCase();
            link.addEventListener("click", (e) => {
                let url = link.href;
                e.preventDefault();
                makeRequest(url, method, confMsg);
            });
        }
    }
}

function makeRequest(url, method, confirmMessage) {
    isSure = confirmMessage === undefined ? true : confirm(confirmMessage);
    if(!isSure)
        return;
    if(method === 'get')
        window.location.replace(url);

    xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if(xhr.readyState == 4) {
            reload();
        }
    };

    xhr.open(method, url, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send('authenticity_token=' + AUTH_TOKEN);
}
