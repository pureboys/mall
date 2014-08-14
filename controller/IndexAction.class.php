<?php

class IndexAction extends Action
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
        $this->_tpl->assign('SalesSort', $this->_goods->salesGoods());
        $this->_tpl->display(SMARTY_FRONT . 'public/index.tpl');
    }


} 