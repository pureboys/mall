<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/attr.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/attr.js"></script>
</head>
<body>
<h2><a href="?a=attr">返回自定义属性列表</a>商品--添加自定义属性</h2>

<form action="?a=attr&m=add" method="post" name="add">
    <input type="hidden" id="flag" name="flag"/>
    <dl class="form">
        <dd>属性名称: <input type="text" name="name" class="text" id="name" onblur="checkName();" />&nbsp;&nbsp;&nbsp;&nbsp;(*
            2-6位之间) <span class="red">(必填)</span>
        </dd>
        <dd>选择方式: <input type="radio" name="way" value="0" checked/>单选 <input type="radio" name="way" value="1"/>多选
        </dd>
        <dd><span class="middle">属性项目:</span> <textarea name="item" id="" cols="" rows=""></textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 项目之间用 | 隔开，例如：白色|红色|黑色)</span></dd>
        <dd>请选择以下关联的类别:</dd>
        {foreach from=$addNav key="key" item="value"}
            {if $value->child}
                <dd>{$value->name}</dd>
                <dd>{html_checkboxes name="nav" options=$value->child}</dd>
            {/if}
            {foreachelse}
            <dd>没有任何类别，请先<a href="?a=nav&m=add">添加类别</a></dd>
        {/foreach}
        <dd><input type="submit" name="send" value="新增自定义属性" class="submit" onclick="return addAttr();"/></dd>
    </dl>
</form>

</body>
</html>