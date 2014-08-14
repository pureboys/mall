<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/brand.css"/>
    <script src="/view/admin/js/brand.js"></script>
</head>
<body>
<h2><a href="?a=brand">返回品牌列表</a>商品--修改品牌</h2>

<form action="?a=brand&m=update&id={$OneBrand[0]->id}" method="post" name="update">
    <dl class="form">
        <dd>品牌名称: {$OneBrand[0]->name}
        </dd>
        <dd>官方网站: <input type="text" name="url" class="text" value="{$OneBrand[0]->url}"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            200位之内)
        </dd>
        <dd><span class="middle">品牌简介:</span> <textarea name="info" id="" cols=""
                                                        rows="">{$OneBrand[0]->info}</textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 200位以内)</span></dd>
        <dd><input type="submit" name="send" value="修改品牌" class="submit" onclick="return updateBrand();"/></dd>
    </dl>
</form>

</body>
</html>