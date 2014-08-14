<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/alipay.css"/>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a> &gt; 在线支付
</div>

{include file="default/public/member_sidebar.tpl"}

<div id="main">
    <h2>在线支付</h2>

    <div class="alipay">
        {if $OneOrder[0]->order_state == '已取消' || $OneOrder[0]->order_pay == '已支付' || $OneOrder[0]->order_delivery == '已发货' || $OneOrder[0]->order_delivery == '已配货'}
            <dl>
                <dd>此订单已被锁定！ <input type="button" value="返回" onclick="javascript:history.go(-1);"/></dd>
            </dl>
        {else}

                <input type="hidden" name="WIDout_trade_no" value="{$OneOrder[0]->ordernum}"/>
                <input type="hidden" name="WIDsubject" value="Pony商城"/>
                <input type="hidden" name="WIDprice" value="{$OneOrder[0]->price}"/>
                <input type="hidden" name="WIDbody" value="{$OneOrder[0]->text}"/>
                <dl>
                    <dd>订单号：{$OneOrder[0]->ordernum}</dd>
                    <dd>总金额：￥{$OneOrder[0]->price}</dd>
                    <dd>订单详情：{$OneOrder[0]->text}</dd>
                    <dd>您选择的支付方式为：货到付款，请收到货物之后直接将款交与邮递员，我们收到货款后及时与您确认</dd>
                </dl>

        {/if}
    </div>
</div>
{include file="default/public/footer.tpl"}
</body>
</html>