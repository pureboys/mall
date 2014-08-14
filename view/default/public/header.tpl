<div id="header">
    <h1><a href="./">俱乐部</a></h1>
    <div class="top">
        {if $smarty.cookies.user}
            你好，{$smarty.cookies.user} 欢迎光临！
            <a href="?a=member">个人中心</a> |
            <a href="?a=cart">购物车</a>  |
            <a href="?a=member&m=logout">退出</a>
        {else}
            <a href="?a=member&m=login"><img src="/view/default/images/bnt_log.gif" alt="登陆"/></a>
            <a href="?a=member&m=reg"><img src="/view/default/images/bnt_reg.gif" alt="注册"/></a>
        {/if}
    </div>
</div>
<div id="nav">
    <ul>
        <li><a href="./" {if !$smarty.get.navid} class="strong" {/if}>首页</a></li>
        {foreach from="$FrontTenNav" key="key" item="value"}
            <li>
                <a href="?a=list&navid={$value->id}" {if $FrontNav[0]->id == $value->id} class="strong" {/if}>{$value->name}</a>
            </li>
        {/foreach}
    </ul>
</div>

<div id="search">
    <!--
    <select name="type" id="">
        <option value="">--所有类别--</option>
    </select>
    <input type="text" name="keyword"/>
    <input type="submit" value="提交"/>
    <a href="###">高级搜索</a>
    -->
</div>
