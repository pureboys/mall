<?php

//物流
class DeliveryAction extends Action
{

    public function __construct()
    {
        parent::__construct();

    }

    public function index()
    {
        parent::page();
        $this->_tpl->assign('AllDelivery', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'delivery/show.tpl');
    }

    //添加
    public function add()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->addData()) {
                $this->_redirect->success(Tool::getPrevPage(), '快递添加成功！');
            } else {
                $this->_redirect->error('快递添加失败！');
            }
        }
        if (isset($_GET['id'])) $this->_tpl->assign('OneNav', $this->_model->findOne());
        $this->_tpl->display(SMARTY_ADMIN . 'delivery/add.tpl');
    }

    //修改
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '快递修改成功！');
            } else {
                $this->_redirect->error('快递修改失败！');
            }
        }

        if (isset($_GET['id'])) {
            $this->_tpl->assign('OneDelivery', $this->_model->findOne());
            $this->_tpl->display(SMARTY_ADMIN . 'delivery/update.tpl');
        }
    }

    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '快递删除成功！');
            } else {
                $this->_redirect->error('快递删除失败！');
            }
        }
    }

    //ajax
    public function isName()
    {
        $this->_model->isName();
    }

}