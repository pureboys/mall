<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/cart.css"/>
    <script src="/view/default/js/ajax.js"></script>
    <script src="/view/default/js/cart.js"></script>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a> &gt; 购物车
</div>

<table id="cart" cellspacing="1">
    <tr>
        <th>编号</th>
        <th>名称</th>
        <th>属性</th>
        <th>重量</th>
        <th class="th">售价</th>
        <th class="th">数量</th>
        <th class="th">小计</th>
        <th class="th">操作</th>
    </tr>
    {assign var=total value="0"}
    {foreach from=$FrontCart key="key" item="value"}
        <tr>
            <td>{$value.sn}</td>
            <td>{$value.name}</td>
            <td>
                {foreach from=$value.attr key="k1" item="v1"}
                    {$k1}:
                    {foreach from=$v1 item="v2"}
                        {$v2}
                    {/foreach}
                {/foreach}
            </td>
            <td>{$value.weight}/Kg</td>
            <td class="price">￥{$value.price_sale}</td>
            <td><input type="text" name="num" class="small" value="{$value.num}" onblur="changeNum({$value.id},this.value);"/></td>
            <td class="price">{$value.price_sale*$value.num}/元</td>
            <td><a href="?a=cart&m=delProduct&id={$value.id}">删除</a></td>
        </tr>
        {assign var="total" value=$total+$value.price_sale*$value.num}
    {/foreach}

</table>

<p><a href="./">继续购物</a> | <a href="?a=cart&m=clearProduct">清空购物车</a> | 共计: <strong class="price">{$total}</strong>元 </p>
<p><a href="?a=cart&m=flow"><img src="/view/default/images/checkout.gif" alt=""/></a></p>

{include file="default/public/footer.tpl"}
</body>
</html>