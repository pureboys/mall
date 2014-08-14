<?php

class Model extends DB
{
    protected $_db; //db类
    protected $_fields = array(); //字段名
    protected $_tables = array(); //表前缀名
    protected $_check; //验证类
    protected $_limit; //分页limit
    protected $_R = array(); //接收字段

    protected function __construct()
    {
        $this->_db = parent::getInstance();
    }

    protected function getRequest()
    {
        return Request::getInstance($this, $this->_check);
    }

    protected function select($_tables, Array $_field, Array $_param = array())
    {
        return $this->_db->select($_tables, $_field, $_param);
    }

    protected function total($_tables, Array $_param = array())
    {
        return $this->_db->total($_tables, $_param);
    }

    protected function add($_tables, Array $_addData)
    {
        return $this->_db->add($_tables, $_addData);
    }

    protected function update($_tables, Array $_param, Array $_updateData)
    {
        return $this->_db->update($_tables, $_param, $_updateData);
    }

    protected function delete($_tables, Array $_param)
    {
        return $this->_db->delete($_tables, $_param);
    }

    protected function nextID($_tables)
    {
        return $this->_db->nextID($_tables);
    }


    public function setLimit($_limit)
    {
        $this->_limit = $_limit;
    }

    public function isOneData(Array $_param)
    {
        return $this->_db->isOne($this->_tables, $_param);
    }


} 