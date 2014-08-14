<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/edit.css"/>
</head>
<body>
<h2><a href="###">添加风格</a>系统--风格列表</h2>

<div id="list">
    <form action="?a=nav&m=sort" method="post">
        <table>
            <tr>
                <th>风格名称</th>
                <th>风格目录</th>
                <th>风格版本</th>
                <th>操作</th>
            </tr>
            <tr>
                <td><input type="text" value="默认风格" size="8"/></td>
                <td>风格目录</td>
                <td>v1.0</td>
                <td><a href="?a=edit&m=dir&dir=default">进入目录</a></td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>