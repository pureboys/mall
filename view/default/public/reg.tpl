<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/reg.css"/>
    <script src="/view/default/js/ajax.js"></script>
    <script src="/view/default/js/reg.js"></script>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a> &gt; 注册会员
</div>

<div id="reg">
    <form action="" method="post" name="reg">
        <input type="hidden" name="flag" id="flag" value=""/>
        <dl>
            <dd>用&nbsp;&nbsp;户&nbsp;&nbsp;名: <input type="text" name="user" class="text" id="user" onblur="checkUser();"/></dd>
            <dd>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password" name="pass" class="text"/></dd>
            <dd>确认密码: <input type="password" name="notpass" class="text"/></dd>
            <dd><input type="submit" name="send" value="注册" class="submit" onclick="return regUser();"/></dd>
        </dl>
    </form>
</div>

{include file="default/public/footer.tpl"}

</body>
</html>