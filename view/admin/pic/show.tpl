<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/pic.css"/>
</head>
<body>
<h2>系统--图片列表</h2>

<div id="list">
    <form action="?a=nav&m=sort" method="post">
        <table>
            <tr>
                <th>时间目录</th>
                <th>图片张数</th>
                <th>操作</th>
            </tr>
            {foreach from=$DirArr key="key" item="value"}
            <tr>
                <td>{$value.name}</td>
                <td>{$value.count}</td>
                <td><a href="?a=pic&m=file&file={$value.name}">进入目录</a></td>
            </tr>
            {/foreach}
        </table>
    </form>
</div>


</body>
</html>