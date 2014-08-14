/*
window.onload = function () {
    var rewrite = document.getElementsByTagName('a');
    for (var i = 0; i < rewrite.length; i++) {
        rewrite[i].onmouseover = function () {
            var url = this.href.substring(this.href.indexOf('?'));
            if (/^\?a=list&navid=([0-9]+)$/i.test(url)) {
                var id = /^\?a=list&navid=([0-9]+)/i.exec(url)[1];
                this.href = 'list_' + id + '.html';
            }
            if (/^\?a=details&navid=([0-9]+)&goodsid=([0-9]+)$/i.test(url)) {
                var arr = /^\?a=details&navid=([0-9]+)&goodsid=([0-9]+)$/i.exec(url);
                var nav = arr[1];
                var id2 = arr[2];
                this.href = 'details_' + nav + '_' + id2 + '.html';
            }
        }
    }
};
*/