function addService() {
    var fm = document.add;
    if (fm.name.value == '') {
        alert('售后名称不得为空');
        fm.name.focus();
        return false;
    }
    if (fm.name.value.length < 2) {
        alert('售后名称不得小于2位');
        fm.name.focus();
        return false;
    }
    if (fm.name.value.length > 20) {
        alert('售后名称不得大于20位');
        fm.name.focus();
        return false;
    }

    if (fm.flag.value != '') {
        alert('售后名称被占用');
        fm.name.focus();
        return false;
    }

    return true;
}

function checkService() {
    var name = document.getElementById('name');
    var flag = document.getElementById('flag');
    var ajax = new AjaxObj();
    ajax.swRequest({
        method: "POST",
        sync: false,
        url: '?a=service&m=isName',
        data: "name=" + name.value,
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

function updateBrand() {
    var fm = document.update;
    if (fm.url.value.length > 200) {
        alert('官方地址不得大于200位');
        fm.url.focus();
        return false;
    }
    if (fm.info.value.length > 200) {
        alert('品牌介绍不得大于200位');
        fm.info.focus();
        return false;
    }
    return true;
}



