<?php

//等级实体类
class LevelModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'level_name');
        $this->_tables = array(DB_PREFIX . 'level');
    }

    public function findAll()
    {
        return parent::select($this->_tables, array('id', 'level_name'));
    }

    public function updateData()
    {
        $this->getRequest(); //获取GET['id']
    }


} 