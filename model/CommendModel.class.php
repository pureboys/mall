<?php

//评价
class CommendModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'goods_id', 'order_id', 'attr', 'star', 'content', 're_content', 'user', 'date', 'flag');
        $this->_tables = array(DB_PREFIX . 'commend');
        // $this->_check = new BrandCheck();
        list(
            $this->_R['id'],
            $this->_R['goods_id'],
            $this->_R['goodsid'],
            $this->_R['order_id']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_GET['goods_id']) ? $_GET['goods_id'] : null,
            isset($_GET['goodsid']) ? $_GET['goodsid'] : null,
            isset($_GET['order_id']) ? $_GET['order_id'] : null
        ));
    }

    public function addData()
    {
        //  $_where = array("name='{$this->_R['name']}'");
        //  if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['date'] = Tool::getDate();
        $_addData['user'] = $_COOKIE['user'];
        return parent::add($this->_tables, $_addData);
    }


    public function findAll()
    {
        $this->_tables = array(DB_PREFIX . 'commend a', DB_PREFIX . 'goods b');
        $_obj = parent::select($this->_tables, array('a.id', 'a.goods_id', 'a.content', 'a.re_content', 'a.star', 'a.user', 'b.nav', 'b.name'),
            array('where' => array("a.goods_id=b.id"), 'limit' => $this->_limit, 'order' => 'a.date DESC'));
        $this->_tables = array(DB_PREFIX . 'commend');
        return $_obj;
    }


    public function totalData()
    {
        if ($_GET['a'] == 'details') {
            $_where = array("goods_id='{$this->_R['goodsid']}' AND flag=0");
        } else {
            $_where = array();
        }
        return parent::total($this->_tables, $_where);
    }


    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}'");
        return parent::delete($this->_tables, $_where);
    }

    //后台修改查找数据
    public function findUpdateOne()
    {
        $_where = array("id='{$this->_R['id']}'");
        return parent::select($this->_tables, array('star', 'content', 're_content', 'id', 'user', 'attr', 'goods_id', 'flag'), array('where' => $_where, 'limit' => '1'));
    }

    //前台查找是否被评价
    public function findOne()
    {
        $_where = array("goods_id='{$this->_R['goods_id']}' AND order_id='{$this->_R['order_id']}'");
        // if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        return parent::select($this->_tables, array('star', 'content', 're_content'), array('where' => $_where, 'limit' => '1'));
    }


    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        // if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        // if (!$this->_check->updateCheck($this)) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        return parent::update($this->_tables, $_where, $_updateData);
    }


    //购物页面找到评论
    public function findDetailsCommend()
    {
        $_where = array("goods_id='{$this->_R['goodsid']}' AND flag=0");
        return parent::select($this->_tables, array('content', 're_content', 'star', 'date', 'user', 'attr'), array('order' => 'date DESC', 'where' => $_where, 'limit' => $this->_limit));
    }

    //找到我的评论
    public function findMyCommend()
    {
        $this->_tables = array(DB_PREFIX . 'commend a', DB_PREFIX . 'goods b');
        $_where = array("user='{$_COOKIE['user']}' AND a.goods_id=b.id");
        $_obj = parent::select($this->_tables, array('a.goods_id', 'a.content', 'a.re_content', 'a.star', 'a.attr', 'a.date', 'b.nav', 'b.name', 'b.thumbnail2'),
            array('where' => $_where, 'order' => 'a.date DESC'));
        $this->_tables = array(DB_PREFIX . 'commend');
        return $_obj;
    }


} 