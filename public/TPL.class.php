<?php

//TPL 继承 smarty 实现单例模式
class TPL extends Smarty
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
        $this->getConfigs();
    }

    //私有克隆
    private function __clone()
    {
    }

    //重写配置文件
    private function getConfigs()
    {
        //模板目录
        $this->template_dir = SMARTY_TEMPLATE_DIR;
        //编译目录
        $this->compile_dir = SMARTY_COMPILE_DIR;
        //配置变量目录
        $this->config_dir = SMARTY_CONFIG_DIR;
        //缓存目录
        $this->cache_dir = SMARTY_CACHE_DIR;
        //是否开启缓存，网站开发调试阶段，我们应该关闭缓存
        $this->caching = SMARTY_CACHING;
        //缓存的声明周期
        $this->cache_lifetime = SMARTY_CACHE_LIFETIME;
        //左定界符
        $this->left_delimiter = SMARTY_LEFT_DELIMITER;
        //右定界符
        $this->right_delimiter = SMARTY_RIGHT_DELIMITER;
    }


}