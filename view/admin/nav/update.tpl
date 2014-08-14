<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/nav.css"/>
    <script src="/view/admin/js/nav.js"></script>
</head>
<body>
<h2><a href="?a=nav&sid={$OneNav[0]->sid}">返回导航列表</a>商品--修改导航</h2>

<form action="?a=nav&m=update&id={$OneNav[0]->id}" method="post" name="update">
    <dl class="form">
        <dd>名&nbsp;&nbsp;称: {$OneNav[0]->name}</dd>
        <dd><span class="middle">简&nbsp;&nbsp;介:</span> <textarea name="info" id="" cols=""
                                                                  rows="">{$OneNav[0]->info}</textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 200位以内)</span></dd>
        {if $OneNav[0]->sid != 0}
            <dd>关联品牌:{html_checkboxes options="$AllBrand" name="brand" selected="$selectedBrand"}</dd>{/if}
        {if $AllPrice}
            <dd>价格区间:{html_checkboxes options="$AllPrice" name="price" selected="$selectedPrice"}</dd>
        {/if}
        <dd><input type="submit" name="send" value="修改导航" class="submit" onclick="return updateNav();"/></dd>
    </dl>
</form>

</body>
</html>