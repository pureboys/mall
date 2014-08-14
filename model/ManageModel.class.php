<?php

//管理员实体类

class ManageModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'user', 'pass', 'level', 'login_count', 'last_ip', 'last_time', 'reg_time');
        $this->_tables = array(DB_PREFIX . 'manage');
        $this->_check = new ManageCheck();
        list(
            $this->_R['id'],
            $this->_R['user'],
            $this->_R['pass'],
            $this->_R['code']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_POST['user']) ? $_POST['user'] : null,
            isset($_POST['pass']) ? $_POST['pass'] : null,
            isset($_POST['code']) ? $_POST['code'] : null
        ));
    }

    public function findAll()
    {
        $this->_tables = array(DB_PREFIX . 'manage a', DB_PREFIX . 'level b');
        return parent::select($this->_tables, array('a.id', 'a.user', 'a.level', 'a.login_count', 'a.last_ip', 'a.last_time', 'b.level_name'),
            array('where' => array('a.level=b.id'), 'limit' => $this->_limit, 'order' => 'a.reg_time DESC'));
    }

    public function findOne()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        return parent::select($this->_tables, array('id', 'user', 'level'), array('where' => $_where, 'limit' => '1'));
    }

    public function findLogin()
    {
        $this->_tables = array(DB_PREFIX . 'manage a', DB_PREFIX . 'level b');
        return parent::select($this->_tables, array('a.user', 'b.level_name'),
            array('where' => array("a.level=b.id", "a.user='{$this->_R['user']}'"), 'limit' => '1'));
    }

    //统计修改
    public function countLogin()
    {
        $_where = array("user='{$this->_R['user']}'");
        $_updateData['last_ip'] = Tool::getIP();
        $_updateData['last_time'] = Tool::getDate();
        $_updateData['login_count'] = array('login_count+1');
        parent::update($this->_tables, $_where, $_updateData);
    }

    public function totalData()
    {
        return parent::total($this->_tables);
    }

    public function addData()
    {
        $_where = array("user='{$this->_R['user']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['pass'] = sha1($_addData['pass']);
        $_addData['last_ip'] = Tool::getIP();
        $_addData['reg_time'] = Tool::getDate();
        return parent::add($this->_tables, $_addData);
    }

    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this)) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        $_updateData['pass'] = sha1($_updateData['pass']);
        return parent::update($this->_tables, $_where, $_updateData);
    }

    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}'");
        return parent::delete($this->_tables, $_where);
    }

    public function login()
    {
        $_where = array("user='{$this->_R['user']}'", "pass='" . sha1($this->_R['pass']) . "'");
        if (!$this->_check->loginCheck($this, $_where)) {
            $this->_check->error();
        } else {
            return true;
        }
    }

    public function isUser()
    {
        $_where = array("user='{$this->_R['user']}'");
        $this->_check->ajax($this, $_where);
    }

    public function ajaxLogin()
    {
        $_where = array("user='{$this->_R['user']}'", "pass='" . sha1($this->_R['pass']) . "'");
        $this->_check->ajaxLogin($this, $_where);
    }

    public function ajaxCode()
    {
        $this->_check->ajaxCode($this, $this->_R['code']);
    }


} 