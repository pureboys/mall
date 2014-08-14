<?php

//导航条
class NavAction extends Action
{
    private $_brand;
    private $_price;

    public function __construct()
    {
        parent::__construct();
        $this->_brand = new BrandModel();
        $this->_price = new PriceModel();
    }

    public function index()
    {
        parent::page();
        if (isset($_GET['sid'])) $this->_tpl->assign('OneNav', $this->_model->findOne());
        $this->_tpl->assign('AllNav', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'nav/show.tpl');
    }

    //添加导航
    public function add()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->addData()) {
                $this->_redirect->success(Tool::getPrevPage(), '导航添加成功！');
            } else {
                $this->_redirect->error('导航添加失败！');
            }
        }
        if (isset($_GET['id'])) {
            $this->_tpl->assign('AllBrand', $this->_brand->findNavBrand());
            $this->_tpl->assign('OneNav', $this->_model->findOne());
        }
        $this->_tpl->assign('AllPrice',$this->_price->findAllNav());
        $this->_tpl->display(SMARTY_ADMIN . 'nav/add.tpl');
    }

    //修改导航
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '导航修改成功！');
            } else {
                $this->_redirect->error('导航修改失败！');
            }
        }

        if (isset($_GET['id'])) {
            $this->_tpl->assign('AllBrand', $this->_brand->findNavBrand());
            $this->_tpl->assign('AllPrice',$this->_price->findAllNav());
            $this->_tpl->assign('selectedBrand', $this->_model->findUpdateBrand());
            $this->_tpl->assign('selectedPrice', $this->_model->findUpdatePrice());
            $this->_tpl->assign('OneNav', $this->_model->findOne());
            $this->_tpl->display(SMARTY_ADMIN . 'nav/update.tpl');
        }
    }

    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '导航删除成功！');
            } else {
                $this->_redirect->error('导航删除失败！');
            }
        }
    }

    public function sort()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->sortData()) {
                $this->_redirect->success(Tool::getPrevPage());
            } else {
                $this->_redirect->error('排序失败！');
            }
        }
    }


    //ajax
    public function isName()
    {
        $this->_model->isName();
    }


}