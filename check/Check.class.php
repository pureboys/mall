<?php

//验证类
class Check extends Validate
{
    protected $_flag = true; //判断验证是否通过
    protected $_message = array(); //错误消息集合
    private $_tpl; //模板对象

    public function __construct()
    {
        $this->_tpl = TPL::getInstance();
    }

    public function setMessage($_message)
    {
        $this->_message[] = $_message;
    }

    public function oneCheck(Model &$_model, Array $_param)
    {
        if (!$_model->isOneData($_param)) {
            $this->_message[] = '找不到指定的数据';
            $this->_flag = false;
        }
        return $this->_flag;
    }

    //验证数据合法性
    public function error($_url = '')
    {
        if (empty($_url)) {
            $this->_tpl->assign('message', $this->_message);
            $this->_tpl->assign('prev', Tool::getPrevPage());
            $this->_tpl->display(SMARTY_ADMIN . 'public/error.tpl');
            exit;
        } else {
            Redirect::getInstance()->success($_url);
        }
    }


}