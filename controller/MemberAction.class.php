<?php

//前台会员
class MemberAction extends Action
{

    private $_nav;
    private $_user;
    private $_address;
    private $_order;
    private $_commend;
    private $_collect;


    public function __construct()
    {
        parent::__construct();
        $this->_nav = new NavModel();
        $this->_user = new UserModel();
        $this->_address = new AddressModel();
        $this->_order = new OrderModel();
        $this->_commend = new CommendModel();
        $this->_collect = new CollectModel();
    }

    public function index()
    {
        if ($_COOKIE['user']) {
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->display(SMARTY_FRONT . 'public/member.tpl');
        } else {
            $this->_redirect->success('?a=member&m=login');
        }
    }

    public function order()
    {
        if ($_COOKIE['user']) {
            parent::page(10, $this->_order);
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('AllOrder', $this->_order->findUserAll());
            $this->_tpl->display(SMARTY_FRONT . 'public/member_order.tpl');
        } else {
            $this->_redirect->success('?a=member&m=login');
        }
    }

    public function order_details()
    {
        if ($_COOKIE['user']) {
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
            $this->_tpl->assign('Prev', Tool::getPrevPage());
            $this->_tpl->display(SMARTY_FRONT . 'public/member_order_details.tpl');
        } else {
            $this->_redirect->success('?a=member&m=login');
        }
    }


    public function address()
    {
        if ($_COOKIE['user']) {
            if (isset($_POST['send'])) {
                if ($this->_address->addData()) {
                    $this->_redirect->success('?a=member&m=address');
                } else {
                    $this->_redirect->error('新增收货人失败！');
                }
            }
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('AllAddress', $this->_address->findAll());
            $this->_tpl->display(SMARTY_FRONT . 'public/member_address.tpl');
        } else {
            $this->_redirect->success('?a=member&m=login');
        }
    }

    public function selected()
    {
        if (isset($_GET['id'])) {
            if ($this->_address->selected()) {
                $this->_redirect->success(Tool::getPrevPage());
            } else {
                $this->_redirect->error('首选失败，请重试！');
            }
        }
    }


    public function reg()
    {
        if (isset($_POST['send'])) {
            if ($this->_user->frontReg()) {
                $this->_redirect->success('?a=member&m=login', '会员注册成功！');
            } else {
                $this->_redirect->error('会员注册失败！');
            }
        }
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->display(SMARTY_FRONT . 'public/reg.tpl');
    }

    public function login()
    {
        if (isset($_POST['send'])) {
            if ($this->_user->frontLogin()) {
                $this->_redirect->success('./');
            } else {
                $this->_redirect->error('登陆失败！');
            }
        }
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->display(SMARTY_FRONT . 'public/login.tpl');
    }

    //支付宝
    public function alipay()
    {
        if ($_COOKIE['user']) {
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
            $this->_tpl->display(SMARTY_FRONT . 'public/member_alipay.tpl');
        } else {
            $this->_redirect->success('?a=member&m=login');
        }
    }

    //银行转账
    public function alipay2()
    {
        if ($_COOKIE['user']) {
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
            $this->_tpl->display(SMARTY_FRONT . 'public/member_alipay2.tpl');
        } else {
            $this->_redirect->success('?a=member&m=login');
        }
    }

    //货到付款
    public function alipay3()
    {
        if ($_COOKIE['user']) {
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
            $this->_tpl->display(SMARTY_FRONT . 'public/member_alipay3.tpl');
        } else {
            $this->_redirect->success('?a=member&m=login');
        }
    }


    //取消订单
    public function cancel()
    {
        if (isset($_GET['id'])) {
            if ($this->_order->cancel()) {
                $this->_redirect->success(Tool::getPrevPage());
            } else {
                $this->_redirect->error('订单取消失败请重试！');
            }
        }
    }

    //申请退款
    public function refund()
    {
        if (isset($_GET['id'])) {
            if ($this->_order->refund()) {
                $this->_redirect->success(Tool::getPrevPage());
            } else {
                $this->_redirect->error('申请退款失败请重试！');
            }
        }
    }

    //评价
    public function commend()
    {
        if (isset($_POST['send'])) {
            if ($this->_commend->addData()) {
                $this->_redirect->success(Tool::getPrevPage());
            } else {
                $this->_redirect->error('评价失败请重试！');
            }
        }
        $this->_order->isCommendOrder();
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('GoodsOne', $this->_order->findCommendOrder());
        $this->_tpl->assign('CommendOne', $this->_commend->findOne());
        $this->_tpl->display(SMARTY_FRONT . 'public/member_commend.tpl');
    }

    //我的评价
    public function mycommend()
    {
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('MyCommend', $this->_commend->findMyCommend());
        $this->_tpl->display(SMARTY_FRONT . 'public/member_mycommend.tpl');
    }

    //我的收藏
    public function collect()
    {
        parent::page(20, $this->_collect);

        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('CollectGoods', $this->_collect->collectGoods());
        $this->_tpl->display(SMARTY_FRONT . 'public/member_collect.tpl');
    }

    //添加收藏
    public function addCollect()
    {
        if (isset($_COOKIE['user'])) {
            $this->_collect->addData() ? $this->_redirect->success('?a=member&m=collect') : $this->_redirect->error('收藏失败！');
        } else {
            $this->_redirect->success('?a=member&m=login', '收藏失败!请登录');
        }
    }

    //取消收藏
    public function delCollect()
    {
        if (isset($_COOKIE['user'])) {
            $this->_collect->deleteData() ? $this->_redirect->success('?a=member&m=collect') : $this->_redirect->error('取消收藏失败！');
        } else {
            $this->_redirect->success('?a=member&m=login', '取消收藏失败!请登录');
        }
    }

    public function logout()
    {
        $this->_user->frontLogout() ? $this->_redirect->success('./') : $this->_redirect->error('退出失败！');
    }

    public function isUser()
    {
        $this->_user->isUser();
    }

    public function ajaxLogin()
    {
        $this->_user->ajaxLogin();
    }


}