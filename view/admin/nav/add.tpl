<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/nav.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/nav.js"></script>
</head>
<body>
<h2><a href="?a=nav{if $OneNav}&sid={$OneNav[0]->id}{/if}">返回导航列表</a>商品--添加导航</h2>

<form action="?a=nav&m=add" method="post" name="add">
    <input type="hidden" name="flag" id="flag" value=""/>
    <dl class="form">
        {if $OneNav}
            <dd>主类名称: {$OneNav[0]->name}</dd>
            <input type="hidden" name="sid" value="{$OneNav[0]->id}"/>
        {/if}
        <dd>名&nbsp;&nbsp;称: <input type="text" name="name" id="name" class="text" onblur="checkName();"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            2-6位之间)
        </dd>
        <dd><span class="middle">简&nbsp;&nbsp;介:</span> <textarea name="info" id="" cols="" rows=""></textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 200位以内)</span></dd>
        {if $OneNav}
            <dd>关联品牌:{html_checkboxes options="$AllBrand" name="brand"}</dd>{/if}
        {if $AllPrice}
            <dd>价格区间:{html_checkboxes options="$AllPrice" name="price"}</dd>
        {/if}
        <dd><input type="submit" name="send" value="新增导航条" class="submit" onclick="return addNav();"/></dd>
    </dl>
</form>

</body>
</html>