<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/service.css"/>
    <script src="/ckeditor/ckeditor.js"></script>
</head>
<body>
<h2><a href="?a=service">返回品牌列表</a>商品--修改品牌</h2>

<form action="?a=service&m=update&id={$OneService[0]->id}" method="post" name="update">
    <dl class="form">
        <dd>售后服务名称: {$OneService[0]->name}
        </dd>
        <dd>售后服务首选: <input type="radio" name="first" value="0" {if $OneService[0]->first == 0} checked {/if} />否 <input type="radio" name="first" value="1" {if $OneService[0]->first == 1} checked {/if}/>是</dd>
        <dd><textarea name="content" id="TextArea1" class="ckeditor" cols="" rows="">{$OneService[0]->content}</textarea></dd>
        <dd><input type="submit" name="send" value="修改售后" class="submit"/></dd>
    </dl>
</form>

</body>
</html>