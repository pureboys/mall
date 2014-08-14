<?php

//收藏类
class CollectModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'goods_id', 'user', 'date');
        $this->_tables = array(DB_PREFIX . 'collect');
        $this->_check = new CollectCheck();
        list(
            $this->_R['id']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null
        ));
    }

    public function addData()
    {
        $_where = array("goods_id='{$this->_R['id']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['goods_id'] = $this->_R['id'];
        $_addData['user'] = $_COOKIE['user'];
        $_addData['date'] = Tool::getDate();
        return parent::add($this->_tables, $_addData);
    }

    public function deleteData()
    {
        $_where = array("goods_id='{$this->_R['id']}'");
        return parent::delete($this->_tables, $_where);
    }


    public function totalData()
    {
        $_where = array("user='{$_COOKIE['user']}'");
        return parent::total($this->_tables, $_where);
    }

    //显示收藏商品
    public function collectGoods()
    {
        $_collectId = parent::select($this->_tables, array('goods_id'), array('where' => array("user='{$_COOKIE['user']}'"), 'order' => 'date DESC'));
        $_collectStr = '';
        if ($_collectId) {
            foreach ($_collectId as $_key => $_value) {
                $_collectStr .= $_value->goods_id . ',';
            }
            $_collectStr = substr($_collectStr, 0, -1);
        }

        //如果没有数据
        if (strlen($_collectStr) == 0) return null;

        $this->_tables = array(DB_PREFIX . 'goods a');
        $_collectGoods = parent::select($this->_tables, array('id', 'name', '(SELECT name FROM mall_brand c WHERE c.id=a.brand) AS brand', 'sn', 'attr', 'weight', 'thumbnail2', 'price_sale', 'price_market', 'nav', 'unit', 'sales', '(SELECT COUNT(*) FROM mall_commend b WHERE flag=0 AND b.goods_id=a.id) AS count'), array('where' => array("id in ($_collectStr)"), 'limit' => $this->_limit));
        $this->_tables = array(DB_PREFIX . 'collect');

        return $_collectGoods;
    }

    /*
    public function findAll()
    {
        return parent::select($this->_tables, array('id', 'name', 'url', 'info'), array('order' => 'reg_time DESC', 'limit' => $this->_limit));
    }
    */

} 