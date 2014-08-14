<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/goods.css"/>
    <script src="/view/admin/js/ajax.js"></script>
    <script src="/view/admin/js/goods.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>
</head>
<body>
<h2><a href="?a=goods">返回商品列表</a>商品--添加商品</h2>

<form action="?a=goods&m=add" method="post" name="add">
    <input type="hidden" name="flag" id="flag" value=""/>
    <dl class="form">
        <dd>
            商品类型: <select name="nav" id="nav">
                <option value="-1" selected>--请选择一个商品类型--</option>
                {foreach from=$addNav key="key" item="value"}
                    <optgroup label="{$value->name}">
                        {html_options options=$value->child}
                    </optgroup>
                {/foreach}
            </select> <span class="red">(必选)</span>
        </dd>
        <dd>商品品牌: <select name="brand" id="brand">
                <option value="-1" selected>--请选择一个商品品牌--</option>
            </select> <span class="red">(必选)</span>
        </dd>
        <dd>商品名称: <input type="text" name="name" class="text"/> <span class="red">(必填)</span> (2-100字符之间)</dd>
        <dd>商品编号: <input type="text" name="sn" id="sn" class="text" onblur="checkSn();"/> <span class="red">(必填)</span>
            (2-50字符之间,唯一)
        </dd>
        <dd>
            销&nbsp;&nbsp;售&nbsp;&nbsp;价: <input type="text" name="price_sale" class="small" value="0"/>
            市&nbsp;&nbsp;场&nbsp;&nbsp;价: <input type="text" name="price_market" class="small" value="0"/>
            成&nbsp;&nbsp;本&nbsp;&nbsp;价: <input type="text" name="price_cost" class="small" value="0"/> (不在前台显示)
        </dd>
        <dd>
            关&nbsp;&nbsp;键&nbsp;&nbsp;字:<input type="text" name="keyword" class="text"/> (每个关键字用 | 隔开)
        </dd>
        <dd>
            计量单位: <input type="text" name="unit" class="small"/>
            重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量: <input type="text" name="weight" class="small"
                                                                       value="0"/> (计量单位:个,kg,件 重量:kg)
        </dd>
        <dd>
            缩&nbsp;&nbsp;略&nbsp;&nbsp;图: <input type="text" name="thumbnail" class="text" readonly/>
            <input type="button" value="上传缩略图"
                   onclick="centerWindow('?a=call&m=upFile&type=content','upfile','400','150')"/>
            <img name="pic" style="display: none"/>(*jpg,gif,png,且在200k内,最佳上传为300*300)
        </dd>
        <dd><textarea name="content" id="TextArea1" class="ckeditor" cols="" rows=""></textarea></dd>
        <dd>
            是否上架: <input type="radio" name="is_up" value="1" checked/>是 <input type="radio" name="is_up" value="0"/>否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            是否免运费: <input type="radio" name="is_freight" value="1" checked/>是 <input type="radio" name="is_freight"
                                                                                     value="0"/>否
        </dd>
        <dd>售后服务: {html_radios name="service" options=$addService checked=$addServiceSelected[0]->id}</dd>
        <dd>
            库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存: <input type="text" name="inventory" class="small"
                                                                       value="100"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            库存告急: <input type="text" name="warn_inventory" class="small" value="1"/> (库存在达到指定数量就会在后台提醒)
        </dd>
        <dd>
            <input type="submit" name="send" value="新增商品" class="submit" onclick="return addGoods();"/>
            <input type="reset" value="重置" class="submit"/>
        </dd>
    </dl>
</form>

</body>
</html>