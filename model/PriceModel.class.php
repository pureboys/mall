<?php

//价格区间
class PriceModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'price_left', 'price_right');
        $this->_tables = array(DB_PREFIX . 'price');
        $this->_check = new PriceCheck();
        list(
            $this->_R['id'],
            $this->_R['price_left'],
            $this->_R['price_right']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_POST['price_left']) ? $_POST['price_left'] : null,
            isset($_POST['price_right']) ? $_POST['price_right'] : null
        ));
    }

    public function findAll()
    {
        return parent::select($this->_tables, array('id', 'price_left', 'price_right'), array('limit' => $this->_limit, 'order' => 'price_left ASC,price_right ASC'));
    }

    public function totalData()
    {
        return parent::total($this->_tables);
    }


    public function addData()
    {
        $_where = array("price_left='{$this->_R['price_left']}' AND price_right='{$this->_R['price_right']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        return parent::add($this->_tables, $_addData);
    }


    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this, array("price_left='{$this->_R['price_left']}' AND price_right='{$this->_R['price_right']}'"))) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        return parent::update($this->_tables, $_where, $_updateData);
    }

    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}'");
        return parent::delete($this->_tables, $_where);
    }


    public function findAllNav()
    {
        $_allPrice = parent::select($this->_tables, array('id', 'price_left', 'price_right'), array('order' => 'price_left ASC,price_right ASC'));
        if ($_allPrice) {
            foreach ($_allPrice as $_value) {
                $_value->value = $_value->price_left . '-' . $_value->price_right;
            }
            $_allPrice = Tool::setFormItem($_allPrice, 'value', 'value');
        }
        return $_allPrice;
    }

    public function findOne()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        $_oneAttr = parent::select($this->_tables, array('id', 'price_left', 'price_right'), array('where' => $_where, 'limit' => '1'));
        return $_oneAttr;
    }

    public function isPrice()
    {
        $_where = array("price_left='{$this->_R['price_left']}' AND price_right='{$this->_R['price_right']}'");
        $this->_check->ajax($this, $_where);
    }


}