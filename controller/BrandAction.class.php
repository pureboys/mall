<?php

//品牌
class BrandAction extends Action
{

    public function __construct()
    {
        parent::__construct();

    }

    public function index()
    {
        parent::page();
        $this->_tpl->assign('AllBrand', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'brand/show.tpl');
    }

    //添加导航
    public function add()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->addData()) {
                $this->_redirect->success(Tool::getPrevPage(), '品牌添加成功！');
            } else {
                $this->_redirect->error('品牌添加失败！');
            }
        }
        if (isset($_GET['id'])) $this->_tpl->assign('OneNav', $this->_model->findOne());
        $this->_tpl->display(SMARTY_ADMIN . 'brand/add.tpl');
    }

    //修改导航
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '品牌修改成功！');
            } else {
                $this->_redirect->error('品牌修改失败！');
            }
        }

        if (isset($_GET['id'])) {
            $this->_tpl->assign('OneBrand', $this->_model->findOne());
            $this->_tpl->display(SMARTY_ADMIN . 'brand/update.tpl');
        }
    }

    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '品牌删除成功！');
            } else {
                $this->_redirect->error('品牌删除失败！');
            }
        }
    }

    //ajax
    public function isBrand()
    {
        $this->_model->isBrand();
    }

}