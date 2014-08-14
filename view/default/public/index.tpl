<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/index.css"/>
    <script src="/view/default/js/rewrite.js"></script>
</head>
<body>

{include file="default/public/header.tpl"}

<div id="main">
    <div class="adver">
        <img src="/view/default/images/adver.jpg" alt=""/>
    </div>

    <h2>推荐商品</h2>

    <div class="pro">
        {foreach from=$SalesSort key="key" item="value"}
            {if $key<3}
                <dl>
                    <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img
                                    src="{$value->thumbnail2}" alt="{$value->name}" title="{$value->name}"/></a></dt>
                    <dd class="price"><strong>￥{$value->price_sale}</strong>
                        <del>￥{$value->price_market}</del>
                    </dd>
                    <dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}">{$value->name}</a></dd>
                    <dd class="commend"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}#commend" target="_blank">已经有{$value->count}人评价</a> <span>(销售<strong>{$value->sales}</strong>{$value->unit})</span></dd>
                    <dd class="buy"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">购买</a> |
                        <a href="?a=member&m=addCollect&id={$value->id}" target="_blank">收藏</a> | <a href="?a=compare&m=setCompare&navid={$value->nav}&goodsid={$value->id}" target="_blank">比较</a></dd>
                </dl>
            {/if}
        {/foreach}
    </div>

    <h2>精品商品</h2>

    <div class="pro">
        {foreach from=$SalesSort key="key" item="value"}
            {if $key<3}
                <dl>
                    <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img
                                    src="{$value->thumbnail2}" alt="{$value->name}" title="{$value->name}"/></a></dt>
                    <dd class="price"><strong>￥{$value->price_sale}</strong>
                        <del>￥{$value->price_market}</del>
                    </dd>
                    <dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}">{$value->name}</a></dd>
                    <dd class="commend"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}#commend" target="_blank">已经有{$value->count}人评价</a> <span>(销售<strong>{$value->sales}</strong>{$value->unit})</span></dd>
                    <dd class="buy"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">购买</a> |
                        <a href="?a=member&m=addCollect&id={$value->id}" target="_blank">收藏</a> | <a href="?a=compare&m=setCompare&navid={$value->nav}&goodsid={$value->id}" target="_blank">比较</a></dd>
                </dl>
            {/if}
        {/foreach}
    </div>

    <h2>商家品牌</h2>
    <div class="brands">
        寿屋&nbsp;&nbsp;海洋堂&nbsp;&nbsp; BANDAI&nbsp;&nbsp; GSC&nbsp;&nbsp; MaxFactory&nbsp;&nbsp; ALTER
    </div>
</div>
<div id="sidebar">
    <h2>商城公告</h2>
    <ul>
        <li><a href="###">本站可以使用支付宝支付...</a></li>
        <li><a href="###">服饰供货商正在招商中...</a></li>
        <li><a href="###">本商城正在测试中...</a></li>
        <li><a href="###">商城可以使用货到付款...</a></li>
        <li><a href="###">网上商城已开始启用...</a></li>
    </ul>

    <h2>当月热销</h2>

    <div>
        {foreach from=$SalesSort key="key" item="value"}
            <dl style="border: none">
                <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}">
                        <img src="{$value->thumbnail2}" style="width: 100px; height: 100px;" alt="{$value->name}"
                             title="{$value->name}"/>
                    </a>
                </dt>
                <dd class="price">￥{$value->price_sale}</dd>
                <dd class="title">
                    <a href="?a=details&navid={$value->nav}&goodsid={$value->id}"
                       target="_blank">{$value->name}</a>
                </dd>
            </dl>
        {/foreach}
    </div>

</div>

{include file="default/public/footer.tpl"}
</body>
</html>