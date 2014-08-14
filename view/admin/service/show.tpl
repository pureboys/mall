<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/service.css"/>
</head>
<body>
<h2><a href="?a=service&m=add">添加售后</a>商品--售后列表</h2>

<div id="list">
    <form action="?a=nav&m=sort" method="post">
        <table>
            <tr>
                <th>售后服务</th>
                <th>默认首选</th>
                <th>操作</th>
            </tr>
            {foreach from="$AllService" key="key" item="value"}
                <tr>
                    <td>{$value->name}</td>
                    <td>{if $value->first == 1} <span class="green">是</span> {else} <span class="red">否</span> |
                            <a href="?a=service&m=first&id={$value->id}">默认</a> {/if}</td>
                    <td>
                        <a href="?a=service&m=update&id={$value->id}"><img src="/view/admin/images/edit.gif" alt="编辑"
                                                                         title="编辑"/></a><a
                                href="?a=service&m=delete&id={$value->id}"
                                onclick="return confirm('你真的要删除这个售后么?') ? true : false"><img
                                    src="/view/admin/images/drop.gif" alt="删除" title="删除"/></a>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="3">没有任何售后！</td>
                </tr>
            {/foreach}
            {if $AllNav}
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="send" value="排序"/></td>
                    <td></td>
                </tr>
            {/if}
            {if $OneNav}
                <tr>
                <td colspan="5">主类名称：<a href="?a=nav&sid={$OneNav[0]->sid}">{$OneNav[0]->name}</a></td></tr>{/if}
        </table>
    </form>
</div>

<div id="page">{$page}</div>

</body>
</html>