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
                <th>文件名称</th>
                <th>是否冗余</th>
                <th>操作</th>
            </tr>
            {foreach from=$File key="key" item="value"}
                {if $value != '.' && $value != '..'}
                    <tr>
                        <td>
                            {if $value->id}
                                <span class="green">/uploads/{$smarty.get.file}/{$value->pic}</span>
                            {else}
                                <span class="red">/uploads/{$smarty.get.file}/{$value}</span>
                            {/if}
                        </td>
                        <td>
                            {if $value->id}
                                <a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">{$value->name}</a>
                            {else}
                               <span class="red">是</span>
                            {/if}
                        </td>
                        <td>
                            {if $value->id}
                                ---
                            {else}
                                <a href="?a=pic&m=delete&file={$smarty.get.file}&name={$value}"
                                   onclick="return confirm('你真的要删除这个文件么?') ? true : false">删除</a>
                            {/if}
                        </td>
                    </tr>
                {/if}
            {/foreach}
            <tr>
                <td colspan="2">
                    <a href="?a=pic">返回目录</a>
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>