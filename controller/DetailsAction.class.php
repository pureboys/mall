<?php


class DetailsAction extends Action
{
    private $_nav;
    private $_goods;
    private $_attr;
    private $_commend;
    private $_record;

    public function __construct()
    {
        parent::__construct();
        $this->_nav = new NavModel();
        $this->_goods = new GoodsModel();
        $this->_attr = new AttrModel();
        $this->_commend = new CommendModel();
        $this->_record = new RecordModel();
    }

    public function index()
    {
        if ($this->_goods->isDetailsGoods()) {
            parent::page(20, $this->_commend);
            $this->_tpl->assign('commend', $this->_commend->findDetailsCommend());

            parent::page2(20, $this->_record);
            $this->_tpl->assign('record', $this->_record->findDetailsRecord());

            $this->_tpl->assign('FrontRecord', $this->_goods->getRecord());
            $this->_tpl->assign('NavSort', $this->_goods->navSort());

            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('FrontNav', $this->_nav->findFrontNav());
            $this->_tpl->assign('FrontGoods', $this->_goods->findDetailsGoods());
            $this->_tpl->assign('attrType', $this->_attr->getAttrType());
            $this->_tpl->assign('domain', Tool::getDoMain());
            $this->_tpl->display(SMARTY_FRONT . 'public/details.tpl');
        } else {
            $this->_redirect->error('找不到该商品');
        }

    }
} 