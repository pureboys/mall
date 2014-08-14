<?php

//购物车
class CartAction extends Action
{
    private $_nav;
    private $_cart;
    private $_order;
    private $_address;
    private $_goods;
    private $_delivery;

    public function __construct()
    {
        parent::__construct();
        if (!isset($_COOKIE['user'])) $this->_redirect->success('?a=member&m=login', '购物前必须登陆');
        $this->_nav = new NavModel();
        $this->_cart = new Cart();
        $this->_order = new OrderModel();
        $this->_address = new AddressModel();
        $this->_goods = new GoodsModel();
        $this->_delivery = new DeliveryModel();
    }

    public function index()
    {

        $this->_tpl->assign('FrontCart', $this->_cart->getProduct());
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->display(SMARTY_FRONT . 'public/cart.tpl');
    }

    //添加一个商品
    public function addProduct()
    {
        if ($this->_cart->addProduct()) $this->_redirect->success('?a=cart');
    }


    public function delProduct()
    {
        if ($this->_cart->delProduct()) $this->_redirect->success('?a=cart');
    }


    public function clearProduct()
    {
        if ($this->_cart->clearProduct()) $this->_redirect->success('?a=cart');
    }

    //更换产品数量
    public function changeNum()
    {
        echo $this->_cart->changeNum() ? 1 : 2;
    }

    //显示结算
    public function flow()
    {
        if ($this->_goods->isFlow()) {
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('FrontDelivery', $this->_delivery->findAllFlow());
            $this->_tpl->assign('FrontCart', $this->_cart->getProduct());
            $this->_tpl->assign('FrontAddress', $this->_address->findOne());
            $this->_tpl->display(SMARTY_FRONT . 'public/flow.tpl');
        }
    }

    //提交订单
    public function order()
    {
        if (isset($_POST['send'])) {
            if ($this->_order->isCart()) { //是否有数据
                $_id = $this->_order->getNextId();
                if ($this->_order->order()) {
                    $this->_goods->setInventory();
                    $this->_cart->clearProduct();
                    if ($_POST['pay'] == '支付宝') {
                        $this->_redirect->success('?a=member&m=alipay&id=' . $_id);
                    } else if ($_POST['pay'] == '银行转账') {
                        $this->_redirect->success('?a=member&m=alipay2&id=' . $_id);
                    } else if ($_POST['pay'] == '货到付款') {
                        $this->_redirect->success('?a=member&m=alipay3&id=' . $_id);
                    }
                }
            }
        }
    }

}