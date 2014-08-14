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
    <h2>订单列表</h2>
    <table class="cart" cellspacing="1">
        <tr>
            <th>订单号</th>
            <th>下单时间</th>
            <th>总金额</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>
        {foreach from=$AllOrder key="key" item="value"}
            <tr>
                <td><a href="?a=member&m=order_details&id={$value->id}">{$value->ordernum}</a></td>
                <td>{$value->date}</td>
                <td>￥{$value->price}</td>
                <td>
                    {if $value->order_state == '已取消'}
                        <span class="red">已取消</span>
                    {else}
                        {if $value->refund == 1}
                            <span style="color: #666;">申请退款中</span>
                        {else}
                            {if $value->refund == 2}
                                <span class="green">申请退款成功</span>
                            {else}
                                {if $value->order_delivery == '已发货'}
                                    <span class="green">已发货,等待收货</span>
                                {else}
                                    {if $value->order_delivery == '已配货'}
                                        <span class="green">已配货,等待发货</span>
                                    {else}
                                        {if $value->order_pay == '已支付'}
                                            <span class="green">已支付,等待配货</span>
                                        {else}
                                            {if $value->order_state == '已确认'}
                                                <span class="green">已确认,等待支付</span>
                                            {else}
                                                <span style="color: #666;">未确认，等待确认</span>
                                            {/if}
                                        {/if}
                                    {/if}
                                {/if}
                            {/if}
                        {/if}
                    {/if}
                </td>
                <td>
                    {if $value->order_state == '已取消'}
                        -----
                    {else}
                        {if $value->order_pay == '已支付' || $value->order_delivery == '已发货' || $value->order_delivery == '已配货'}
                            {if $value->refund == 0}
                                <a href="?a=member&m=refund&id={$value->id}"
                                   onclick="return confirm('申请退款须知:\n\n1.已支付、已配货或者已发货可直接申请退款；\n2.已支付或者已配货的72小时确认退款; \n3.已发货的请寄回物品后72小时确认退款;\n\n 您真的要退款么？')">申请退款</a>
                            {else}
                                -----
                            {/if}
                        {else}
                            {if $value->pay == '支付宝'}
                                <a href="?a=member&m=alipay&id={$value->id}">在线支付</a>
                                |
                            {/if}
                            <a href="?a=member&m=cancel&id={$value->id}">取消</a>
                        {/if}
                    {/if}
                </td>
            </tr>
        {/foreach}
    </table>
    <div id="page">{$page}</div>
</div>

{include file="default/public/footer.tpl"}
</body>
</html>