<?php

//对比类
class CompareAction extends Action
{
    private $_nav;
    private $_goods;

    public function __construct()
    {
        parent::__construct();
        $this->_nav = new NavModel();
        $this->_goods = new GoodsModel();
    }

    public function index()
    {
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('FrontRecord', $this->_goods->getRecord());
        $this->_tpl->assign('Compare', $this->_goods->getCompare());
        $this->_tpl->display(SMARTY_FRONT . 'public/compare.tpl');
    }

    //添加对比商品
    public function setCompare()
    {
        $this->_goods->setCompare() ? $this->_redirect->success('?a=compare') : $this->_redirect->error('商品对比失败！');
    }

    //删除对比商品
    public function delCompare()
    {
        $this->_goods->delCompare() ? $this->_redirect->success('?a=compare') : $this->_redirect->error('删除对比失败！');
    }

    //清空对比商品
    public function clearCompare()
    {
        $this->_goods->clearCompare() ? $this->_redirect->success('?a=compare') : $this->_redirect->error('清空对比失败！');
    }


}