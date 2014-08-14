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
    <div id="main">
        <h2>我的评价</h2>


        {foreach from=$MyCommend key="key" item="value"}
            <div class="mycommend">
                <p>
                    <img src="{$value->thumbnail2}" alt="{$value->name}"/>
                </p>

                <p><a href="?a=details&navid={$value->nav}&goodsid={$value->goods_id}"
                      target="_blank">{$value->name}</a></p>

                <p>
                    评价：
                    {if $value->star == 5}<span class="star">★★★★★</span>{/if}
                    {if $value->star == 4}<span class="star">★★★★</span>{/if}
                    {if $value->star == 3}<span class="star">★★★</span>{/if}
                    {if $value->star == 2}<span class="star">★★</span>{/if}
                    {if $value->star == 1}<span class="star">★</span>{/if}
                </p>

                <p class="attr">{$value->attr}</p>

                <p><em>{$value->date}</em>{$value->content}</p>



                <p class="red">
                    {if $value->re_content}
                        商家回复：
                        {$value->re_content}
                    {/if}
                </p>
            </div>
        {/foreach}


    </div>
</form>

{include file="default/public/footer.tpl"}

</body>
</html>