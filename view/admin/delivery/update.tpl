<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/delivery.css"/>
    <script src="/view/admin/js/delivery.js"></script>
</head>
<body>
<h2><a href="?a=delivery">返回快递列表</a>商品--修改快递</h2>

<form action="?a=delivery&m=update&id={$OneDelivery[0]->id}" method="post" name="update">
    <dl class="form">
        <dd>快递名称: {$OneDelivery[0]->name}
        </dd>
        <dd>官方网站: <input type="text" name="url" class="text" value="{$OneDelivery[0]->url}"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            200位之内)
        </dd>
        <dd><span class="middle">快递描述:</span> <textarea name="info" id="" cols=""
                                                        rows="">{$OneDelivery[0]->info}</textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 200位以内)</span></dd>
        <dd>省内运费: <input type="text" name="price_in" class="text" value="{$OneDelivery[0]->price_in}"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            单位是元 省内的起步运费)
        </dd>
        <dd>省外运费: <input type="text" name="price_out" class="text" value="{$OneDelivery[0]->price_out}"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            单位是元 省外的起步运费)
        </dd>
        <dd>额外运费: <input type="text" name="price_add" class="text" value="{$OneDelivery[0]->price_add}"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            单位是元 超重后(10公斤)每公斤增加的运费)
        </dd>
        <dd><input type="submit" name="send" value="修改快递" class="submit" onclick="return updateDelivery();"/></dd>
    </dl>
</form>

</body>
</html>