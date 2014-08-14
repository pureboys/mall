<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/order.css"/>
    <script src="/view/admin/js/order.js"></script>
</head>
<body>
<h2><a href="?a=order">返回订单列表</a>系统--修改订单</h2>

<div id="list">

    <table class="cart" cellspacing="1">
        <caption>订单信息</caption>
        <tr>
            <th>订单编号</th>
            <th>下单时间</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->ordernum}</td>
            <td>{$OneOrder[0]->date}</td>
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
        </tr>
        {assign var=total value="0"}
        {foreach from=$OneOrder[0]->goods key="key" item="value"}
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
                <td class="price">￥{$value.price_sale}</td>
                <td>{$value.num}</td>
                <td class="price">{$value.price_sale*$value.num}/元</td>
            </tr>
            {assign var="total" value=$total+$value.price_sale*$value.num}
        {/foreach}
    </table>


    <table class="cart" cellspacing="1">
        <caption>用户信息</caption>
        <tr>
            <th>用户名</th>
            <th>收获人</th>
            <th>电子邮件</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->user}</td>
            <td>{$OneOrder[0]->name}</td>
            <td>{$OneOrder[0]->email}</td>
        </tr>
    </table>


    <table class="cart" cellspacing="1">
        <caption>送货信息</caption>
        <tr>
            <th>邮政编码</th>
            <th>手机号码</th>
            <th>标志建筑</th>
            <th>收货地址</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->code}</td>
            <td>{$OneOrder[0]->tel}</td>
            <td>{$OneOrder[0]->buildings}</td>
            <td>{$OneOrder[0]->address}</td>
        </tr>
    </table>


    <table class="cart" cellspacing="1">
        <caption>支付信息</caption>
        <tr>
            <th>物流方式</th>
            <th>支付方式</th>
            <th>总费用</th>
        </tr>
        <tr>
            <td>{$OneOrder[0]->delivery}</td>
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

</div>


<form action="?a=order&m=update&id={$OneOrder[0]->id}" method="post" name="update">
    <input type="hidden" name="user" value="{$OneOrder[0]->user}"/>
    <dl class="form">
        {if $OneOrder[0]->order_state == '已取消'}
            <dd>订单状态：<span class="red">已取消 此订单已失效 可以删除</span></dd>
        {else}
            <dd>
                订单状态: <input type="radio" name="order_state" value="未确认"
                             {if $OneOrder[0]->order_state == '未确认'}checked{/if}/>未确认
                <input type="radio" name="order_state" value="已确认" {if $OneOrder[0]->order_state == '已确认'}checked{/if}/>已确认
                <input type="radio" name="order_state" value="已取消" {if $OneOrder[0]->order_state == '已取消'}checked{/if}/>已取消
            </dd>
            <dd>
                支付状态:
                <input type="radio" name="order_pay" value="未支付" {if $OneOrder[0]->order_pay == '未支付'}checked{/if}/>未支付
                <input type="radio" name="order_pay" value="已支付" {if $OneOrder[0]->order_pay == '已支付'}checked{/if}/>已支付
            </dd>
            <dd>
                配送状态:
                <input type="radio" name="order_delivery" value="未发货"
                       {if $OneOrder[0]->order_delivery == '未发货'}checked{/if}/>未发货
                <input type="radio" name="order_delivery" value="已配货"
                       {if $OneOrder[0]->order_delivery == '已配货'}checked{/if}/>已配货
                <input type="radio" name="order_delivery" value="已发货"
                       {if $OneOrder[0]->order_delivery == '已发货'}checked{/if}/>已发货
            </dd>
            <dd class="delivery">
                物流配送：
                <select name="delivery_name" id="" onchange="changeDelivery();">
                    <option value="0">-- 请选择物流 --</option>
                    {foreach from=$AllDelivery key="key" item="value"}
                        <option value="{$value->name}"
                                url="{$value->url}" {if $OneOrder[0]->delivery_name == $value->name} selected {/if}>
                            {$value->name}
                        </option>
                    {/foreach}
                </select>
                <input type="hidden" value="{$OneOrder[0]->delivery_url}" name="delivery_url"/>
            </dd>
            <dd class="delivery">
                订&nbsp;&nbsp;单&nbsp;&nbsp;号：<input type="text" name="delivery_number"
                                                   value="{$OneOrder[0]->delivery_number}" class="text"/>
            </dd>
        {/if}
        {if $OneOrder[0]->refund == 1}
            <dd>
                <span class="red">此订单正在申请退款，如果无误，请勾上
                    <label for="refund"><input type="checkbox" name="refund" value="2" id="refund"/>
                        确认退款</label>
                </span>
            </dd>
        {/if}
        {if $OneOrder[0]->refund == 2}
            <dd><span class="green">此订单退款成功！</span></dd>
        {/if}
        <dd><input type="submit" name="send" value="修改订单" class="submit"/></dd>
    </dl>
</form>

</body>
</html>