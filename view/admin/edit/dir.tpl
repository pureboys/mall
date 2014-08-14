<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/edit.css"/>
</head>
<body>
<h2><a href="###">添加目录</a>系统--目录列表</h2>

<div id="list">
    <form action="?a=nav&m=sort" method="post">
        <table>
            <tr>
                <th>目录名称</th>
                <th>操作</th>
            </tr>
            {foreach from=$DirArr key="key" item="value"}
                <tr>
                    <td>{$value}</td>
                    <td><a href="?a=edit&m=file&dir={$smarty.get.dir}&file={$value}">进入目录</a></td>
                </tr>
            {/foreach}
            <tr>
                <td colspan="2">
                    <a href="?a=edit">返回风格</a>
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>