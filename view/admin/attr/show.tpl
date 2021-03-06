<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/attr.css"/>
</head>
<body>
<h2><a href="?a=attr&m=add">添加自定义属性</a>商品--自定义属性列表</h2>

<div id="list">
    <table>
        <tr>
            <th>属性名称</th>
            <th>属性项目</th>
            <th>关联类型</th>
            <th>操作</th>
        </tr>
        {foreach from="$AllAttr" key="key" item="value"}
            <tr>
                <td>{$value->name}</td>
                <td>{$value->item}</td>
                <td>{$value->nav}</td>
                <td>
                    <a href="?a=attr&m=update&id={$value->id}"><img src="/view/admin/images/edit.gif" alt="编辑"
                                                                      title="编辑"/></a><a
                            href="?a=attr&m=delete&id={$value->id}"
                            onclick="return confirm('你真的要删除这个自定义属性么?') ? true : false"><img
                                src="/view/admin/images/drop.gif" alt="删除" title="删除"/></a>
                </td>
            </tr>
            {foreachelse}
            <tr>
                <td colspan="4">没有自定义属性！</td>
            </tr>
        {/foreach}
    </table>
</div>

<div id="page">{$page}</div>


</body>
</html>