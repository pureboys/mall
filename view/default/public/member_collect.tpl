<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/member.css"/>
    <script src="/view/default/js/ajax.js"></script>
    <script src="/view/default/js/reg.js"></script>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a> &gt; 个人中心
</div>

{include file="default/public/member_sidebar.tpl"}


    <div id="main">
        <h2>我的收藏</h2>

        <div class="pro">
            {foreach from=$CollectGoods key="key" item="value"}
                <dl>
                    <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img
                                    src="{$value->thumbnail2}" alt="{$value->name}" title="{$value->name}"/></a></dt>
                    <dd class="price"><strong>￥{$value->price_sale}</strong>
                        <del>￥{$value->price_market}</del>
                    </dd>
                    <dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}">{$value->name}</a></dd>
                    <dd class="commend"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}#commend" target="_blank">已经有{$value->count}人评价</a> <span>(销售<strong>{$value->sales}</strong>{$value->unit})</span></dd>
                    <dd class="buy"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">购买</a> |
                        <a href="?a=member&m=delCollect&id={$value->id}">取消收藏</a> | <a href="?a=compare&m=setCompare&navid={$value->nav}&goodsid={$value->id}" target="_blank">比较</a></dd>
                </dl>
            {/foreach}
            <div id="page">{$page}</div>
        </div>

    </div>


{include file="default/public/footer.tpl"}

</body>
</html>