<?php

//商品
class GoodsAction extends Action
{
    private $_nav;
    private $_brand;
    private $_attr;
    private $_service;

    public function __construct()
    {
        parent::__construct();
        $this->_nav = new NavModel();
        $this->_brand = new BrandModel();
        $this->_attr = new AttrModel();
        $this->_service = new ServiceModel();
    }

    public function index()
    {
        parent::page();
        $this->_tpl->assign('AllGoods', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'goods/show.tpl');
    }

    //添加
    public function add()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->addData()) {
                $this->_redirect->success('?a=goods', '商品添加成功！');
            } else {
                $this->_redirect->error('商品添加失败！');
            }
        }
        $this->_tpl->assign('addNav', $this->_nav->findAddGoodsNav());
        $this->_tpl->assign('addService', $this->_service->findAddGoodsService());
        $this->_tpl->assign('addServiceSelected', $this->_service->findAddGoodsServiceSelected());
        $this->_tpl->display(SMARTY_ADMIN . 'goods/add.tpl');
    }

    //修改
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '商品修改成功！');
            } else {
                $this->_redirect->error('商品修改失败！');
            }
        }

        if (isset($_GET['id'])) {
            $this->_tpl->assign('addNav', $this->_nav->findAddGoodsNav());
            $this->_tpl->assign('bool', array(1 => '是', 0 => '否'));
            $this->_tpl->assign('OneGoods', $this->_model->findOne());
            $this->_tpl->assign('addService', $this->_service->findAddGoodsService());
            $this->_tpl->display(SMARTY_ADMIN . 'goods/update.tpl');
        }
    }

    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '商品删除成功！');
            } else {
                $this->_redirect->error('商品删除失败！');
            }
        }
    }

    //ajax 获取brand
    public function getBrand()
    {
        echo $this->_brand->findGoodsBrand();
    }

    //ajax 获取属性
    public function getAttr()
    {
        echo $this->_attr->findGoodsAttr();
    }

    //ajax 获取商品编号 用于新增
    public function isSn()
    {
        echo $this->_model->isSn();
    }

    //ajax 获取商品编号 用于修改
    public function isUpdateSn()
    {
        echo $this->_model->isUpdateSn();
    }


    //上下架
    public function isUp()
    {
        if ($this->_model->isUp()) $this->_redirect->success(Tool::getPrevPage());
    }


}