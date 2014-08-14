<?php

//图像处理类
class Image
{
    private $file; //图片地址
    private $org_file; //图片原始地址
    private $width; //图片宽度
    private $height; //图片高度
    private $type; //图盘类型
    private $img; //原图的资源句柄
    private $new; //新图的资源句柄

    public function __construct($_file)
    {
        $this->org_file = $_file;
        $this->file = ROOT_PATH . $_file;
        list($this->width, $this->height, $this->type) = getimagesize($this->file);
        $this->img = $this->getFromImg($this->file, $this->type);
    }

    //cke专用图像处理
    public function ckeImg($new_width = 0, $new_height = 0, $_flag = TRUE)
    {

        if (empty($new_width) && empty($new_height)) {
            $new_width = $this->width;
            $new_height = $this->height;
        }

        if (!is_numeric($new_width) || !is_numeric($new_height)) {
            $new_width = $this->width;
            $new_height = $this->height;
        }

        //等比例缩放图片
        if ($new_width >= $new_height) {
            if ($this->width > $new_width) { //通过指定宽度，获取等比的高度
                $new_height = ($new_width / $this->width) * $this->height;
            } else {
                $new_width = $this->width;
                $new_height = $this->height;
            }
        } else {
            if ($this->height > $new_height) { //通过指定高度，获取等比的宽度
                $new_width = ($new_height / $this->height) * $this->width;
            } else {
                $new_width = $this->width;
                $new_height = $this->height;
            }
        }

        $this->new = imagecreatetruecolor($new_width, $new_height);
        imagecopyresampled($this->new, $this->img, 0, 0, 0, 0, $new_width, $new_height, $this->width, $this->height);

        //是否添加水印
        if ($_flag) {
            list($_water_width, $_water_height, $_water_type) = getimagesize(MARK);
            $_water = $this->getFromImg(MARK, $_water_type);

            //水印坐标
            $_water_x = $new_width - $_water_width - 5;
            $_water_y = $new_height - $_water_height - 5;
            //添加水印
            if ($new_width > $_water_width && $new_height > $_water_height) { //如果图片大于水印，才给图片加水印
                imagecopy($this->new, $_water, $_water_x, $_water_y, 0, 0, $_water_width, $_water_height);
            }
            imagedestroy($_water);
        }

    }


    //加载图片各种类型,返回图片的资源句柄
    private function getFromImg($_file, $_type)
    {
        switch ($_type) {
            case 1:
                $img = imagecreatefromgif($_file);
                break;
            case 2:
                $img = imagecreatefromjpeg($_file);
                break;
            case 3:
                $img = imagecreatefrompng($_file);
                break;
            default:
                exit('警告：此图片类型，本系统不支持！');
        }
        return $img;
    }

    //缩略图-百分比
    /*
    public function thumb($_per)
    {
        $new_width = $this->width * ($_per / 100);
        $new_height = $this->height * ($_per / 100);
        $this->new = imagecreatetruecolor($new_width,$new_height);
        imagecopyresampled($this->new,$this->img,0,0,0,0,$new_width,$new_height,$this->width,$this->height);
    }
    */

    //缩略图-等比例
    /*
    public function thumb($new_width, $new_height)
    {
        if ($this->width < $this->height) {
            //让新长度和新高度等比例
            $new_width = ($new_height / $this->height) * $this->width;
        } else {
            //让新高度和新长度等比例
            $new_height = ($new_width / $this->width) * $this->height;
        }

        $this->new = imagecreatetruecolor($new_width, $new_height);
        imagecopyresampled($this->new, $this->img, 0, 0, 0, 0, $new_width, $new_height, $this->width, $this->height);
    }
    */

    //缩略图-固定长高容器，图像等比例，扩容填充，裁剪
    public function thumb($new_width = 0, $new_height = 0)
    {
        if (empty($new_width) && empty($new_height)) {
            $new_width = $this->width;
            $new_height = $this->height;
        }

        if (!is_numeric($new_width) || !is_numeric($new_height)) {
            $new_width = $this->width;
            $new_height = $this->height;
        }

        //创建容器
        $_n_w = $new_width;
        $_n_h = $new_height;
        //创建裁剪点
        $_cut_width = 0;
        $_cut_height = 0;

        if ($this->width < $this->height) {
            //让新长度和新高度等比例
            $new_width = ($new_height / $this->height) * $this->width;
        } else {
            //让新高度和新长度等比例
            $new_height = ($new_width / $this->width) * $this->height;
        }

        if ($new_width < $_n_w) { //如果新的宽度小于新容器的宽度
            $r = $_n_w / $new_width; //按照宽度求出等比例因子
            $new_width *= $r; //扩展填充后的宽度
            $new_height *= $r; //扩展填充后的高度
            $_cut_height = ($new_height - $_n_h) / 2; //求出裁剪点的高度
        }
        if ($new_height < $_n_h) { //如果新高度小于容器高度
            $r = $_n_h / $new_height; //按照高度求出等比例因子
            $new_width *= $r; //扩展填充后的宽度
            $new_height *= $r; //扩展填充后的高度
            $_cut_width = ($new_width - $_n_w) / 2; //求出裁剪点的宽度
        }

        $this->new = imagecreatetruecolor($_n_w, $_n_h);
        imagecopyresampled($this->new, $this->img, 0, 0, $_cut_width, $_cut_height, $new_width, $new_height, $this->width, $this->height);
    }

    //图像输出
    public function out($_name = '')
    {
        $this->file = $this->setNewName($_name, $this->file);
        imagepng($this->new, $this->file); // Todo:只生成png
        imagedestroy($this->img);
        imagedestroy($this->new);
    }

    //获取地址
    public function getPath($_name = '')
    {
        return $this->setNewName($_name, $this->org_file);
    }

    //处理生成新图片名字
    private function setNewName($_name, $_file)
    {
        $_start = substr($_file, 0, -strlen(strrchr($_file, '.')));
        $_end = strrchr($_file, '.');
        $_file = $_start . $_name . $_end;
        return $_file;
    }


}