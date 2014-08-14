<?php


class ListAction extends Action
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
        parent::page(15, $this->_goods);
        $this->_tpl->assign('ListGoods', $this->_goods->findListGoods());
        $this->_tpl->assign('FrontNav', $this->_nav->findFrontNav());
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('FrontPrice', $this->_nav->findFrontPrice());
        $this->_tpl->assign('FrontBrand', $this->_nav->findFrontBrand());
        $this->_tpl->assign('FrontAttr', $this->_nav->findFrontAttr());

        $this->_tpl->assign('FrontRecord', $this->_goods->getRecord());
        $this->_tpl->assign('NavSort', $this->_goods->navSort());

        $this->_tpl->assign('url', Tool::getUrl());
        $this->_tpl->display(SMARTY_FRONT . 'public/list.tpl');
    }

    //清空浏览记录
    public function delRecord()
    {
        $this->_goods->delRecord() ? $this->_redirect->success(Tool::getPrevPage()) : $this->_redirect->error('清空浏览记录失败!');
    }


} 