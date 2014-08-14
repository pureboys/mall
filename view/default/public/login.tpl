<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/reg.css"/>
    <script src="/view/default/js/ajax.js"></script>
    <script src="/view/default/js/login.js"></script>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a> &gt; 会员登陆
</div>

<div id="reg">
    <form action="" method="post" name="login">
        <input type="hidden" id="ajaxlogin" name="ajaxlogin"/>
        <dl>
            <dd>用&nbsp;&nbsp;户&nbsp;&nbsp;名: <input type="text" name="user" id="user" class="text" onblur="checkLogin();"/></dd>
            <dd>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password" name="pass" id="pass" class="text" onblur="checkLogin();"/></dd>
            <dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="keep" value="1"/>请保留这次登陆信息</dd>
            <dd><input type="submit" name="send" value="登陆" class="submit" onclick="return loginUser();"/></dd>
        </dl>
    </form>
</div>

{include file="default/public/footer.tpl"}

</body>
</html>