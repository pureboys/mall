<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/price.css"/>
</head>
<body>
<h2><a href="?a=price&m=add">添加价格区间</a>商品--价格区间列表</h2>

<div id="list">
    <form action="?a=nav&m=sort" method="post">
        <table>
            <tr>
                <th>左区间</th>
                <th>右区间</th>
                <th>操作</th>
            </tr>
            {foreach from="$AllPrice" key="key" item="value"}
                <tr>
                    <td>{$value->price_left}</td>
                    <td>{$value->price_right}</td>
                    <td>
                        <a href="?a=price&m=update&id={$value->id}"><img src="/view/admin/images/edit.gif" alt="编辑"
                                                                         title="编辑"/></a><a
                                href="?a=price&m=delete&id={$value->id}"
                                onclick="return confirm('你真的要删除这个价格区间么?') ? true : false"><img
                                    src="/view/admin/images/drop.gif" alt="删除" title="删除"/></a>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="8">没有任何价格区间！</td>
                </tr>
            {/foreach}
        </table>
    </form>
</div>

<div id="page">{$page}</div>

</body>
</html>