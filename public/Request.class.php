<?php

//http请求类
class Request
{
    static private $_instance; //存放实例化对象


    //公共静态方法获取实例化对象
    static public function getInstance()
    {
        if (!(self::$_instance instanceof self)) { // self is TPL类
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    //私有构造方法
    private function __construct()
    {
        Tool::setRequest();
    }

    //私有克隆
    private function __clone()
    {
    }

    //获取新增和修改的字段
    public function filter(Array $_fields)
    {
        $_selectData = array();
        if (Validate::isArray($_POST) && !(Validate::isNullArray($_POST))) {
            foreach ($_POST as $_key => $_value) {
                if (Validate::inArray($_key, $_fields)) $_selectData[$_key] = $_value;
            }
        }
        return $_selectData;
    }


    //获取参数处理,防止注入
    public function getParam(Array $_param)
    {
        $_getParam = array();
        foreach ($_param as $_key => $_value) {
            if ($_key == 'in') $_value = str_replace(',', "','", $_value);
            $_getParam[] = $_value;
        }
        return $_getParam;
    }


} 