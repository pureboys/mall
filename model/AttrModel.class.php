<?php

//导航条
class AttrModel extends Model
{
    private $_sid = 0;

    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'name', 'way', 'item', 'nav');
        $this->_tables = array(DB_PREFIX . 'attr');
        $this->_check = new AttrCheck();
        list(
            $this->_R['id'],
            $this->_R['goodsid'],
            $this->_R['name']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_GET['goodsid']) ? $_GET['goodsid'] : null,
            isset($_POST['name']) ? $_POST['name'] : null
        ));
    }

    public function getAttrType()
    {
        $_attrValue = ''; //查找出是单选还是多选
        $this->_tables = array(DB_PREFIX . 'goods');
        $_oneGoods = parent::select($this->_tables, array('attr'), array('where' => array("id='{$this->_R['goodsid']}'")));
        if ($_oneGoods[0]->attr) {
            $_attrTypeArr = explode(';', $_oneGoods[0]->attr);
            $_attrName = '';
            foreach ($_attrTypeArr as $_value) {
                $_pos = mb_strpos($_value, ':', 0, 'utf8');
                $_attrName .= mb_substr($_value, 0, $_pos, 'utf8') . ',';
            }
            $_attrName = substr($_attrName, 0, -1);
            $_attrName = str_replace(',', "','", $_attrName);
            $this->_tables = array(DB_PREFIX . 'attr');
            $_attr = parent::select($this->_tables, array('way'), array('where' => array("name in ('$_attrName')")));
            foreach ($_attr as $_value) {
                $_attrValue .= $_value->way . '|';
            }
            $_attrValue = substr($_attrValue, 0, -1);
        }
        return $_attrValue;
    }


    public function addData()
    {
        $_where = array("name='{$this->_R['name']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        if (isset($_addData['nav'])) $_addData['nav'] = implode(',', $_addData['nav']);
        return parent::add($this->_tables, $_addData);
    }

    public function findAll()
    {
        $_allAttr = parent::select($this->_tables, array('id', 'name', 'item', 'nav'), array('limit' => $this->_limit));
        $this->_tables = array(DB_PREFIX . 'nav');
        $_allNav = parent::select($this->_tables, array('id', 'name'), array('where' => array("sid<>0")));
        $_allNav = Tool::setFormItem($_allNav, 'id', 'name');
        foreach ($_allAttr as $_value) {
            if (!Validate::isNullString($_value->nav)) {
                $_tmp = explode(',', $_value->nav);
                $_value->nav = '';
                foreach ($_tmp as $_v) {
                    $_value->nav .= $_allNav[$_v] . ',';
                }
                $_value->nav = substr($_value->nav, 0, -1);
            }
        }
        return $_allAttr;
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

    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this)) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        $_updateData['nav'] = isset($_updateData['nav']) ? implode(',', $_updateData['nav']) : '';
        return parent::update($this->_tables, $_where, $_updateData);
    }


    public function findOne()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        $_oneAttr = parent::select($this->_tables, array('id', 'name', 'way', 'item', 'nav'), array('where' => $_where, 'limit' => '1'));
        if (isset($_oneAttr[0]->nav)) $_oneAttr[0]->nav = explode(',', $_oneAttr[0]->nav);
        return $_oneAttr;
    }


    public function isName()
    {
        $_where = array("name='{$this->_R['name']}'");
        $this->_check->ajax($this, $_where);
    }

    //ajax 获取找到商品的属性
    public function findGoodsAttr()
    {
        $_allAttr = parent::select($this->_tables, array('name', 'item'), array('like' => array('nav' => $this->_R['id'])));
        $_allAttr = Tool::setFormItem($_allAttr, 'name', 'item');
        $_goodAttr = '';
        foreach ($_allAttr as $_key => $_value) {
            $_goodAttr .= $_key . ':' . $_value . ';';
        }
        $_goodAttr = substr($_goodAttr, 0, -1);
        return $_goodAttr;
    }


}