$x("//*[@id=\"dev_page_content_wrap\"]")[0].innerHTML = $x("//*[@id=\"dev_page_content_wrap\"]")[0].innerHTML.replaceAll("<h4>", "</div><div id=\"block_for_parce\"><h4>");


function getAllItems() {
    var elements = $x("//*[@id=\"block_for_parce\"]");
    var jsResult = [];
    for (var i = 0; i < elements.length; i++) {
        if (elements[i].children.length < 2) {
            continue;
        }
        var name = elements[i].children[0].textContent;
        var comment = elements[i].children[1].textContent;
        var properties = []
        var table = elements[i].getElementsByClassName("table");
        if (table.length > 0) {
            table = table[0].children[1]
            for (var j = 0; j <  table.children.length; j++) {
                if (table.children[j].children.length >= 3) {
                    properties.push({
                        "name": table.children[j].children[0].textContent,
                        "type": table.children[j].children[1].textContent,
                        "description": table.children[j].children[2].textContent,
                    })
                }
            }
        }
        jsResult.push({
            "name": name, "description": comment, "properties": properties
        });
    }
    return jsResult;
}
