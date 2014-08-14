<?php

//专用调用Action
class CallAction extends Action
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->_redirect->success('./');
    }

    //验证码
    public function validateCode()
    {
        $_vc = new ValidateCode();
        $_vc->doimg();
        $_SESSION['code'] = $_vc->getCode();
    }

    //上传产品图片
    public function upFile()
    {
        $this->_tpl->display(SMARTY_ADMIN . 'public/upfile.tpl');
    }

    //处理上传图片
    public function upLoad()
    {
        if (isset($_POST['send'])) {
            $_fileUpload = new FileUpload('pic', $_POST['MAX_FILE_SIZE']);
            $_path = $_fileUpload->getPath();
            $_img = new Image($_path);
            $_img->thumb(300, 300);
            $_img->out();
            $_fileUpload->alertOpenerClose('图片上传成功！', $_path);
        } else {
            exit('警告:文件过大，或者其他未知错误导致浏览器崩溃!');
        }
    }

    //cke编辑器上传
    public function ckeUp()
    {
        if (isset($_GET['type'])) {
            $_fileUpload = new FileUpload('upload', $_POST['MAX_FILE_SIZE']);
            $_ckeFn = $_GET['CKEditorFuncNum'];
            $_path = $_fileUpload->getPath();
            $_img = new Image($_path);
            $_img->ckeImg(650, 0, false);
            $_img->out();
            echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($_ckeFn,\".$_path\",'图片上传成功');</script>";
            exit();
        } else {
            exit('警告：由于非法操作导致上传失败');
        }
    }


}