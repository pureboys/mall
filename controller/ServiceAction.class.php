<?php

//售后
class ServiceAction extends Action
{

    public function __construct()
    {
        parent::__construct();

    }

    public function index()
    {
        parent::page();
        $this->_tpl->assign('AllService', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'service/show.tpl');
    }

    //添加
    public function add()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->addData()) {
                $this->_redirect->success('?a=service', '售后添加成功！');
            } else {
                $this->_redirect->error('售后添加失败！');
            }
        }
        $this->_tpl->display(SMARTY_ADMIN . 'service/add.tpl');
    }

    //修改
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '售后修改成功！');
            } else {
                $this->_redirect->error('售后修改失败！');
            }
        }

        if (isset($_GET['id'])) {
            $this->_tpl->assign('OneService', $this->_model->findOne());
            $this->_tpl->display(SMARTY_ADMIN . 'service/update.tpl');
        }
    }

    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '售后删除成功！');
            } else {
                $this->_redirect->error('售后删除失败！请取消默认首选');
            }
        }
    }

    public function first()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->first()) {
                $this->_redirect->success(Tool::getPrevPage());
            } else {
                $this->_redirect->error('售后默认失败！');
            }
        }
    }


    //ajax
    public function isName()
    {
        $this->_model->isName();
    }

}