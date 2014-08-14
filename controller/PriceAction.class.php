<?php

//价格区间控制器
class PriceAction extends Action
{
    private $_nav;

    public function __construct()
    {
        parent::__construct();
        $this->_nav = new NavModel();
    }

    public function index()
    {
        parent::page();
        $this->_tpl->assign('AllPrice', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'price/show.tpl');
    }

    //添加价格区间
    public function add()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->addData()) {
                $this->_redirect->success('?a=price', '价格区间新增成功！');
            } else {
                $this->_redirect->error('价格区间新增失败！');
            }
        }
        $this->_tpl->display(SMARTY_ADMIN . 'price/add.tpl');
    }

    //修改价格区间
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '价格区间修改成功！');
            } else {
                $this->_redirect->error('价格区间修改失败！');
            }
        }

        if (isset($_GET['id'])) {
            $this->_tpl->assign('OnePrice', $this->_model->findOne());
            $this->_tpl->display(SMARTY_ADMIN . 'price/update.tpl');
        }
    }

    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '价格区间删除成功！');
            } else {
                $this->_redirect->error('价格区间删除失败！');
            }
        }
    }

    //ajax
    public function isPrice()
    {
        $this->_model->isPrice();
    }


}