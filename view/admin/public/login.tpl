<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台登录</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/login.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/login.js"></script>
</head>
<body>

<div id="login">
    <form action="?a=admin&m=login" method="post" name="login">
        <input type="hidden" name="ajaxlogin" id="ajaxlogin"/>
        <input type="hidden" name="ajaxcode" id="ajaxcode"/>
        <dl>
            <dd>用户名: <input type="text" name="user" class="text" id="user" onblur="checkLogin();"/></dd>
            <dd>密&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password" name="pass" id="pass" class="text"
                                                   onblur="checkLogin()"/></dd>
            <dd>验证码: <input type="text" name="code" class="text" id="code" onblur="checkCode();"/></dd>
            <dd class="code"><img src="?a=call&m=validateCode" alt="" title="看不清?点击刷新"
                                  onclick="javascript:this.src='?a=call&m=validateCode&tm='+Math.random()"/></dd>
            <dd><input type="submit" name="send" class="submit" value="进入管理中心" onclick="return adminLogin();"/></dd>
        </dl>
    </form>
</div>

</body>
</html>