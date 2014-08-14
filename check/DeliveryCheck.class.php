<?php

//物流
class DeliveryCheck extends Check
{
    public function addCheck(Model &$_model, Array $_param)
    {
        if (self::isNullString($_POST['name'])) {
            $this->_message[] = '快递名称不得为空';
            $this->_flag = false;
        }
        if (self::checkStrLength($_POST['name'], 2, 'min')) {
            $this->_message[] = '快递名称不得小于2位';
            $this->_flag = false;
        }
        if (self::checkStrLength($_POST['name'], 20, 'max')) {
            $this->_message[] = '快递名称不得大于20位';
            $this->_flag = false;
        }
        if (self::checkStrLength($_POST['url'], 200, 'max')) {
            $this->_message[] = '官方地址不得大于200位';
            $this->_flag = false;
        }
        if (self::checkStrLength($_POST['info'], 200, 'max')) {
            $this->_message[] = '快递简介不得大于200位';
            $this->_flag = false;
        }
        if ($_model->isOneData($_param)) {
            $this->_message[] = '快递名称被占用';
            $this->_flag = false;
        }
        return $this->_flag;
    }


    public function updateCheck(Model &$_model)
    {
        if (self::checkStrLength($_POST['url'], 200, 'max')) {
            $this->_message[] = '官方地址不得大于200位';
            $this->_flag = false;
        }
        if (self::checkStrLength($_POST['info'], 200, 'max')) {
            $this->_message[] = '快递简介不得大于200位';
            $this->_flag = false;
        }
        return $this->_flag;
    }


    public function ajax(Model &$_model, Array $_param)
    {
        echo $_model->isOneData($_param) ? 1 : 2;
    }


}