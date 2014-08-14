<?php

//成交记录
class RecordModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'name', 'user', 'attr', 'num', 'date', 'price', 'goods_id');
        $this->_tables = array(DB_PREFIX . 'record');
        //$this->_check = new BrandCheck();
        list(
            $this->_R['id'],
            $this->_R['goodsid']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_GET['goodsid']) ? $_GET['goodsid'] : null
        ));
    }


    public function findDetailsRecord()
    {
        $_where = array("goods_id='{$this->_R['goodsid']}'");
        return parent::select($this->_tables, array('id', 'name', 'user', 'attr', 'date', 'price', 'num'), array('order' => 'date DESC', 'where' => $_where, 'limit' => $this->_limit));
    }

    public function totalData()
    {
        $_where = array("goods_id='{$this->_R['goodsid']}'");
        return parent::total($this->_tables, $_where);
    }

    /*
    public function addData()
    {
        $_where = array("name='{$this->_R['name']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['reg_time'] = Tool::getDate();
        return parent::add($this->_tables, $_addData);
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
        return parent::select($this->_tables, array('id', 'name', 'url', 'info'), array('where' => $_where, 'limit' => '1'));
    }


    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this)) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        return parent::update($this->_tables, $_where, $_updateData);
    }
    */

} 