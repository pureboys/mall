<?php

//模版编辑器
class EditAction extends Action
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->_tpl->display(SMARTY_ADMIN . 'edit/show.tpl');
    }

    //进入目录
    public function dir()
    {
        if (isset($_GET['dir'])) {
            $_dirPath = opendir(dirname(dirname(__FILE__)) . '/view/' . $_GET['dir'] . '/');
            $_dirArr = array();
            while ($_dirName = readdir($_dirPath)) {
                if ($_dirName != '.' && $_dirName != '..' && $_dirName != 'images')
                    $_dirArr[] = $_dirName;
            }
            $this->_tpl->assign('DirArr', $_dirArr);
            $this->_tpl->display(SMARTY_ADMIN . 'edit/dir.tpl');
        }
    }

    //进入文件
    public function file()
    {
        if (isset($_GET['file'])) {
            $_file = scandir(dirname(dirname(__FILE__)) . '/view/' . $_GET['dir'] . '/' . $_GET['file'] . '/');
            $this->_tpl->assign('File', $_file);
            $this->_tpl->display(SMARTY_ADMIN . 'edit/file.tpl');
        }
    }

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

    //删除文件
    public function delete()
    {
        if (isset($_GET['dir']) && isset($_GET['file']) && isset($_GET['name'])) {
            unlink(dirname(dirname(__FILE__)) . '/view/' . $_GET['dir'] . '/' . $_GET['file'] . '/' . $_GET['name']);
            $this->_redirect->success('?a=edit&m=file&dir=' . $_GET['dir'] . '&file=' . $_GET['file'], '文件删除成功！');
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


}