<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/edit.css"/>
</head>
<body>
<h2><a href="?a=edit&m=file&dir={$smarty.get.dir}&file={$smarty.get.file}">返回文件列表</a>系统--修改文件</h2>

<form action="?a=edit&m=update&dir={$smarty.get.dir}&file={$smarty.get.file}" method="post" name="update">
    <dl class="form">
        <dd>文件名称: <input type="text" name="name" class="text" id="name" value="{$smarty.get.name}" />
        </dd>
        <dd><span class="middle">代码编辑:</span> <textarea name="info" id="" cols="" rows="">{$content}</textarea></dd>
        <dd><input type="submit" name="send" value="修改文件" class="submit"/></dd>
    </dl>
</form>


</body>
</html>