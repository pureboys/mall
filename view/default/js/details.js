window.onload = function () {
    var attrArr = $('attrid').value.split(';');
    var attrType = $('attrtype').value.split('|');
    if (attrArr != '' && attrType != '') {
        var ddLocation = $('text').getElementsByTagName('dd')[5];  //编号
        for (var i = 0; i < attrArr.length; i++) {
            var attrName = attrArr[i].substr(0, attrArr[i].indexOf(':')); //属性名称
//                if (attrName.length == 2) {
//                    attrName = attrName.charAt(0) + '  ' + attrName.charAt(1);
//                } else if (attrName.length == 3) {
//                    attrName = attrName.charAt(0) + ' ' + attrName.charAt(1) + ' ' + attrName.charAt(2);
//                }
            var attrValueArr = attrArr[i].substr(attrArr[i].indexOf(':') + 1).split('|');

            var dd = document.createElement('dd');
            var addAttrName = document.createTextNode(attrName + ':');
            dd.appendChild(addAttrName); //在dd里添加文本
            for (var j = 0; j < attrValueArr.length; j++) {
                if (BrowserDetect.browser == 'Internet Explorer' && BrowserDetect.version <= 7) {
                    var input = document.createElement('<input name="attr[' + attrName + '][]">');
                } else {
                    var input = document.createElement('input');
                    input.name = 'attr[' + attrName + '][]';
                }

                var inputText = document.createTextNode(attrValueArr[j]); //每个属性项目
                if (attrType[i] == 1) {
                    input.type = 'checkbox';
                } else {
                    input.type = 'radio';
                }
                dd.appendChild(input);
                dd.appendChild(inputText);
                input.value = attrValueArr[j];
            }
            ddLocation.parentNode.insertBefore(dd, ddLocation);
            if (dd.children[0].type != 'checkbox') dd.children[0].checked = true;
        }
    }

    //评论优先
    if(location.href.indexOf('#commend') > 0){
        for (var i = 1; i <= 4; i++) {
            var style = document.getElementById('button' + i).style;
            style.backgroundPosition = 'right';
            style.color = '#333333';
            var content = document.getElementById('c' + i).style;
            content.display = 'none';
        }
        var style2 = document.getElementById('button' + 2).style;
        style2.backgroundPosition = 'left';
        style2.color = '#ffffff';
        var content2 = document.getElementById('c' + 2).style;
        content2.display = 'block';
    }


};


function $(id) {
    return document.getElementById(id);
}


//按钮
function channel(j) {
    for (var i = 1; i <= 4; i++) {
        var style = document.getElementById('button' + i).style;
        style.backgroundPosition = 'right';
        style.color = '#333333';
        var content = document.getElementById('c' + i).style;
        content.display = 'none';
    }
    var style2 = document.getElementById('button' + j).style;
    style2.backgroundPosition = 'left';
    style2.color = '#ffffff';
    var content2 = document.getElementById('c' + j).style;
    content2.display = 'block';
}