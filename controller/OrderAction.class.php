<?php

// 订单控制器
class OrderAction extends Action
{
    private $_delivery;

    public function __construct()
    {
        parent::__construct();
        $this->_delivery = new DeliveryModel();
    }

    public function index()
    {
        parent::page();
        $this->_tpl->assign('AllOrder', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'order/show.tpl');
    }


    //修改
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '订单修改成功！');
            } else {
                $this->_redirect->error('订单修改失败');
            }
        }

        if (isset($_GET['id'])) {
            $this->_tpl->assign('OneOrder', $this->_model->findUserDetails());
            $this->_tpl->assign('AllDelivery', $this->_delivery->findUpdateOrder());
            $this->_tpl->display(SMARTY_ADMIN . 'order/update.tpl');
        }
    }


    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '订单删除成功！');
            } else {
                $this->_redirect->error('订单删除失败！确认订单为取消状态');
            }
        }
    }

    //清理
    public function clear()
    {
        if ($this->_model->clear()) {
            $this->_redirect->success(Tool::getPrevPage(), '订单清理成功！');
        } else {
            $this->_redirect->error('没有找到可以清理的订单');
        }
    }


}