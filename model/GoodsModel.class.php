<?php

//商品实体类
class GoodsModel extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_fields = array('id', 'nav', 'brand', 'name', 'sn', 'attr', 'price_sale', 'price_market', 'price_cost', 'keyword', 'unit', 'weight', 'thumbnail', 'content', 'is_up', 'is_freight', 'inventory', 'warn_inventory', 'date', 'service', 'sales');
        $this->_tables = array(DB_PREFIX . 'goods');
        $this->_check = new GoodsCheck();
        list(
            $this->_R['id'],
            $this->_R['navid'],
            $this->_R['goodsid'],
            $this->_R['sn'],
            $this->_R['act'],
            $this->_R['price'],
            $this->_R['brand'],
            $this->_R['attr']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_GET['navid']) ? $_GET['navid'] : null,
            isset($_GET['goodsid']) ? $_GET['goodsid'] : null,
            isset($_POST['sn']) ? $_POST['sn'] : null,
            isset($_GET['act']) ? $_GET['act'] : null,
            isset($_GET['price']) ? $_GET['price'] : null,
            isset($_GET['brand']) ? $_GET['brand'] : null,
            isset($_GET['attr']) ? $_GET['attr'] : null
        ));
    }

    private function getNavId()
    {
        $this->_tables = array(DB_PREFIX . 'nav');
        $_idArr = parent::select($this->_tables, array('id'), array('where' => array("sid='{$this->_R['navid']}'")));
        $_id = '';
        if (Validate::isNullArray($_idArr)) {
            $_id = $this->_R['navid'];
        } else {
            foreach ($_idArr as $_key => $_value) {
                $_id .= $_value->id . ',';
            }
            $_id = substr($_id, 0, -1);
        }
        $this->_tables = array(DB_PREFIX . 'goods');
        return $_id;
    }


    public function findAll()
    {
        $this->_tables = array(DB_PREFIX . 'goods a', DB_PREFIX . 'nav b');
        $_allGoods = parent::select($this->_tables, array('a.id', 'a.name', 'a.brand', 'a.sn', 'a.price_sale', 'a.is_up', 'a.inventory', 'b.name as nav_name'),
            array('where' => array("a.nav=b.id"), 'limit' => $this->_limit, 'order' => 'a.date DESC'));
        $this->_tables = array(DB_PREFIX . 'brand');
        $_allBrand = Tool::setFormItem(parent::select($this->_tables, array('id', 'name')), 'id', 'name');
        foreach ($_allGoods as $_key => $_value) {
            if ($_value->brand == 0) {
                $_value->brand = '其他品牌';
            } else {
                $_value->brand = $_allBrand[$_value->brand];
            }
        }
        $this->_tables = array(DB_PREFIX . 'goods');
        return $_allGoods;
    }

    public function findListGoods()
    {
        $_priceSQL = '';
        $_brandSQL = '';
        $_attrSQL = '';
        if ($this->_R['price']) {
            $_left = substr($this->_R['price'], 0, strpos($this->_R['price'], ','));
            $_right = substr($this->_R['price'], strpos($this->_R['price'], ',') + 1);
            $_priceSQL = "AND price_sale BETWEEN $_left AND $_right";
        }
        if ($this->_R['brand']) {
            $_brand = $this->_R['brand'] == 'other' ? 0 : $this->_R['brand'];
            $_brandSQL = "AND brand='$_brand'";
        }
        if ($this->_R['attr']) {
            $_attr = explode(':', $this->_R['attr']);
            $_attrSQL = "AND attr LIKE '%$_attr[0]%$_attr[1]%'";
        }

        $_id = $this->getNavId();
        $this->_tables = array(DB_PREFIX . 'goods a');
        $_allGoods = parent::select($this->_tables, array('id', 'name', 'thumbnail', 'thumbnail2', 'price_sale', 'price_market', 'nav', 'unit', 'sales', '(SELECT COUNT(*) FROM mall_commend b WHERE flag=0 AND b.goods_id=a.id) AS count'), array('where' => array("nav in ($_id) AND is_up=1 $_priceSQL $_brandSQL $_attrSQL"), 'order' => 'date DESC', 'limit' => $this->_limit));
        $this->_tables = array(DB_PREFIX . 'goods');

        foreach ($_allGoods as $_key => $_value) {
            if (Validate::isNullString($_value->thumbnail2)) {
                $_value->thumbnail = Validate::isNullString($_value->thumbnail) ? '/view/default/images/none.jpg' : $_value->thumbnail;
                $_img = new Image($_value->thumbnail);
                $_img->thumb(220, 220);
                $_img->out('220_220');
                $_value->thumbnail2 = $_img->getPath('220_220');
                parent::update($this->_tables, array("id='$_value->id'"), array('thumbnail2' => $_value->thumbnail2));
            }
        }

        return $_allGoods;
    }

    public function isDetailsGoods()
    {
        $_where = array("id='{$this->_R['goodsid']}' AND nav='{$this->_R['navid']}'");
        $_obj = parent::select($this->_tables, array('id'), array('where' => $_where));
        return !Validate::isNullArray($_obj);
    }


    public function findDetailsGoods()
    {
        $_oneGoods = parent::select($this->_tables, array('id', 'nav', 'name', 'thumbnail', 'thumbnail2', 'sn', 'price_sale', 'price_market', 'unit', 'weight', 'content', 'is_freight', 'inventory', 'brand', 'attr', 'service', 'is_up', 'sales'), array('where' => array("id='{$this->_R['goodsid']}'")));
        $_oneGoods[0]->content = htmlspecialchars_decode($_oneGoods[0]->content);
        $this->_tables = array(DB_PREFIX . 'brand');
        $_allBrand = Tool::setFormItem(parent::select($this->_tables, array('id', 'name')), 'id', 'name');
        if ($_oneGoods[0]->brand == 0) {
            $_oneGoods[0]->brandname = '其他品牌';
        } else {
            $_oneGoods[0]->brandname = $_allBrand[$_oneGoods[0]->brand];
        }
        //获取售后部分
        $this->_tables = array(DB_PREFIX . 'service');
        if ($_oneGoods[0]->service) {
            $_where = array("id='{$_oneGoods[0]->service}'");
            $_service = parent::select($this->_tables, array('content'), array('where' => $_where));
            $_oneGoods[0]->service = htmlspecialchars_decode($_service[0]->content);
        }
        $this->_tables = array(DB_PREFIX . 'goods');

        //写入浏览过的cookie

        if (isset($_COOKIE['record'][$_oneGoods[0]->id])) {
            setcookie('record[' . $_oneGoods[0]->id . ']', '', time() - 60 * 60 * 24 * 7);
        }

        setcookie('record[' . $_oneGoods[0]->id . ']', serialize(array(
            'id' => $_oneGoods[0]->id,
            'nav' => $_oneGoods[0]->nav,
            'name' => $_oneGoods[0]->name,
            'thumbnail2' => $_oneGoods[0]->thumbnail2,
            'price' => $_oneGoods[0]->price_sale
        )), time() + 60 * 60 * 24 * 7);

        //限制cookie个数来限定浏览记录
        if (isset($_COOKIE['record'])) {
            if (count($_COOKIE['record']) > 3) {
                $_keys = array_keys($_COOKIE['record']);
                setcookie('record[' . $_keys[0] . ']', '', time() - 60 * 60 * 24 * 7);
            }
        }

        return $_oneGoods;
    }


    public function totalData()
    {
        if (Validate::isNullArray($this->_R['navid'])) {
            return parent::total($this->_tables);
        } else {
            $_id = $this->getNavId();
            return parent::total($this->_tables, array('where' => array("nav in ($_id)")));
        }
    }

    public function findOne()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        return parent::select($this->_tables, array('id', 'name', 'sn', 'attr', 'price_sale', 'price_market', 'price_cost', 'keyword', 'unit', 'weight', 'thumbnail', 'content', 'is_up', 'is_freight', 'inventory', 'warn_inventory', 'nav', 'brand', 'service'), array('where' => $_where, 'limit' => '1'));
    }


    public function addData()
    {
        $_where = array("sn='{$this->_R['sn']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['date'] = Tool::getDate();
        if (isset($_addData['attr'])) {
            $_attr = '';
            foreach ($_addData['attr'] as $_key => $_value) {
                $_attr .= $_key . ':';
                foreach ($_value as $_v) {
                    $_attr .= $_v . '|';
                }
                $_attr = substr($_attr, 0, -1) . ';';
            }
            $_attr = substr($_attr, 0, -1);
            $_addData['attr'] = $_attr;
        }
        return parent::add($this->_tables, $_addData);
    }

    public function updateData()
    {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this, array("sn='{$this->_R['sn']}'", "id<>'{$this->_R['id']}'"))) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields); //获取POST更新数据
        $_updateData['thumbnail2'] = '';
        if (isset($_updateData['attr'])) {
            $_attr = '';
            foreach ($_updateData['attr'] as $_key => $_value) {
                $_attr .= $_key . ':';
                foreach ($_value as $_v) {
                    $_attr .= $_v . '|';
                }
                $_attr = substr($_attr, 0, -1) . ';';
            }
            $_attr = substr($_attr, 0, -1);
            $_updateData['attr'] = $_attr;
        } else {
            $_updateData['attr'] = '';
        }
        return parent::update($this->_tables, $_where, $_updateData);
    }

    public function deleteData()
    {
        $_where = array("id='{$this->_R['id']}'");
        return parent::delete($this->_tables, $_where);
    }


    public function isSn()
    {
        $_where = array("sn='{$this->_R['sn']}'");
        $this->_check->ajax($this, $_where);
    }

    public function isUpdateSn()
    {
        $_where = array("sn='{$this->_R['sn']}'", "id<>'{$this->_R['id']}'");
        $this->_check->ajax($this, $_where);
    }

    //上下架
    public function isUp()
    {
        $_return = '';
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if ($this->_R['act'] == 'up') {
            $_return = parent::update($this->_tables, array("id='{$this->_R['id']}'"), array('is_up' => '1'));
        } else if ($this->_R['act'] == 'down') {
            $_return = parent::update($this->_tables, array("id='{$this->_R['id']}'"), array('is_up' => '0'));
        }
        return $_return;
    }

    //购买超量
    public function isFlow()
    {
        $_goods = array();
        if (isset($_COOKIE['cart'])) {
            foreach ($_COOKIE['cart'] as $_key => $_value) {
                $_temp = unserialize(stripslashes($_value));
                $_goods[$_key] = new stdClass();
                $_goods[$_key]->name = $_temp['name'];
                $_goods[$_key]->num = $_temp['num'];
            }
        }
        $_flag = false;
        foreach ($_goods as $_key => $_value) {
            $_where = array("id='{$_key}' AND inventory<{$_value->num}");
            if ($_obj = parent::select($this->_tables, array('id', 'inventory'), array('where' => $_where, 'limit' => '1'))) {
                $this->_check->setMessage("您购买的" . $_value->name . "产品超过库存，您的购买量为" . $_value->num . ',库存量为' . $_obj[0]->inventory);
                $_flag = true;
            }
        }
        if ($_flag) {
            $this->_check->error();
        }
        return true;
    }

    //设置减少库存 增加销量
    public function setInventory()
    {
        $_goods = array();
        foreach ($_COOKIE['cart'] as $_key => $_value) {
            $_temp = unserialize(stripslashes($_value));
            $_goods[$_key] = new stdClass();
            $_goods[$_key]->num = $_temp['num'];
        }
        foreach ($_goods as $_key => $_value) {
            $_where = array("id='{$_key}'");
            parent::update($this->_tables, $_where, array('inventory' => array('inventory-' . $_value->num), 'sales' => array('sales+' . $_value->num)));
        }
    }

    //获取最近浏览记录
    public function getRecord()
    {
        $_recordArr = array();
        if (isset($_COOKIE['record'])) {
            foreach ($_COOKIE['record'] as $_key => $_value) {
                $_recordArr[$_key] = unserialize(stripslashes($_value));
            }
        }
        return array_reverse($_recordArr);
    }

    //清空浏览记录
    public function delRecord()
    {
        if (isset($_COOKIE['record'])) {
            foreach ($_COOKIE['record'] as $_key => $_value) {
                setcookie('record[' . $_key . ']', '', time() - 60 * 60 * 24 * 7);
            }
        }
        return true;
    }

    //设置商品的对比
    public function setCompare()
    {
        if (isset($_COOKIE['compare'])) {
            if ($this->_R['navid'] == current($_COOKIE['compare'])) {  //current() 获取数组第1位的值 判断是不是同一类别
                if (count($_COOKIE['compare']) < 3)
                    setcookie('compare[' . $this->_R['goodsid'] . ']', $this->_R['navid'], time() + 60 * 60 * 24 * 7);
            } else {
                $this->_check->setMessage('不同类别商品无法进行添加对比');
                $this->_check->error();
            }
        } else {
            setcookie('compare[' . $this->_R['goodsid'] . ']', $this->_R['navid'], time() + 60 * 60 * 24 * 7);
        }
        return true;
    }

    //获取商品对比
    public function getCompare()
    {
        if (isset($_COOKIE['compare'])) {
            $_compareArr = array_keys($_COOKIE['compare']);
            $_compareStr = implode(',', $_compareArr);

            $this->_tables = array(DB_PREFIX . 'goods a');
            $_compareGoods = parent::select($this->_tables, array('id', 'name', '(SELECT name FROM mall_brand c WHERE c.id=a.brand) AS brand', 'sn', 'attr', 'weight', 'thumbnail2', 'price_sale', 'price_market', 'nav', 'unit', 'sales', '(SELECT COUNT(*) FROM mall_commend b WHERE flag=0 AND b.goods_id=a.id) AS count'), array('where' => array("id in ($_compareStr)"))); //通过id 找到相对应的商品 但是排序是乱序 需要按照添加对比的顺序进行排序
            $this->_tables = array(DB_PREFIX . 'goods');

            foreach ($_compareArr as $_key => $_value) { //按照添加的顺序 进行重新排列
                foreach ($_compareGoods as $_k => $_v) {
                    if ($_value == $_v->id) {
                        $_compareArr[$_key] = $_compareGoods[$_k];
                    }
                }
            }

            return $_compareArr;
        }
    }


    //删除对比商品
    public function delCompare()
    {
        if (isset($_COOKIE['compare'])) {
            setcookie('compare[' . $this->_R['goodsid'] . ']', '', time() - 60 * 60 * 24 * 7);
        }
        return true;
    }

    //清空对比商品
    public function clearCompare()
    {
        if (isset($_COOKIE['compare'])) {
            foreach ($_COOKIE['compare'] as $_key => $_value) {
                setcookie('compare[' . $_key . ']', '', time() - 60 * 60 * 24 * 7);
            }
        }
        return true;
    }


    //左侧排序
    public function navSort()
    {
        $_id = $this->getNavId();
        $_where = array("nav in ($_id) AND is_up=1");
        $_sortGoods = parent::select($this->_tables, array('id', 'nav', 'name', 'thumbnail2', 'price_sale'), array('where' => $_where, 'limit' => '0,5', 'order' => 'sales DESC'));
        return $_sortGoods;
    }

    //首页填充
    public function salesGoods()
    {
        $this->_tables = array(DB_PREFIX . 'goods a');
        $_where = array("is_up=1");
        $_salesGoods = parent::select($this->_tables, array('id', 'nav', 'name', 'thumbnail2', 'price_sale', 'price_market', 'sales', '(SELECT COUNT(*) FROM mall_commend b WHERE flag=0 AND b.goods_id=a.id) AS count'), array('where' => $_where, 'limit' => '0,5', 'order' => 'sales DESC'));
        $this->_tables = array(DB_PREFIX . 'goods');
        return $_salesGoods;
    }

    //后台统计下架商品
    public function downGoodsCount()
    {
        $_where = array("is_up=0");
        $_downGoodsCount = parent::select($this->_tables, array('COUNT(*) AS count'), array('where' => $_where));
        return $_downGoodsCount[0]->count;
    }

    //后台统计商品
    public function allGoodsCount()
    {
        $_allGoodsCount = parent::select($this->_tables, array('COUNT(*) AS count'));
        return $_allGoodsCount[0]->count;
    }

    //后台库存告急
    public function inventoryGoodsCount()
    {
        $_where = array("inventory<=warn_inventory");
        $_inventoryGoodsCount = parent::select($this->_tables, array('COUNT(*) AS count'), array('where' => $_where));
        return $_inventoryGoodsCount[0]->count;
    }

    //判断是否冗余，用于图片编辑器
    public function fileGoods($_file)
    {
        foreach ($_file as $_key => $_value) {
            $_goods = parent::select($this->_tables, array('id', 'nav', 'name'), array(
                'where' => array(
                    "thumbnail='/uploads/{$_GET['file']}/$_value' OR thumbnail2='/uploads/{$_GET['file']}/$_value'
                    OR content LIKE '%/uploads/{$_GET['file']}/$_value%'"
                )));
            if (!Validate::isNullArray($_goods)) {
                $_goods[0]->pic = $_value;
                $_file[$_key] = $_goods[0];
            }
        }
        return $_file;
    }


}