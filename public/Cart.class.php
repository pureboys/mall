<?php

//购物车
class Cart
{
    public function addProduct()
    {
        return setcookie('cart[' . $_POST['id'] . ']', serialize(array(
            'id' => $_POST['id'],
            'nav' => $_POST['nav'],
            'name' => $_POST['name'],
            'attr' => $_POST['attr'],
            'num' => $_POST['num'],
            'sn' => $_POST['sn'],
            'weight' => $_POST['weight'],
            'thumbnail2' => $_POST['thumbnail2'],
            'price_sale' => $_POST['price_sale']
        )), time() + 60 * 60 * 24 * 7);
    }

    public function getProduct()
    {
        $_cartArr = array();
        if (isset($_COOKIE['cart'])) {
            foreach ($_COOKIE['cart'] as $_key => $_value) {
                $_cartArr[$_key] = unserialize(stripslashes($_value));
            }
        }
        return $_cartArr;
    }

    public function delProduct()
    {
        if (isset($_COOKIE['cart'][$_GET['id']])) {
            return setcookie('cart[' . $_GET['id'] . ']', '', time() - 60 * 60 * 24 * 7);
        }
    }

    public function clearProduct()
    {
        if (isset($_COOKIE['cart'])) {
            foreach ($_COOKIE['cart'] as $_key => $_value) {
                setcookie('cart[' . $_key . ']', '', time() - 60 * 60 * 24 * 7);
            }
        }
        return true;
    }


    public function changeNum()
    {
        $_cartArr = array();
        if (isset($_COOKIE['cart'][$_POST['id']])) {
            $_cartArr = unserialize(stripslashes($_COOKIE['cart'][$_POST['id']]));
        }
        $_cartArr['num'] = $_POST['num'];
        return setcookie('cart[' . $_POST['id'] . ']', serialize($_cartArr), time() + 60 * 60 * 24 * 7);
    }


} 