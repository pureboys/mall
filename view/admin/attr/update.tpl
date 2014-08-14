<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/attr.css"/>
    <script src="/view/admin/js/attr.js"></script>
</head>
<body>
<h2><a href="?a=attr">返回自定义属性列表</a>商品--修改自定义属性</h2>

<form action="?a=attr&m=update&id={$OneAttr[0]->id}" method="post" name="update">
    <input type="hidden" id="flag" name="flag"/>
    <dl class="form">
        <dd>属性名称: {$OneAttr[0]->name}
        </dd>
        <dd>选择方式: {html_radios options=$way name="way" selected=$OneAttr[0]->way}
        </dd>
        <dd><span class="middle">属性项目:</span> <textarea name="item" id="" cols="" rows="">{$OneAttr[0]->item}</textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 项目之间用 | 隔开，例如：白色|红色|黑色)</span></dd>
        <dd>请选择以下关联的类别:</dd>
        {foreach from=$addNav key="key" item="value"}
            {if $value->child}
                <dd>{$value->name}</dd>
                <dd>{html_checkboxes name="nav" options=$value->child selected=$OneAttr[0]->nav}</dd>
            {/if}
            {foreachelse}
            <dd>没有任何类别，请先<a href="?a=nav&m=add">添加类别</a></dd>
        {/foreach}
        <dd><input type="submit" name="send" value="修改自定义属性" class="submit" onclick="return updateAttr();"/></dd>
    </dl>
</form>

</body>
</html>