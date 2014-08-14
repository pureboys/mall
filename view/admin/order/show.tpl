<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/order.css"/>
</head>
<body>
<h2>订单 -- 订单列表</h2>

<div id="list">
    <table>
        <tr>
            <th>订单号</th>
            <th>下单时间</th>
            <th>总金额</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>
        {foreach from="$AllOrder" key="key" item="value"}
            <tr>
                <td><a href="?a=order&m=update&id={$value->id}">{$value->ordernum}</a></td>
                <td>{$value->date}</td>
                <td>{$value->price}</td>
                <td>
                    {if $value->order_state == '已取消'}
                        <span class="red">已取消</span>
                    {else}
                        {if $value->refund == 1}
                            <span style="color: #666;">申请退款中</span>
                        {else}
                            {if $value->refund == 2}
                                <span class="green">退款申请成功！</span>
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
                    <a href="?a=order&m=update&id={$value->id}"><img src="/view/admin/images/edit.gif" alt="编辑"
                                                                     title="编辑"/></a><a
                            href="?a=order&m=delete&id={$value->id}"
                            onclick="return confirm('你真的要删除这个订单么?') ? true : false"><img
                                src="/view/admin/images/drop.gif" alt="删除" title="删除"/></a>
                </td>
            </tr>
            {foreachelse}
            <tr>
                <td colspan="5">没有任何订单！</td>
            </tr>
        {/foreach}
    </table>
</div>

<div id="page">{$page} <input type="button" value="清理24小时未确认的订单"
                              onclick="javascript:location.href='?a=order&m=clear';"/></div>


</body>
</html>