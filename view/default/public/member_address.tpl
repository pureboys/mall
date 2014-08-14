<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城系统</title>
    <link rel="stylesheet" href="/view/default/style/basic.css"/>
    <link rel="stylesheet" href="/view/default/style/member.css"/>
    <script src="/view/default/js/ajax.js"></script>
    <script src="/view/default/js/reg.js"></script>
</head>
<body>

{include file="default/public/header.tpl"}
<div id="sait">
    当前位置： <a href="./">首页</a> &gt; 个人中心
</div>

{include file="default/public/member_sidebar.tpl"}

<div id="main">
    <h2>收货地址</h2>

    <table class="cart" cellspacing="1">
        <tr>
            <th>收货人</th>
            <th>地址</th>
            <th>邮编</th>
            <th>电话</th>
            <th>电子邮件</th>
            <th>标志建筑</th>
            <th>是否江浙沪</th>
            <th>操作</th>
        </tr>
        {foreach from=$AllAddress key="key" item="value"}
            <tr>
                <td>{$value->name}</td>
                <td>{$value->address}</td>
                <td>{$value->code}</td>
                <td>{$value->tel}</td>
                <td>{$value->email}</td>
                <td>{$value->buildings}</td>
                <td>{if $value->flag == 1}是{else}否{/if}</td>
                <td> {if $value->selected == 1}<span style="color: #008000">是</span>{else}<a href="?a=member&m=selected&id={$value->id}">首选</a>{/if}
                    | 修改 | 删除
                </td>
            </tr>
        {/foreach}
    </table>

    <p class="right"><a href="?a=cart&m=flow">[去结算中心]</a></p>

    <form action="" method="post" name="reg">
        <input type="hidden" name="flag" id="flag" value=""/>
        <dl>
            <dd>省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内: <input type="radio" name="flag" value="1" checked/>是 <input type="radio" name="flag" value="0"/>否 </dd>
            <dd>收&nbsp;&nbsp;货&nbsp;&nbsp;人: <input type="text" name="name" class="text"/></dd>
            <dd>收获地址: <input type="text" name="address" class="text"/></dd>
            <dd>电子邮件: <input type="text" name="email" class="text"/></dd>
            <dd>邮政编码: <input type="text" name="code" class="text"/></dd>
            <dd>手机号码: <input type="text" name="tel" class="text"/></dd>
            <dd>标志建筑: <input type="text" name="buildings" class="text"/></dd>
            <dd><input type="submit" name="send" value="" class="submit"/></dd>
        </dl>
    </form>
</div>
{include file="default/public/footer.tpl"}

</body>
</html>