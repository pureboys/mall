<?php

//评价
class CommendAction extends Action
{

    public function __construct()
    {
        parent::__construct();

    }

    public function index()
    {
        parent::page();
        $this->_tpl->assign('AllCommend', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN . 'commend/show.tpl');
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
        $this->_tpl->display(SMARTY_ADMIN . 'commend/add.tpl');
    }

    //修改导航
    public function update()
    {
        if (isset($_POST['send'])) {
            if ($this->_model->updateData()) {
                $this->_redirect->success(Tool::getPrevPage(), '评价修改成功！');
            } else {
                $this->_redirect->error('评价修改失败！');
            }
        }

        if (isset($_GET['id'])) {
            $_OneCommend = $this->_model->findUpdateOne();
            $this->_tpl->assign('OneCommend', $_OneCommend);
            $this->_tpl->assign('star', array(
                5 => '★★★★★',
                4 => '★★★★',
                3 => '★★★',
                2 => '★★',
                1 => '★'
            ));
            $this->_tpl->assign('star_checked', $_OneCommend[0]->star);
            $this->_tpl->display(SMARTY_ADMIN . 'commend/update.tpl');
        }
    }

    //删除
    public function delete()
    {
        if (isset($_GET['id'])) {
            if ($this->_model->deleteData()) {
                $this->_redirect->success(Tool::getPrevPage(), '评价删除成功！');
            } else {
                $this->_redirect->error('评价删除失败！');
            }
        }
    }

    //ajax
    public function isBrand()
    {
        $this->_model->isBrand();
    }

}