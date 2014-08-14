<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/brand.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/brand.js"></script>
</head>
<body>
<h2><a href="?a=brand">返回品牌列表</a>商品--添加品牌</h2>

<form action="?a=brand&m=add" method="post" name="add">
    <input type="hidden" name="flag" id="flag" value=""/>
    <dl class="form">
        <dd>品牌名称: <input type="text" name="name" class="text" id="name" onblur="checkBrand();"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            2-20位之间) <span class="red">(必填)</span>
        </dd>
        <dd>官方网站: <input type="text" name="url" class="text"/>&nbsp;&nbsp;&nbsp;&nbsp;(*
            200位之内)
        </dd>
        <dd><span class="middle">品牌简介:</span> <textarea name="info" id="" cols="" rows=""></textarea>&nbsp;&nbsp;&nbsp;&nbsp;<span
                    class="middle">(* 200位以内)</span></dd>
        <dd><input type="submit" name="send" value="新增品牌" class="submit" onclick="return addBrand();"/></dd>
    </dl>
</form>

</body>
</html>