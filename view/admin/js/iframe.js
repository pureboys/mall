window.onload = function () {
    //使用闭包防止污染
    (window.onresize = function () {
        //获取可见宽度
        var width = document.documentElement.clientWidth - 200;
        //获取可见高度
        var height = document.documentElement.clientHeight - 80;
        if (width >= 0) document.getElementById('main').style.width = width + 'px';
        if (height >= 0) {
            document.getElementById('main').style.height = height + 'px';
            document.getElementById('sidebar').style.height = height + 'px';
        }
    })()
};
