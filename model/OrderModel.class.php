<?php

//订单管理
class OrderModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'user', 'name', 'email', 'address', 'code', 'tel', 'buildings', 'delivery', 'pay', 'price', 'text', 'ps', 'ordernum', 'goods', 'date', 'order_state', 'order_pay', 'order_delivery', 'delivery_name', 'delivery_url', 'delivery_number', 'refund');
        $this->_tables = array(DB_PREFIX . 'order');
        $this->_check = new ManageCheck();
        list(
            $this->_R['id'],
            $this->_R['out_trade_no'],
            $this->_R['goods_id'],
            $this->_R['order_id'],
            $this->_R['user']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_GET['out_trade_no']) ? $_GET['out_trade_no'] : null,
            isset($_GET['goods_id']) ? $_GET['goods_id'] : null,
            isset($_GET['order_id']) ? $_GET['order_id'] : null,
            isset($_POST['user']) ? $_POST['user'] : null
        ));
    }

    public function findAll()
    {
        return parent::select($this->_tables, array('id', 'ordernum', 'date', 'price', 'order_state', 'order_pay', 'order_delivery', 'refund'), array('order' => 'date DESC', 'limit' => $this->_limit));
    }


    public function findUserAll()
    {
        return parent::select($this->_tables, array('id', 'ordernum', 'date', 'price', 'order_state', 'order_pay', 'order_delivery', 'refund', 'pay'), array('where' => array("user='{$_COOKIE['user']}'"), 'order' => 'date DESC', 'limit' => $this->_limit));
    }

    public function findUserDetails()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        $_orderDetails = parent::select($this->_tables, array('id', 'ordernum', 'date', 'goods', 'user', 'name', 'email', 'code', 'address', 'buildings', 'tel', 'delivery', 'pay', 'price', 'text', 'ps', 'order_state', 'order_pay', 'order_delivery', 'delivery_name', 'delivery_url', 'delivery_number', 'refund'), array('where' => $_where));
        $_orderDetails[0]->goods = unserialize(htmlspecialchars_decode($_orderDetails[0]->goods));
        if ($_orderDetails[0]->goods) {
            foreach ($_orderDetails[0]->goods as $_key => $_value) {
                $_orderDetails[0]->goods[$_key] = unserialize($_value);
            }
        }
        return $_orderDetails;
    }


    public function totalData()
    {
        if (isset($_COOKIE['user']) && $_GET['a'] == 'member' && $_GET['m'] == 'order') {
            return parent::total($this->_tables, array('where' => array("user='{$_COOKIE['user']}'")));
        } else {
            return parent::total($this->_tables);
        }
    }

    public function order()
    {
        //$_where = array("user='{$this->_R['user']}'");
        //if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_orderData = $this->getRequest()->filter($this->_fields);
        $_orderData['date'] = Tool::getDate();
        $_orderData['ordernum'] = Tool::getOrderNum();
        foreach ($_COOKIE['cart'] as $_key => $_value) {
            $_COOKIE['cart'][$_key] = stripslashes($_value);
        }
        $_orderData['goods'] = serialize($_COOKIE['cart']);
        return parent::add($this->_tables, $_orderData);
    }

    //修改订单状态
    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        if ($_updateData['order_state'] == '已取消' || (isset($_updateData['refund']) && $_updateData['refund'] == 2)) {
            $_obj = parent::select($this->_tables, array('goods'), array('where' => $_where));
            $_goods = unserialize(htmlspecialchars_decode($_obj[0]->goods));
            $this->_tables = array(DB_PREFIX . 'goods');
            foreach ($_goods as $_key => $_value) {
                $_temp = unserialize($_value);
                parent::update($this->_tables, array("id='{$_key}'"), array('inventory' => array('inventory+' . $_temp['num']), 'sales' => array('sales-' . $_temp['num'])));
            }
            $this->_tables = array(DB_PREFIX . 'order');
        }
        //后台点击已支付 然后成交记录入库
        if ($_updateData['order_pay'] == '已支付') $this->record();
        return parent::update($this->_tables, $_where, $_updateData);
    }

    //清理24小时未处理订单
    public function clear()
    {
        $_where = array("HOUR(TIMEDIFF(NOW(),date))>24 AND order_state='未确认' AND order_pay='未支付' AND order_delivery='未发货'");
        $_obj = parent::select($this->_tables, array('goods'), array('where' => $_where));
        $this->_tables = array(DB_PREFIX . 'goods');
        foreach ($_obj as $_key => $_value) {
            $_goods = unserialize(htmlspecialchars_decode($_value->goods));
            foreach ($_goods as $_k => $_v) {
                $_temp = unserialize($_v);
                parent::update($this->_tables, array("id='{$_k}'"), array('inventory' => array('inventory+' . $_temp['num']), 'sales' => array('sales-' . $_temp['num'])));
            }

        }
        $this->_tables = array(DB_PREFIX . 'order');
        $_updateData['order_state'] = '已取消';
        return parent::update($this->_tables, $_where, $_updateData);
    }


    //支付宝支付后
    public function updateOrderNum()
    {
        $_where = array("ordernum='{$this->_R['out_trade_no']}'");
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        $_updateData['order_pay'] = '已支付';
        //执行成交表入库
        $this->record();
        return parent::update($this->_tables, $_where, $_updateData);
    }

    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}' AND order_state='已取消'");
        return parent::delete($this->_tables, $_where);
    }

    public function getNextId()
    {
        return parent::nextID($this->_tables);
    }

    //取消前台订单
    public function cancel()
    {
        $_where = array("id='{$this->_R['id']}'");

        $_obj = parent::select($this->_tables, array('goods'), array('where' => $_where));
        $_goods = unserialize(htmlspecialchars_decode($_obj[0]->goods));
        $this->_tables = array(DB_PREFIX . 'goods');
        foreach ($_goods as $_key => $_value) {
            $_temp = unserialize($_value);
            parent::update($this->_tables, array("id='{$_key}'"), array('inventory' => array('inventory+' . $_temp['num']), 'sales' => array('sales-' . $_temp['num'])));
        }
        $this->_tables = array(DB_PREFIX . 'order');

        $_updateData['order_state'] = '已取消';
        return parent::update($this->_tables, $_where, $_updateData);

    }

    //申请退款
    public function refund()
    {
        $_where = array("id='{$this->_R['id']}' AND (order_pay='已支付' OR order_delivery='已配货' OR order_delivery='已发货')");
        $_updateData['refund'] = 1;
        return parent::update($this->_tables, $_where, $_updateData);
    }

    //购物车是否有数据
    public function isCart()
    {
        if (!isset($_COOKIE['cart'])) {
            $this->_check = new Check();
            $this->_check->setMessage('结算列表中没有商品，无法生成订单！');
            $this->_check->error();
        }
        return true;
    }

    //找到评论的订单
    public function findCommendOrder()
    {
        $_where = array("id='{$this->_R['order_id']}'");
        $_obj = parent::select($this->_tables, array('goods'), array('where' => $_where, 'limit' => '1'));
        $_obj = unserialize(htmlspecialchars_decode($_obj[0]->goods));
        return unserialize($_obj[$this->_R['goods_id']]);
    }

    //判断是否能够评价
    public function isCommendOrder()
    {
        $_where = array("id='{$this->_R['order_id']}'");
        $_obj = parent::select($this->_tables, array('order_delivery'), array('where' => $_where, 'limit' => '1'));
        if ($_obj[0]->order_delivery != '已发货') {
            $this->_check = new Check();
            $this->_check->setMessage('您的订单还未发货，此商品无法进行评价');
            $this->_check->error();
        }
    }

    //成交表 入库
    public function record()
    {
        $_where = array("id='{$this->_R['id']}'");
        $_obj = parent::select($this->_tables, array('goods'), array('where' => $_where));
        $_goods = unserialize(htmlspecialchars_decode($_obj[0]->goods));
        $this->_tables = array(DB_PREFIX . 'record');
        foreach ($_goods as $_key => $_value) {
            $_temp = unserialize($_value);
            $_addData['goods_id'] = $_temp['id'];
            $_addData['name'] = $_temp['name'];
            $_addData['num'] = $_temp['num'];
            $_addData['price'] = $_temp['price_sale'];
            $_addData['attr'] = '';
            if (isset($_temp['attr'])) {
                foreach ($_temp['attr'] as $_k1 => $_v1) {
                    $_addData['attr'] .= $_k1 . ':';
                    foreach ($_v1 as $_v2) {
                        $_addData['attr'] .= $_v2 . ',';
                    }
                }
                $_addData['attr'] = substr($_addData['attr'], 0, -1) . ';';
            }
            $_addData['user'] = $this->_R['user'];
            $_addData['date'] = Tool::getDate();
            parent::add($this->_tables, $_addData);
        }
        $this->_tables = array(DB_PREFIX . 'order');

    }

    //后台统计申请退款
    public function order4Count()
    {
        $_where = array("refund=1");
        $_order4Count = parent::select($this->_tables, array('COUNT(*) AS count'), array('where' => $_where));
        return $_order4Count[0]->count;
    }

    //后台统计未确认
    public function order2Count()
    {
        $_where = array("order_state='未确认'");
        $_order2Count = parent::select($this->_tables, array('COUNT(*) AS count'), array('where' => $_where));
        return $_order2Count[0]->count;
    }

    //后台统计未支付
    public function order3Count()
    {
        $_where = array("order_state='已确认' AND order_pay='未支付'");
        $_order3Count = parent::select($this->_tables, array('COUNT(*) AS count'), array('where' => $_where));
        return $_order3Count[0]->count;
    }

    //后台统计待发货
    public function order1Count()
    {
        $_where = array("order_state='已确认' AND order_pay='已支付' AND order_delivery='未发货'");
        $_order1Count = parent::select($this->_tables, array('COUNT(*) AS count'), array('where' => $_where));
        return $_order1Count[0]->count;
    }

}