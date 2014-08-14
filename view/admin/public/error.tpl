<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/error.css"/>
</head>
<body>
<h2>错误--提示页</h2>

<div id="list" class="error">
    {foreach from="$message" key="key" item="value"}
        <p>{$key+1}.{$value}</p>
    {/foreach}
    <p><a href="{$prev}">[返回]</a></p>
</div>


</body>
</html>