<?php

//二级树形结构
class Tree
{
    static private $_instance; //存放实例化对象

    //公共静态方法获取实例化对象
    static public function getInstance()
    {
        if (!(self::$_instance instanceof self)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    //私有构造方法
    private function __construct()
    {
    }

    //私有克隆
    private function __clone()
    {
    }

    //得到二级树形结构
    //所有数据遵循以下格式：1.索引必须是id如果不是可以使用别名 2主类和子类的区分用的字段：sid 如果不是可以用别名 3.类别名称必须使用name 如果不是也可使用别名
    public function getTree(Array $_all, $_id)
    {
        $_mainNav = $_childNav = $_resultNav = array();
        foreach ($_all as $_key => $_value) { //筛选出当前数据
            $_value->sid == 0 ? $_mainNav[] = $_value : $_childNav[] = $_value;
            if ($_value->id == $_id) {
                if (isset($_resultNav[0]->child)) {
                    $_tmp = $_resultNav[0]->child;
                    $_resultNav[0] = $_value;
                    $_resultNav[0]->sait[$_resultNav[0]->id] = $_resultNav[0]->name;
                    $_resultNav[0]->child = $_tmp;
                } else {
                    $_resultNav[0] = $_value;
                    $_resultNav[0]->sait[$_resultNav[0]->id] = $_resultNav[0]->name;
                }
            }
            if ($_value->sid == $_id) $_resultNav[0]->child[] = $_value; //寻找下面的子类
        }

        if ($_resultNav[0]->sid != 0) { // 点击到子类栏目
            foreach ($_mainNav as $_key => $_value) {
                if ($_resultNav[0]->sid == $_value->id) { //找到主类
                    $_child = $_resultNav;
                    $_resultNav[0] = $_value;
                    $_resultNav[0]->sait[$_resultNav[0]->id] = $_resultNav[0]->name;
                    $_resultNav[0]->sait[$_child[0]->id] = $_child[0]->name;
                }
            }
            foreach ($_childNav as $_key => $_value) {
                if ($_resultNav[0]->id == $_value->sid) { //通过主类找子类
                    $_resultNav[0]->child[] = $_value;
                }
            }
        }
        return $_resultNav; //主类附加上子类的数据
    }


} 