<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/delivery.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/delivery.js"></script>
</head>
<body>
<h2><a href="?a=delivery">返回快递列表</a>订单--添加快递</h2>

<form action="?a=delivery&m=add" method="post" name="add">
    <input type="hidden" name="flag" id="flag" value=""/>
    <dl class="form">
        <dd>快递名称: <input type="text" name="name" class="text" id="name" onblur="checkBrand();"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            2-20位之间) <span class="red">(必填)</span>
        </dd>
        <dd>官方网站: <input type="text" name="url" class="text"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            200位之内)
        </dd>
        <dd><span class="middle">快递描述:</span> <textarea name="info" id="" cols="" rows=""></textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 200位以内)</span></dd>
        <dd>省内运费: <input type="text" name="price_in" class="text"/>&nbsp;&nbsp;&nbsp;&nbsp;(* 单位是元 省内的起步运费)</dd>
        <dd>省外运费: <input type="text" name="price_out" class="text"/>&nbsp;&nbsp;&nbsp;&nbsp;(* 单位是元 省外的起步运费)</dd>
        <dd>额外运费: <input type="text" name="price_add" class="text"/>&nbsp;&nbsp;&nbsp;&nbsp;(* 单位是元 超重后(10公斤)每公斤增加的运费)</dd>
        <dd><input type="submit" name="send" value="新增快递" class="submit" onclick="return addDelivery();"/></dd>
    </dl>
</form>

</body>
</html>