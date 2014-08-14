<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/edit.css"/>
</head>
<body>
<h2><a href="?a=edit&m=add&dir={$smarty.get.dir}&file={$smarty.get.file}">添加文件</a>系统--文件列表</h2>

<div id="list">
    <form action="?a=nav&m=sort" method="post">
        <table>
            <tr>
                <th>文件名称</th>
                <th>操作</th>
            </tr>
            {foreach from=$File key="key" item="value"}
                {if $value != '.' && $value != '..'}
                    <tr>
                        <td>{$value}</td>
                        <td>
                            <a href="?a=edit&m=update&dir={$smarty.get.dir}&file={$smarty.get.file}&name={$value}">编辑</a>
                            <a href="?a=edit&m=delete&dir={$smarty.get.dir}&file={$smarty.get.file}&name={$value}"
                               onclick="return confirm('你真的要删除这个文件么?') ? true : false" >删除</a>
                        </td>
                    </tr>
                {/if}
            {/foreach}
            <tr>
                <td colspan="2">
                    <a href="?a=edit&m=dir&dir={$smarty.get.dir}">返回目录</a>
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>