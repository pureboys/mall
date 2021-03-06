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

<form action="?a=member&m=commend" method="post">
    <input type="hidden" name="goods_id" value="{$smarty.get.goods_id}"/>
    <input type="hidden" name="order_id" value="{$smarty.get.order_id}"/>
    <input type="hidden" name="attr"
           value="{foreach from=$GoodsOne.attr key="key" item="value"} {$key}:{foreach from=$value key="k" item="v"} {$v} {/foreach};{/foreach}"/>

    <div id="main">
        <h2>商品评价</h2>

        <div class="commend">
            <a href="?a=details&navid={$GoodsOne.nav}&goodsid={$GoodsOne.id}" target="_blank">
                <img src="{$GoodsOne.thumbnail2}" alt="{$GoodsOne.name}"/>
            </a>
            <dl>
                <dt>
                    <a href="?a=details&navid={$GoodsOne.nav}&goodsid={$GoodsOne.id}"
                       target="_blank">{$GoodsOne.name}</a>
                </dt>
                <dd>
                    {foreach from=$GoodsOne.attr key="key" item="value"}
                        {$key}:
                        {foreach from=$value key="k" item="v"}
                            {$v}
                        {/foreach}
                        ;
                    {/foreach}
                </dd>
                {if $CommendOne[0]}
                    <dd>评分:
                        {if $CommendOne[0]->star == 5}<span class="star">★★★★★</span>{/if}
                        {if $CommendOne[0]->star == 4}<span class="star">★★★★</span>{/if}
                        {if $CommendOne[0]->star == 3}<span class="star">★★★</span>{/if}
                        {if $CommendOne[0]->star == 2}<span class="star">★★</span>{/if}
                        {if $CommendOne[0]->star == 1}<span class="star">★</span>{/if}
                    </dd>
                    <dd>
                        {$CommendOne[0]->content}
                    </dd>
                    <dd>
                        {if $CommendOne[0]->re_content}
                            <p class="red">
                                商家回复:{$CommendOne[0]->re_content}
                            </p>
                        {/if}
                    </dd>
                    <dd>
                        [<a href="?a=member&m=order_details&id={$smarty.get.order_id}">返回订单</a>]
                    </dd>
                {else}
                    <dd>评分:
                        <label for="star5"><input type="radio" name="star" value="5" id="star5" checked/>
                            <span class="star">★★★★★</span>
                        </label>
                        <label for="star4">
                            <input type="radio" name="star" value="4" id="star4"/>
                            <span class="star">★★★★</span>
                        </label>
                        <label for="star3">
                            <input type="radio" name="star" value="3" id="star3"/>
                            <span class="star">★★★</span>
                        </label>
                        <label for="star2">
                            <input type="radio" name="star" value="2" id="star2"/>
                            <span class="star">★★</span>
                        </label>
                        <label for="star1">
                            <input type="radio" name="star" value="1" id="star1"/>
                            <span class="star">★</span>
                        </label>
                    </dd>
                    <dd><textarea name="content" id="" cols="" rows=""></textarea></dd>
                    <dd><input type="submit" name="send" value="发表评价"/>
                        [<a href="?a=member&m=order_details&id={$smarty.get.order_id}">返回订单</a>]
                    </dd>
                {/if}
            </dl>
        </div>

    </div>
</form>

{include file="default/public/footer.tpl"}

</body>
</html>