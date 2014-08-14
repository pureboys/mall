<?php

//品牌管理类
class BrandModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'name', 'url', 'info', 'reg_time');
        $this->_tables = array(DB_PREFIX . 'brand');
        $this->_check = new BrandCheck();
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
        $_addData['reg_time'] = Tool::getDate();
        return parent::add($this->_tables, $_addData);
    }

    public function findAll()
    {
        return parent::select($this->_tables, array('id', 'name', 'url', 'info'), array('order' => 'reg_time DESC', 'limit' => $this->_limit));
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

    public function findNavBrand()
    {
        $_allNavBrand = parent::select($this->_tables, array('id', 'name'));
        return Tool::setFormItem($_allNavBrand, 'id', 'name');
    }

    //ajax 查找品牌
    public function findGoodsBrand()
    {
        $this->_tables = array(DB_PREFIX . 'nav');
        $_oneBrand = parent::select($this->_tables, array('brand'), array('where' => array("id='{$this->_R['id']}'")));
        if (Validate::isNullString($_oneBrand[0]->brand)) {
            return '0:其他品牌';
        }
        $_brandID = unserialize(htmlspecialchars_decode($_oneBrand[0]->brand));
        $_brandID = implode(',', $_brandID);
        $this->_tables = array(DB_PREFIX . 'brand');
        $_brand = parent::select($this->_tables, array('id', 'name'), array('where' => array("id in ($_brandID)")));
        $_brandStr = '';
        foreach ($_brand as $_key => $_value) {
            $_brandStr .= $_value->id . ':' . $_value->name . ':';
        }
        $_brandStr = substr($_brandStr, 0, -1);
        return $_brandStr;
    }


    //ajax
    public function isBrand()
    {
        $_where = array("name='{$this->_R['name']}'");
        $this->_check->ajax($this, $_where);
    }


} 