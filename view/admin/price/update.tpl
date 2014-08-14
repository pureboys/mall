<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/price.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/price.js"></script>
</head>
<body>
<h2><a href="?a=price">返回价格区间列表</a>商品--修改价格区间</h2>

<form action="?a=price&m=update&id={$OnePrice[0]->id}" method="post" name="update">
    <input type="hidden" name="flag" id="flag" value=""/>
    <dl class="form">
        <dd>价格区间: <input type="text" name="price_left" id="price_left" class="text small" value="{$OnePrice[0]->price_left}" onblur="checkPrice();"/> - <input type="text" name="price_right" id="price_right" class="text small" value="{$OnePrice[0]->price_right}" onblur="checkPrice();"/>
            <span class="red">(必填)</span> (*必须是数字，且不得为0，右区间要大于左区间)
        </dd>

        <dd>
            <input type="submit" name="send" value="修改价格区间" class="submit" onclick="return updatePrice();"/>
            <input type="reset" value="重置" class="submit"/>
        </dd>
    </dl>
</form>

</body>
</html>