<?php

//导航条
class NavModel extends Model
{
    private $_sid = 0;

    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'name', 'info', 'sort', 'sid', 'brand', 'price');
        $this->_tables = array(DB_PREFIX . 'nav');
        $this->_check = new NavCheck();
        list(
            $this->_R['sid'],
            $this->_R['id'],
            $this->_R['navid'],
            $this->_R['name']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['sid']) ? $_GET['sid'] : 0,
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_GET['navid']) ? $_GET['navid'] : null,
            isset($_POST['name']) ? $_POST['name'] : null
        ));
    }

    public function findUpdateBrand()
    {
        $_oneBrand = parent::select($this->_tables, array('brand'), array('where' => array("id='{$this->_R['id']}'")));
        return unserialize(htmlspecialchars_decode($_oneBrand[0]->brand));
    }

    public function findUpdatePrice()
    {
        $_onePrice = parent::select($this->_tables, array('price'), array('where' => array("id='{$this->_R['id']}'")));
        return unserialize(htmlspecialchars_decode($_onePrice[0]->price));
    }


    public function findAddGoodsNav()
    {
        $_allNav = parent::select($this->_tables, array('id', 'name', 'sid'), array('order' => 'sort ASC'));
        $_mainNav = $_childNav = array();
        foreach ($_allNav as $_key => $_value) {
            $_value->sid == 0 ? $_mainNav[] = $_value : $_childNav[] = $_value;
        }
        foreach ($_mainNav as $_key => $_value) {
            foreach ($_childNav as $_k => $_v) {
                if ($_value->id == $_v->sid) {
                    $_value->child[$_v->id] = $_v->name;
                }
            }
        }
        return $_mainNav;
    }

    public function findAll()
    {
        $_allNav = parent::select($this->_tables, array('id', 'name', 'info', 'sort', 'brand'),
            array('where' => array("sid={$this->_R['sid']}"), 'limit' => $this->_limit, 'order' => 'sort ASC'));
        $this->_tables = array(DB_PREFIX . 'brand');
        $_allBrand = Tool::setFormItem(parent::select($this->_tables, array('id', 'name')), 'id', 'name');
        foreach ($_allNav as $_key => $_value) {
            if (Validate::isNullString($_value->brand)) {
                $_value->brand = '其他品牌';
            } else {
                $_tempArr = unserialize(htmlspecialchars_decode($_value->brand));
                $_value->brand = '';
                foreach ($_tempArr as $_k => $_v) {
                    $_value->brand .= $_allBrand[$_v] . ',';
                }
                $_value->brand = substr($_value->brand, 0, -1);
            }
        }
        return $_allNav;
    }

    public function findOne()
    {
        if (isset($_GET['sid'])) {
            return parent::select($this->_tables, array('id', 'sid', 'name', 'info'), array('where' => array("id='{$this->_R['sid']}'"), 'limit' => '1'));
        }
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        return parent::select($this->_tables, array('id', 'name', 'info', 'sid'), array('where' => $_where, 'limit' => '1'));
    }

    public function totalData()
    {
        return parent::total($this->_tables, array('where' => array("sid={$this->_R['sid']}")));
    }


    public function addData()
    {
        $_where = array("name='{$this->_R['name']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['sort'] = parent::nextID($this->_tables);
        if (isset($_addData['brand'])) $_addData['brand'] = serialize($_addData['brand']);
        if (isset($_addData['price'])) $_addData['price'] = serialize($_addData['price']);
        return parent::add($this->_tables, $_addData);
    }

    public function updateData()
    {
        $_where = array("id={$this->_R['id']}");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this)) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        $_updateData['brand'] = isset($_updateData['brand']) ? serialize($_updateData['brand']) : '';
        $_updateData['price'] = isset($_updateData['price']) ? serialize($_updateData['price']) : '';
        return parent::update($this->_tables, $_where, $_updateData);
    }

    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}'");
        return parent::delete($this->_tables, $_where);
    }

    public function sortData()
    {
        foreach ($_POST['sort'] as $_key => $_value) {
            if (!is_numeric($_value)) continue;
            $_setField = array('sort' => $_value);
            $_where = array("id='$_key'");
            parent::update($this->_tables, $_where, $_setField);
        }
        return true;
    }


    public function isName()
    {
        $_where = array("name='{$this->_R['name']}'");
        $this->_check->ajax($this, $_where);
    }

    //10条导航信息
    public function findFrontTenNav()
    {
        return parent::select($this->_tables, array('id', 'name'), array('where' => array('sid=0'), 'limit' => '10', 'order' => 'sort ASC'));
    }

    //list页 面包屑
    public function findFrontNav()
    {
        $_where = array("id='{$this->_R['navid']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error('./');
        $_allNav = parent::select($this->_tables, array('id', 'name', 'sid'), array('order' => 'sort ASC'));
        $_obj = Tree::getInstance()->getTree($_allNav, $this->_R['navid']);
        $this->_tables = array(DB_PREFIX . 'goods');
        //加入count
        if (isset($_obj[0]->child)) {
            foreach ($_obj[0]->child as $_key => $_value) {
                $_count = parent::select($this->_tables, array('COUNT(*) as count'), array('where' => array("nav='{$_value->id}' AND is_up=1")));
                $_value->count = $_count[0]->count;
            }
        }
        $this->_tables = array(DB_PREFIX . 'nav');
        return $_obj;
    }

    public function findFrontPrice()
    {
        $_onePrice = parent::select($this->_tables, array('price'), array('where' => array("id='{$this->_R['navid']}'")));
        if ($_onePrice[0]->price) {
            $_onePrice[0]->price = unserialize(htmlspecialchars_decode($_onePrice[0]->price));
            foreach ($_onePrice[0]->price as $_key => $_value) {
                unset($_onePrice[0]->price[$_key]);
                $_key2 = str_replace('-', ',', $_value);
                $_onePrice[0]->price[$_key2] = $_value;
            }
        }

        return $_onePrice;
    }

    public function findFrontBrand()
    {
        $_brandid = '';
        $_oneBrand = array();
        foreach ($this->getNavId() as $_value) {
            $_oneBrand = parent::select($this->_tables, array('brand'), array('where' => array("id='$_value'")));
            if ($_oneBrand[0]->brand) {
                $_brandid .= implode(',', unserialize(htmlspecialchars_decode($_oneBrand[0]->brand))) . ',';
            }
        }
        $_brandid = substr($_brandid, 0, -1);

        if (!$_oneBrand[0]->brand) return array('other' => '其他品牌');
        $this->_tables = array(DB_PREFIX . 'brand');
        $_brand = parent::select($this->_tables, array('id', 'name'), array('where' => array("id in ($_brandid)")));
        $_brand = Tool::setFormItem($_brand, 'id', 'name');
        $this->_tables = array(DB_PREFIX . 'nav');
        return $_brand;
    }

    public function findFrontAttr()
    {
        $_navid = $this->getNavId();
        $this->_tables = array(DB_PREFIX . 'attr');
        $_attr = array();
        foreach ($_navid as $_value) {
            $_oneAttr = parent::select($this->_tables, array('name', 'item'), array('like' => array('nav' => $_value)));
            foreach (Tool::setFormItem($_oneAttr, 'name', 'item') as $_k => $_v) {
                $_attr[$_k] = explode('|', $_v);
            }
        }
        $this->_tables = array(DB_PREFIX . 'nav');
        return $_attr;
    }


    private function getNavId()
    {
        $_idArr = parent::select($this->_tables, array('id'), array('where' => array("sid='{$this->_R['navid']}'")));
        $_id = array();
        if (Validate::isNullArray($_idArr)) {
            $_id[] = $this->_R['navid'];
        } else {
            foreach ($_idArr as $_key => $_value) {
                $_id[] = $_value->id;
            }
        }
        return $_id;
    }


}