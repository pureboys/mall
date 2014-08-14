<?php

//数据库操作类 封装DB,DB不能直接使用 防止污染
class DB
{
    private $_pdo; //pdo对象
    static private $_instance; //存放实例化对象

    //公共静态方法获取实例化对象
    static protected function getInstance()
    {
        if (!(self::$_instance instanceof self)) { // self is TPL类
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    //私有构造方法
    private function __construct()
    {
        try {
            $this->_pdo = new PDO(DB_DNS, DB_USER, DB_PASS, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . DB_CHARSET));
            $this->_pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            exit($e->getMessage());
        }
    }

    //私有克隆
    private function __clone()
    {
    }


    //总记录
    protected function total($_tables, Array $_param = array())
    {
        $_where = '';
        if (!Validate::isNullArray($_param)) {
            if (isset($_param['where'])) $_where = $this->setWhere($_param['where']);
        }
        $_sql = "SELECT COUNT(*) AS count FROM $_tables[0] $_where";
        $_stmt = $this->execute($_sql);
        return $_stmt->fetchObject()->count;
    }

    //查询
    protected function select($_tables, Array $_field, Array $_param = array())
    {
        $_where = $_order = $_limit = $_like = '';
        if (Validate::isArray($_param) && !Validate::isNullArray($_param)) {
            $_where = isset($_param['where']) ? $this->setWhere($_param['where']) : '';
            $_like = isset($_param['like']) ? $this->setLike($_param['like']) : '';
            $_order = isset($_param['order']) ? 'ORDER BY ' . $_param['order'] : '';
            $_limit = isset($_param['limit']) ? 'LIMIT ' . $_param['limit'] : '';
        }
        $_selectFields = implode(',', $_field);
        $_table = isset($_tables[1]) ? $_tables[0] . ',' . $_tables[1] : $_tables[0];
        $_sql = "SELECT $_selectFields FROM $_table $_where $_like $_order $_limit";
        $_stmt = $this->execute($_sql);
        $_result = array();
        while ($_objs = $_stmt->fetchObject()) {
            $_result[] = $_objs;
        }
        return Tool::setHtmlString($_result);
    }

    //新增
    protected function add($_tables, Array $_addData)
    {
        $_addFields = array();
        $_addValues = array();
        foreach ($_addData as $_key => $_value) {
            $_addFields[] = $_key;
            $_addValues[] = $_value;
        }
        $_addFields = implode(',', $_addFields);
        $_addValues = implode("','", $_addValues);
        $_sql = "INSERT INTO $_tables[0] ($_addFields) VALUES ('$_addValues')";
        return $this->execute($_sql)->rowCount();
    }

    //更新
    protected function update($_tables, Array $_param, Array $_updateData)
    {
        $_where = $this->setWhere($_param);
        $_set = $this->setSet($_updateData);
        $_sql = "UPDATE $_tables[0] $_set $_where";
        return $this->execute($_sql)->rowCount();
    }


    //删除
    protected function delete($_tables, Array $_param)
    {
        $_where = $this->setWhere($_param);
        $_sql = "DELETE FROM $_tables[0] $_where LIMIT 1";
        return $this->execute($_sql)->rowCount();
    }

    //验证一条数据
    protected function isOne($_tables, Array $_param)
    {
        $_where = $this->setWhere($_param);
        $_sql = "SELECT id FROM $_tables[0] $_where LIMIT 1";
        return $this->execute($_sql)->rowCount();
    }

    //执行sql
    private function execute($_sql)
    {
        try {
            $_stmt = $this->_pdo->prepare($_sql);
            $_stmt->execute();
        } catch (PDOException $e) {
            exit('SQL:' . $_sql . '<br />错误信息:' . $e->getMessage());
        }
        return $_stmt;
    }

    //构成where条件
    private function setWhere(Array $_param)
    {
        $_where = '';
        foreach ($_param as $_key => $_value) {
            $_where .= $_value . ' AND ';
        }
        $_where = 'WHERE ' . substr($_where, 0, -4);
        return $_where;
    }

    //构成set条件
    private function setSet($_setArray)
    {
        $_setData = '';
        foreach ($_setArray as $_key => $_value) {
            if (Validate::isArray($_value)) {
                $_setData .= $_key . '=' . "$_value[0],";
            } else {
                $_setData .= $_key . '=' . "'$_value',";
            }
        }
        $_set = 'SET ' . substr($_setData, 0, -1);
        return $_set;
    }

    //构成like
    private function setLike(Array $_param)
    {
        $_like = '';
        foreach ($_param as $_key => $_value) {
            $_like = "WHERE $_key LIKE '%$_value%'";
        }
        return $_like;
    }


    //得到下一个ID
    protected function nextID($_tables)
    {
        $_sql = "SHOW TABLE STATUS LIKE '$_tables[0]'";
        $_stmt = $this->execute($_sql);
        return $_stmt->fetchObject()->Auto_increment;
    }


}