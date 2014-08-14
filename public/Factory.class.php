<?php

class Factory
{
    static public function setAction()
    {
        $_a = self::getA();
        if (Validate::inArray($_a, array('manage', 'nav', 'level', 'attr', 'brand', 'commend', 'delivery', 'edit', 'goods', 'order', 'pic', 'price', 'service'))) {
            if (!isset($_SESSION['admin'])) {
                Redirect::getInstance()->success('?a=admin&m=login');
            }
        }
        if (!file_exists(ROOT_PATH . '/controller/' . $_a . 'Action.class.php')) $_a = 'Index';
        $_class = new ReflectionClass(ucfirst($_a) . 'Action'); //使用反射类
        $_instance = $_class->newInstance(); //实例化
        $_m = isset($_GET['m']) ? $_GET['m'] : 'index';
        if (!method_exists($_instance, $_m)) $_m = 'index';
        $_method = $_class->getMethod($_m); // 获取方法
        $_method->invoke($_instance); //实例化方法
    }

    static public function setModel()
    {
        $_a = self::getA();
        if (file_exists(ROOT_PATH . '/model/' . $_a . 'Model.class.php')) {
            $_class = new ReflectionClass(ucfirst($_a) . 'Model'); //使用反射类
            return $_class->newInstance(); //实例化
        }
        return true;
    }


    static public function getA()
    {
        return isset($_GET['a']) && !empty($_GET['a']) ? $_GET['a'] : 'Index'; //获取action
    }


}