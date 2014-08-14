<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/commend.css"/>
</head>
<body>
<h2><a href="?a=commend">返回评价列表</a>商品--修改评价</h2>

<form action="?a=commend&m=update&id={$OneCommend[0]->id}" method="post" name="update">
    <dl class="form">
        <dd>
            商品名称: <a href="?a=details&navid={$smarty.get.nav}&goodsid={$OneCommend[0]->goods_id}"
                     target="_blank">{$smarty.get.name}</a>
        </dd>
        <dd>
            购买属性: {$OneCommend[0]->attr}
        </dd>
        <dd>
            评价用户: {$OneCommend[0]->user}
        </dd>
        <dd>
            评价星级:
            <span class="star">{html_radios name="star" options="$star" checked=$star_checked}</span>
        </dd>
        <dd>
            <span class="middle">评价内容:</span>
            <textarea name="content" id="" cols="" rows="">{$OneCommend[0]->content}</textarea>
        </dd>
        <dd>
            <span class="middle">回复内容:</span>
            <textarea name="re_content" id="" cols="" rows="">{$OneCommend[0]->re_content}</textarea>
        </dd>

        <dd>
            是否显示：
            <input type="radio" name="flag" value="0" {if $OneCommend[0]->flag == 0} checked {/if}/> 是
            <input type="radio" name="flag" value="1" {if $OneCommend[0]->flag == 1} checked {/if}/> 否
        </dd>
        <dd><input type="submit" name="send" value="修改评价" class="submit"/></dd>
    </dl>
</form>

</body>
</html>