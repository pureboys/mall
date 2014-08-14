<?php

class Action
{
    protected $_tpl;
    protected $_model;
    protected $_redirect; //跳转类

    protected function __construct()
    {
        $this->_tpl = TPL::getInstance();
        $this->_model = Factory::setModel();
        $this->_redirect = Redirect::getInstance($this->_tpl);
    }

    protected function page($_pageSize = PAGE_SIZE, $_model = null)
    {
        $this->_model = is_null($_model) ? $this->_model : $_model;
        $_page = new Page($this->_model->totalData(), $_pageSize);
        $this->_model->setLimit($_page->getLimit());
        $this->_tpl->assign('page', $_page->showpage());
        $this->_tpl->assign('num', ($_page->getPage() - 1) * $_pageSize);
    }

    //Todo 临时应急用，需要重构
    protected function page2($_pageSize = PAGE_SIZE, $_model = null)
    {
        $this->_model = is_null($_model) ? $this->_model : $_model;
        $_page = new Page($this->_model->totalData(), $_pageSize);
        $this->_model->setLimit($_page->getLimit());
        $this->_tpl->assign('page2', $_page->showpage());
        $this->_tpl->assign('num2', ($_page->getPage() - 1) * $_pageSize);
    }


}