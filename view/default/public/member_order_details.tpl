<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/member.css"/>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a> &gt; 个人中心
</div>

{include file="default/public/member_sidebar.tpl"}

<div id="main">
    <h2>订单详情</h2>
    <table class="cart" cellspacing="1">
        <caption>订单状态</caption>
        <tr>
            <th>订单号</th>
            <th>订单状态</th>
            <th>支付状态</th>
            <th>配送状态</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->ordernum}</td>
            <td>{$OneOrder[0]->order_state}</td>
            <td>{$OneOrder[0]->order_pay}</td>
            <td>{$OneOrder[0]->order_delivery}</td>
        </tr>
    </table>


    <table class="cart" cellspacing="1">
        <caption>商品列表</caption>
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>属性</th>
            <th class="th">售价</th>
            <th class="th">数量</th>
            <th class="th">小计</th>
            <th>评价</th>
        </tr>
        {assign var=total value="0"}
        {foreach from=$OneOrder[0]->goods key="key" item="value"}
            <tr>
                <td>{$value.sn}</td>
                <td><a href="?a=details&navid={$value.nav}&goodsid={$value.id}" target="_blank">{$value.name}</a></td>
                <td>
                    {foreach from=$value.attr key="k1" item="v1"}
                        {$k1}:
                        {foreach from=$v1 item="v2"}
                            {$v2}
                        {/foreach}
                    {/foreach}
                </td>
                <td class="price">￥{$value.price_sale}</td>
                <td>{$value.num}</td>
                <td class="price">{$value.price_sale*$value.num}/元</td>
                {if $OneOrder[0]->order_delivery == '已发货'}
                    <td><a href="?a=member&m=commend&goods_id={$value.id}&order_id={$OneOrder[0]->id}">评价</a></td>
                {else}
                    <td>-----</td>
                {/if}
            </tr>
            {assign var="total" value=$total+$value.price_sale*$value.num}
        {/foreach}
    </table>


    <table class="cart" cellspacing="1">
        <caption>配送信息</caption>
        <tr>
            <th>配送状态</th>
            <th>物流方式</th>
            <th>物流单号</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->order_delivery}</td>
            <td>
                {if $OneOrder[0]->order_delivery == '已发货'}
                    <a href="{$OneOrder[0]->delivery_url}" target="_blank">{$OneOrder[0]->delivery_name}</a>
                {/if}
            </td>
            <td>{$OneOrder[0]->delivery_number}</td>
        </tr>
    </table>


    <table class="cart" cellspacing="1">
        <caption>支付信息</caption>
        <tr>
            <th>支付状态</th>
            <th>支付方式</th>
            <th>总金额</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->order_pay}</td>
            <td>{$OneOrder[0]->pay}</td>
            <td><span class="red">￥{$OneOrder[0]->price}</span></td>
        </tr>
    </table>


    <table class="cart" cellspacing="1">
        <caption>备注信息</caption>
        <tr>
            <th>备注信息</th>
            <th>缺货方式</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->text}</td>
            <td>{$OneOrder[0]->ps}</td>
        </tr>
    </table>
    {if $OneOrder[0]->order_state == '已取消' || $OneOrder[0]->order_pay == '已支付' || $OneOrder[0]->order_delivery == '已发货' || $OneOrder[0]->order_delivery == '已配货'}
        {if $OneOrder[0]->refund == 1}
            <p class="right"><span class="red">此订单正在申请退款中……</span></p>
        {else}
            {if $OneOrder[0]->refund == 2}
                <p class="right"><span class="green">退款成功</span></p>
            {else}
                <p class="right"><span class="red">此订单已被锁定</span></p>
            {/if}
        {/if}
    {else}
        <p class="right">
            <a href="?a=member&m=alipay&id={$OneOrder[0]->id}">
                <img src="/view/default/images/fu.gif" alt="付款" style="border: none"/>
            </a>
        </p>
    {/if}
    <p class="right"><a href="{$Prev}">[返回]</a></p>

</div>
{include file="default/public/footer.tpl"}

</body>
</html>