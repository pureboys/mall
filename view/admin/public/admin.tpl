<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/admin.css"/>
    <script src="/view/admin/js/iframe.js"></script>
    <script src="/view/admin/js/channel.js"></script>
</head>
<body>
<div id="header">
    <p>你好,{$admin.user} [{$admin.level}] <a href="?a=index">首页</a> <a href="?a=admin&m=logout">退出</a></p>
    <ul>
        <li class="first"><a href="?a=admin&m=main" target="in">起始页</a></li>
        <li><a href="javascript:channel(0)">商品</a></li>
        <li><a href="javascript:channel(1)">订单</a></li>
        <li><a href="javascript:channel(2)">会员</a></li>
        <li><a href="javascript:channel(3)">系统</a></li>
    </ul>
</div>
<div id="sidebar">
    <dl style="display: block">
        <dt>商品</dt>
        <dd><a href="?a=nav" target="in">导航条列表</a></dd>
        <dd><a href="?a=goods" target="in">商品列表</a></dd>
        <dd><a href="?a=brand" target="in">品牌列表</a></dd>
        <dd><a href="?a=attr" target="in">自定义属性</a></dd>
        <dd><a href="?a=price" target="in">价格区间</a></dd>
        <dd><a href="?a=service" target="in">售后服务</a></dd>
        <dd><a href="?a=commend" target="in">评价管理</a></dd>
    </dl>
    <dl style="display: none">
        <dt>订单</dt>
        <dd><a href="?a=order" target="in">订单列表</a></dd>
        <dd><a href="?a=delivery" target="in">物流配送</a></dd>
    </dl>
    <dl style="display: none">
        <dt>会员</dt>
        <dd><a href="###">会员</a></dd>
    </dl>
    <dl style="display: none">
        <dd><a href="?a=manage" target="in">管理员列表</a></dd>
        <dd><a href="###">等级列表</a></dd>
        <dd><a href="###">权限管理</a></dd>
        <dd><a href="?a=edit" target="in">模版编辑器</a></dd>
        <dd><a href="?a=pic" target="in">图片编辑器</a></dd>
    </dl>
</div>
<div id="main">
    <iframe src="?a=admin&m=main" frameborder="0" name="in"></iframe>
</div>
</body>
</html>