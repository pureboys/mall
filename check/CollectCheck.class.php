<?php

//收藏验证类
class CollectCheck extends Check
{
    public function addCheck(Model &$_model, Array $_param)
    {

        if ($_model->isOneData($_param)) {
            $this->_message[] = '你已经收藏此商品';
            $this->_flag = false;
        }
        return $this->_flag;
    }


}