document.addEventListener("DOMContentLoaded", () => {
    const ruleSelect = document.getElementById("badge_rule_id");
    if(ruleSelect === null) return;

    const controlsIds = ["select_test_id", "select_category_id", "select_level"];
    const selectIds = ["badge_test_id", "badge_category_id", "badge_level"];

    const controls = controlsIds.map(id => document.getElementById(id));
    const selects = selectIds.map(id => document.getElementById(id));
    const ruleOptions = Array.from(ruleSelect.options);
    const ruleArgument = document.getElementById("badge_rule_argument");
    const isEdit = document.getElementById("is_edit").value === "true";

    ruleSelectHandler(ruleSelect.value, ruleOptions, controls, selects, ruleArgument, isEdit);
    ruleSelect.addEventListener("change", (e) =>
        ruleSelectHandler(e.target.value, ruleOptions, controls, selects, ruleArgument, isEdit));

    selects.forEach(select =>
        select.addEventListener("change", () => ruleArgument.value = select.value));
});

function findValueIndex(value, options) {
    for(let i = 0; i < options.length; i++) {
        if(options[i].value === value)
            return i;
    }
}

function ruleSelectHandler(value, ruleOptions, controls, selects, ruleArgument, isEdit) {
    const valueIndex = findValueIndex(value, ruleOptions);
    controls.forEach((control, index, arr) => {
        if(index == valueIndex) {
            control.classList.remove("hide");
            if(isEdit)
                selects[index].value = ruleArgument.value;
            else
                ruleArgument.value = selects[index].value;
        } else {
            control.classList.add("hide");
        }
    });
}
