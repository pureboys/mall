<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/service.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/service.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>
</head>
<body>
<h2><a href="?a=service">返回售后列表</a>商品--添加售后</h2>

<form action="?a=service&m=add" method="post" name="add">
    <input type="hidden" name="flag" id="flag" value=""/>
    <dl class="form">
        <dd>售后服务名称: <input type="text" name="name" class="text" id="name" onblur="checkService();"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            2-20位之间) <span class="red">(必填)</span>
        </dd>
        <dd>售后服务首选: <input type="radio" name="first" value="0" checked/>否 <input type="radio" name="first" value="1"/>是</dd>
        <dd><textarea name="content" id="TextArea1" class="ckeditor" cols="" rows=""></textarea></dd>
        <dd><input type="submit" name="send" value="新增售后" class="submit" onclick="return addService();"/></dd>
    </dl>
</form>

</body>
</html>