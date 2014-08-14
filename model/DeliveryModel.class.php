<?php

//物流
class DeliveryModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'name', 'url', 'info', 'date', 'price_in', 'price_out', 'price_add');
        $this->_tables = array(DB_PREFIX . 'delivery');
        $this->_check = new DeliveryCheck();
        list(
            $this->_R['id'],
            $this->_R['name']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_POST['name']) ? $_POST['name'] : null
        ));
    }

    public function addData()
    {
        $_where = array("name='{$this->_R['name']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['date'] = Tool::getDate();
        return parent::add($this->_tables, $_addData);
    }

    public function findAll()
    {
        return parent::select($this->_tables, array('id', 'name', 'url', 'info','price_in', 'price_out', 'price_add'), array('order' => 'date DESC', 'limit' => $this->_limit));
    }

    public function findAllFlow()
    {
        return parent::select($this->_tables, array('id', 'name', 'url', 'info','price_in', 'price_out', 'price_add'));
    }


    public function totalData()
    {
        return parent::total($this->_tables);
    }

    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}'");
        return parent::delete($this->_tables, $_where);
    }

    public function findOne()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        return parent::select($this->_tables, array('id', 'name', 'url', 'info','price_in', 'price_out', 'price_add'), array('where' => $_where, 'limit' => '1'));
    }

    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this)) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        return parent::update($this->_tables, $_where, $_updateData);
    }

    //ajax
    public function isName()
    {
        $_where = array("name='{$this->_R['name']}'");
        $this->_check->ajax($this, $_where);
    }

    public function findUpdateOrder()
    {
        return parent::select($this->_tables, array('id', 'name', 'url'));
    }


}