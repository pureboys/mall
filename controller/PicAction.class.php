<?php

//图片编辑器
class PicAction extends Action
{
    private $_goods;

    public function __construct()
    {
        parent::__construct();
        $this->_goods = new GoodsModel();
    }

    public function index()
    {
        $_dirPath = opendir(dirname(dirname(__FILE__)) . '/uploads/');
        $_dirArr = array();
        $_i = 0;
        while ($_dirName = readdir($_dirPath)) {
            if ($_dirName != '.' && $_dirName != '..') {
                $_dirArr[$_i]['name'] = $_dirName;
                $_dirArr[$_i]['count'] = count(scandir(dirname(dirname(__FILE__)) . '/uploads/' . $_dirName)) - 2;
                $_i++;
            }
        }
        $this->_tpl->assign('DirArr', $_dirArr);
        $this->_tpl->display(SMARTY_ADMIN . 'pic/show.tpl');
    }


    //进入文件
    public function file()
    {
        if (isset($_GET['file'])) {
            $_file = scandir(dirname(dirname(__FILE__)) . '/uploads/' . $_GET['file'] . '/');
            $this->_tpl->assign('File',  $this->_goods->fileGoods($_file));
            $this->_tpl->display(SMARTY_ADMIN . 'pic/file.tpl');
        }
    }


    //删除文件
    public function delete()
    {
        if (isset($_GET['file']) && isset($_GET['name'])) {
            unlink(dirname(dirname(__FILE__)) . '/uploads/' . $_GET['file'] . '/' . $_GET['name']);
            $this->_redirect->success('?a=pic&m=file&file=' . $_GET['file'], '文件删除成功！');
        }
    }


    /*

    //新增文件
    public function add()
    {
        if (isset($_POST['send'])) {
            $_path = dirname(dirname(__FILE__)) . '/view/' . $_GET['dir'] . '/' . $_GET['file'] . '/' . $_POST['name'];
            $_fp = fopen($_path, 'wb');
            flock($_fp, LOCK_EX); //加锁防止其他文件篡改
            $_outputString = $_POST['info'];
            fwrite($_fp, $_outputString, strlen($_outputString));
            flock($_fp, LOCK_UN); //解锁
            fclose($_fp);
            $this->_redirect->success('?a=edit&m=file&dir=' . $_GET['dir'] . '&file=' . $_GET['file'], '文件新建成功！');
        }
        if (isset($_GET['dir']) && isset($_GET['file'])) {
            $this->_tpl->display(SMARTY_ADMIN . 'edit/add.tpl');
        }
    }


    //编辑文件
    public function update()
    {
        if (isset($_POST['send'])) {
            $_path = dirname(dirname(__FILE__)) . '/view/' . $_GET['dir'] . '/' . $_GET['file'] . '/' . $_POST['name'];
            $_fp = fopen($_path, 'wb');
            flock($_fp, LOCK_EX); //加锁防止其他文件篡改
            $_outputString = $_POST['info'];
            fwrite($_fp, $_outputString, strlen($_outputString));
            flock($_fp, LOCK_UN); //解锁
            fclose($_fp);
            $this->_redirect->success('?a=edit&m=file&dir=' . $_GET['dir'] . '&file=' . $_GET['file'], '文件修改成功！');
        }
        if (isset($_GET['dir']) && isset($_GET['file']) && isset($_GET['name'])) {
            $_path = dirname(dirname(__FILE__)) . '/view/' . $_GET['dir'] . '/' . $_GET['file'] . '/' . $_GET['name'];
            $_fp = fopen($_path, 'r');
            flock($_fp, LOCK_EX); //加锁防止其他文件篡改
            if (filesize(($_path)) == 0) {
                $this->_tpl->assign('content', '');
            } else {
                $this->_tpl->assign('content', fread($_fp, filesize($_path)));
            }
            flock($_fp, LOCK_UN); //解锁
            fclose($_fp);
            $this->_tpl->display(SMARTY_ADMIN . 'edit/update.tpl');
        }
    }
*/

}