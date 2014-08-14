<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>在线商城后台管理</title>
    <link rel="stylesheet" href="/view/admin/style/basic.css"/>
    <link rel="stylesheet" href="/view/admin/style/main.css"/>
</head>
<body>


<h2>起始页--后台管理</h2>

<div id="list">
        <table>
            <tr>
                <th colspan="4">订单统计信息</th>
            </tr>
            <tr>
                <td>待发货订单：</td>
                <td>{$Order1Count}</td>
                <td>未确认订单：</td>
                <td>{$Order2Count}</td>
            </tr>
            <tr>
                <td>未支付订单：</td>
                <td>{$Order3Count}</td>
                <td>申请退款订单：</td>
                <td>{$Order4Count}</td>
            </tr>
        </table>


    <table>
        <tr>
            <th colspan="4">商品统计信息</th>
        </tr>
        <tr>
            <td>商品总数量：</td>
            <td>{$AllGoodsCount}</td>
            <td>库存警告量：</td>
            <td>{$InventoryGoodsCount}</td>
        </tr>
        <tr>
            <td>下架总数量：</td>
            <td>{$DownGoodsCount}</td>
            <td>促销商品量：</td>
            <td>0</td>
        </tr>
    </table>

    <table>
        <tr>
            <th colspan="4">系统信息</th>
        </tr>
        <tr>
            <td>服务器基本信息：</td>
            <td>{php}echo $_SERVER["HTTP_USER_AGENT"]{/php}</td>
            <td>服务器软件：</td>
            <td>{php}echo $_SERVER["SERVER_SOFTWARE"]{/php}</td>
        </tr>
    </table>

</div>



</body>
</html>