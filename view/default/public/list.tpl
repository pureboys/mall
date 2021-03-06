<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/list.css"/>
    <script src="/view/default/js/rewrite.js"></script>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a>
    {foreach from=$FrontNav[0]->sait key="key" item="value"}
        &nbsp;&gt;&nbsp;
        <a href="?a=list&navid={$key}">{$value}</a>
    {/foreach}
</div>

<div id="sidebar">
    <h2>{$FrontNav[0]->name}</h2>
    <ul>
        {foreach from=$FrontNav[0]->child key="key" item="value"}
            <li><a href="?a=list&navid={$value->id}">{$value->name}<span class="gray">({$value->count})</span></a></li>
        {/foreach}
    </ul>
    <h2>当月热销</h2>
    <div>

        {foreach from=$NavSort key="key" item="value"}
                <dl style="border: none">
                    <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}">
                            <img src="{$value->thumbnail2}" style="width: 100px; height: 100px;" alt="{$value->name}" title="{$value->name}"/>
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
    <h2>浏览记录</h2>

    <div>
        {foreach from=$FrontRecord key="key" item="value"}
            {if $key < 3}
                <dl style="border: none">
                    <dt><a href="?a=details&navid={$value.nav}&goodsid={$value.id}">
                            <img src="{$value.thumbnail2}" style="width: 100px; height: 100px;" alt="{$value.name}" title="{$value.name}"/>
                        </a>
                    </dt>
                    <dd class="price">￥{$value.price}</dd>
                    <dd class="title">
                        <a href="?a=details&navid={$value.nav}&goodsid={$value.id}"
                           target="_blank">{$value.name}</a>
                    </dd>
                </dl>
            {/if}
        {/foreach}
        <p><a href="?a=list&m=delRecord">清空浏览记录</a></p>
    </div>
</div>

<div id="main">
    <h2>商品筛选</h2>

    <div class="filter">
        {if $FrontBrand}
            <p>品牌：{if $smarty.get.brand}<a href="{$url}&brand=">全部</a>{else}<span>全部</span>{/if}
                {foreach from=$FrontBrand key="key" item="value"}
                    {if $smarty.get.brand == $key}
                        <span>{$value}</span>
                    {else}
                        <a href="{$url}&brand={$key}">{$value}</a>
                    {/if}
                {/foreach}
            </p>
        {/if}


        {foreach from=$FrontAttr key="key" item="value"}
            <p>{$key}：{if $smarty.get.attr}<a href="{$url}&attr=">全部</a>{else}<span>全部</span>{/if}
                {foreach from=$value key="k" item="v"}
                    {assign var=attr value="$key:$v"}
                    {if $smarty.get.attr == $attr}
                        <span>{$v}</span>
                    {else}
                        <a href="{$url}&attr={$key}:{$v}">{$v}</a>
                    {/if}
                {/foreach}
            </p>
        {/foreach}




        {if $FrontPrice[0]->price}
            <p>
                价格：{if $smarty.get.price}<a href="{$url}&price=">全部</a>{else}<span>全部</span>{/if}
                {foreach from=$FrontPrice[0]->price key="key" item="value"}
                    {if $smarty.get.price == $key}
                        <span>{$value}</span>
                    {else}
                        <a href="{$url}&price={$key}">{$value}</a>
                    {/if}
                {/foreach}
            </p>
        {/if}
    </div>
    <h2>商品列表</h2>

    <div class="pro">
        {foreach from=$ListGoods key="key" item="value"}
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
        {/foreach}
        <div id="page">{$page}</div>
    </div>
</div>
{include file="default/public/footer.tpl"}
</body>
</html>