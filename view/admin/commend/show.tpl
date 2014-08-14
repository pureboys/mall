<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/commend.css"/>
</head>
<body>
<h2>商品--评价列表</h2>

<div id="list">
    <form action="?a=nav&m=sort" method="post">
        <table>
            <tr>
                <th>商品名称</th>
                <th>评价内容</th>
                <th>回复内容</th>
                <th>评价星级</th>
                <th>评价者</th>
                <th>操作</th>
            </tr>
            {foreach from="$AllCommend" key="key" item="value"}
                <tr>
                    <td><a href="?a=details&navid={$value->nav}&goodsid={$value->goods_id}"
                           target="_blank">{$value->name|truncate:20}</a></td>
                    <td>{$value->content}</td>
                    <td>{if $value->re_content}{$value->re_content|truncate:20}{else}<span class="red">尚未回复</span>{/if}
                    </td>
                    <td>
                        {if $value->star == 5}<span class="star">★★★★★</span>{/if}
                        {if $value->star == 4}<span class="star">★★★★</span>{/if}
                        {if $value->star == 3}<span class="star">★★★</span>{/if}
                        {if $value->star == 2}<span class="star">★★</span>{/if}
                        {if $value->star == 1}<span class="star">★</span>{/if}
                    </td>
                    <td>{$value->user}</td>
                    <td>
                        <a href="?a=commend&m=update&id={$value->id}&name={$value->name}&nav={$value->nav}">
                            <img src="/view/admin/images/edit.gif" alt="编辑" title="编辑"/>
                        </a>
                        <a href="?a=commend&m=delete&id={$value->id}"
                           onclick="return confirm('删掉评价之后，用户可重新进行评价\r\n你屏蔽评价在修改中设置\r\n你真的要删除这个评价么?') ? true : false">
                            <img src="/view/admin/images/drop.gif" alt="删除" title="删除"/>
                        </a>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="6">没有任何评价！</td>
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