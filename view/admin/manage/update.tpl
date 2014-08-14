<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/manage.css"/>
    <script src="/view/admin/js/manage.js"></script>
</head>
<body>
<h2><a href="?a=manage">返回管理员列表</a>系统--修改管理员</h2>

<form action="?a=manage&m=update&id={$OneManage[0]->id}" method="post" name="update">
    <dl class="form">
        <dd>用&nbsp;&nbsp;户&nbsp;&nbsp;名: {$OneManage[0]->user}</dd>
        <dd>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password" name="pass" class="text"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            大于6位)
        </dd>
        <dd>密码确认: <input type="password" name="notpass" class="text"/></dd>
        <dd>等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级: <select name="level" id="">
                <option value="0">--请选择等级权限--</option>
                {html_options options="$AllLevel" selected=$OneManage[0]->level }
            </select>&nbsp;&nbsp;&nbsp;&nbsp;(* 必须选定一个权限)
        </dd>
        <dd><input type="submit" name="send" value="修改管理员" class="submit" onclick="return updateManage();"/></dd>
    </dl>
</form>

</body>
</html>