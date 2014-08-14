<?php

//售后服务
class ServiceModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'name', 'content', 'date', 'first');
        $this->_tables = array(DB_PREFIX . 'service');
        $this->_check = new ServiceCheck();
        list(
            $this->_R['id'],
            $this->_R['name'],
            $this->_R['first']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_POST['name']) ? $_POST['name'] : null,
            isset($_POST['first']) ? $_POST['first'] : null
        ));
    }

    public function addData()
    {
        $_where = array("name='{$this->_R['name']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        if ($this->_R['first'] == 1) {
            $_where2 = array("first=1");
            $_updateData['first'] = 0;
            parent::update($this->_tables, $_where2, $_updateData);
        }
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['date'] = Tool::getDate();
        return parent::add($this->_tables, $_addData);
    }

    public function findAll()
    {
        return parent::select($this->_tables, array('id', 'name', 'content', 'first'), array('order' => 'date DESC', 'limit' => $this->_limit));
    }

    public function totalData()
    {
        return parent::total($this->_tables);
    }

    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}'");
        $_service = parent::select($this->_tables, array('id', 'first'), array('where' => $_where, 'limit' => '1'));
        if ($_service[0]->first == 1) {
            return 0;
        } else {
            return parent::delete($this->_tables, $_where);
        }
    }

    public function findOne()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        return parent::select($this->_tables, array('id', 'name', 'content', 'first'), array('where' => $_where, 'limit' => '1'));
    }

    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if ($this->_R['first'] == 1) {
            $_where2 = array("first=1");
            $_updateData['first'] = 0;
            parent::update($this->_tables, $_where2, $_updateData);
        }
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        return parent::update($this->_tables, $_where, $_updateData);
    }


    public function first()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();

        $_where = array("first=1");
        $_updateData['first'] = 0;
        parent::update($this->_tables, $_where, $_updateData);

        $_where = array("id='{$this->_R['id']}'");
        $_updateData['first'] = 1;
        return parent::update($this->_tables, $_where, $_updateData);
    }

    public function findAddGoodsService()
    {
        $_allService = parent::select($this->_tables, array('id', 'name'));
        return Tool::setFormItem($_allService, 'id', 'name');
    }


    public function findAddGoodsServiceSelected()
    {
        $_where = array("first=1");
        $_OneService = parent::select($this->_tables, array('id', 'first'),array('where'=>$_where));
        return $_OneService;
    }


    //ajax
    public function isName()
    {
        $_where = array("name='{$this->_R['name']}'");
        $this->_check->ajax($this, $_where);
    }


} 