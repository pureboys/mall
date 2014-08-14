function addPrice() {

    var fm = document.add;
    if (fm.price_left.value == '') {
        alert('左区间不得为空');
        fm.price_left.focus();
        return false;
    }

    if (fm.price_right.value == '') {
        alert('右区间不得为空');
        fm.price_right.focus();
        return false;
    }

    if (isNaN(fm.price_left.value)) {
        alert('左区间必须是数字');
        fm.price_left.focus();
        return false;
    }

    if (isNaN(fm.price_right.value)) {
        alert('右区间必须是数字');
        fm.price_right.focus();
        return false;
    }

    if (Number(fm.price_left.value) >= Number(fm.price_right.value)) {
        alert('左区间的值不得大于右区间的值');
        fm.price_left.focus();
        return false;
    }

    if (fm.flag.value != '') {
        alert('价格区间被占用');
        fm.price_left.focus();
        return false;
    }

    return true;
}

function updatePrice() {
    var fm = document.update;
    if (fm.price_left.value == '') {
        alert('左区间不得为空');
        fm.price_left.focus();
        return false;
    }

    if (fm.price_right.value == '') {
        alert('右区间不得为空');
        fm.price_right.focus();
        return false;
    }

    if (isNaN(fm.price_left.value)) {
        alert('左区间必须是数字');
        fm.price_left.focus();
        return false;
    }

    if (isNaN(fm.price_right.value)) {
        alert('右区间必须是数字');
        fm.price_right.focus();
        return false;
    }

    if (Number(fm.price_left.value) >= Number(fm.price_right.value)) {
        alert('左区间的值不得大于右区间的值');
        fm.price_left.focus();
        return false;
    }

    if (fm.flag.value != '') {
        alert('价格区间被占用');
        fm.price_left.focus();
        return false;
    }

    return true;
}


function checkPrice() {
    var left = document.getElementById('price_left');
    var right = document.getElementById('price_right');
    var flag = document.getElementById('flag');
    var ajax = new AjaxObj();
    ajax.swRequest({
        method: "POST",
        sync: false,
        url: '?a=price&m=isPrice',
        data: "price_left=" + left.value + "&price_right=" + right.value,
        success: function (msg) {
            if (msg == 1) {
                flag.value = "true";
            } else {
                flag.value = "";
            }
        },
        failure: function (a) {
            alert(a);
        },
        soap: this
    });
}