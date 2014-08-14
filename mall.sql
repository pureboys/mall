/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost
 Source Database       : mall

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : utf-8

 Date: 08/14/2014 18:36:52 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `mall_address`
-- ----------------------------
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `tel` char(11) DEFAULT NULL,
  `buildings` varchar(100) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL COMMENT '//会员账号',
  `selected` tinyint(1) unsigned DEFAULT '0' COMMENT '//是否首选',
  `flag` tinyint(1) DEFAULT NULL COMMENT '//是否江浙沪',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_address`
-- ----------------------------
BEGIN;
INSERT INTO `mall_address` VALUES ('1', '李狗蛋', 'lgd@163.com', '山东青岛', '255000', '13361599285', '小桥流水', '蜡笔小新', '1', '0'), ('2', '张小宝', 'zxb@163.com', '山东济南', '255000', '13361599286', '泉城公园', '蜡笔小新', '0', '1'), ('3', '路飞', 'lf@163.com', '山东淄博', '255000', '13661585258', '火炬大厦', '路飞', '1', '1'), ('4', '樱桃小丸子', 'ytxwz@sina.com', '山东东营', '255000', '13366685741', '火车站', '樱桃小丸子', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `mall_attr`
-- ----------------------------
DROP TABLE IF EXISTS `mall_attr`;
CREATE TABLE `mall_attr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `way` tinyint(1) unsigned DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `nav` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_attr`
-- ----------------------------
BEGIN;
INSERT INTO `mall_attr` VALUES ('13', '颜色', '0', '白色|红色|黑色', '19,20,21,22'), ('14', '大小', '0', '10|15|20|25', '19,20,21,22');
COMMIT;

-- ----------------------------
--  Table structure for `mall_brand`
-- ----------------------------
DROP TABLE IF EXISTS `mall_brand`;
CREATE TABLE `mall_brand` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_brand`
-- ----------------------------
BEGIN;
INSERT INTO `mall_brand` VALUES ('7', 'Bandai', 'http://www.bandai.co.jp/', 'Bandai', '2014-08-14 17:03:38'), ('8', 'MegaHouse', 'http://www.megahouse.co.jp/', 'MegaHouse', '2014-08-14 17:04:45'), ('9', 'Banpresto ', 'http://www.banpresto.co.jp/', 'Banpresto ', '2014-08-14 17:05:09'), ('10', 'Good Smile ', 'http://www.goodsmile.info/', 'Good Smile', '2014-08-14 17:05:37'), ('11', 'Max Factory', 'http://maxfactory.cms.drecom.jp/', 'Max Factory', '2014-08-14 17:06:08');
COMMIT;

-- ----------------------------
--  Table structure for `mall_collect`
-- ----------------------------
DROP TABLE IF EXISTS `mall_collect`;
CREATE TABLE `mall_collect` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) DEFAULT NULL,
  `user` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_collect`
-- ----------------------------
BEGIN;
INSERT INTO `mall_collect` VALUES ('7', '15', '蜡笔小新', '2014-08-14 18:01:32');
COMMIT;

-- ----------------------------
--  Table structure for `mall_commend`
-- ----------------------------
DROP TABLE IF EXISTS `mall_commend`;
CREATE TABLE `mall_commend` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) DEFAULT NULL COMMENT '商品id',
  `order_id` mediumint(8) DEFAULT NULL COMMENT '订单id',
  `attr` varchar(200) DEFAULT NULL,
  `content` text,
  `re_content` text,
  `star` tinyint(1) DEFAULT '5' COMMENT '//评价 星',
  `user` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0' COMMENT '//屏蔽 0为不屏蔽',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_commend`
-- ----------------------------
BEGIN;
INSERT INTO `mall_commend` VALUES ('6', '15', '23', ' 颜色: 白色 ; 大小: 10 ;', '不错哦～～嘻嘻', null, '5', '路飞', '2014-08-14 18:13:50', '0'), ('7', '18', '22', ' 颜色: 白色 ; 大小: 10 ;', '非常喜欢', null, '5', '蜡笔小新', '2014-08-14 18:14:43', '0'), ('8', '15', '22', ' 颜色: 白色 ; 大小: 10 ;', '挺不错的哈', null, '5', '蜡笔小新', '2014-08-14 18:14:56', '0'), ('9', '19', '24', ' 颜色: 黑色 ; 大小: 25 ;', '没有图片那么好', null, '4', '樱桃小丸子', '2014-08-14 18:30:44', '0'), ('10', '18', '24', ' 颜色: 红色 ; 大小: 15 ;', '一般般', null, '3', '樱桃小丸子', '2014-08-14 18:31:00', '0'), ('11', '17', '24', ' 颜色: 黑色 ; 大小: 15 ;', '非常喜欢', null, '5', '樱桃小丸子', '2014-08-14 18:31:09', '0'), ('12', '16', '24', ' 颜色: 红色 ; 大小: 15 ;', '唉～～～～', null, '1', '樱桃小丸子', '2014-08-14 18:31:20', '0');
COMMIT;

-- ----------------------------
--  Table structure for `mall_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `mall_delivery`;
CREATE TABLE `mall_delivery` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `price_in` decimal(10,2) DEFAULT NULL COMMENT '//省内',
  `price_out` decimal(10,2) DEFAULT NULL COMMENT '省外',
  `price_add` decimal(10,2) DEFAULT NULL COMMENT '//超重后增加的运费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_delivery`
-- ----------------------------
BEGIN;
INSERT INTO `mall_delivery` VALUES ('1', '顺丰快递', 'http://www.sf-express.com', '12元起步，省外20元起步，每超过10公斤后每公斤增加5元', '2014-08-08 10:39:32', '12.00', '20.00', '5.00'), ('4', '圆通快递', 'http://www.yto.net.cn', '6元起步，省外11元起步，每超过10公斤后每公斤增加2元', '2014-08-08 10:40:39', '6.00', '11.00', '2.00');
COMMIT;

-- ----------------------------
--  Table structure for `mall_goods`
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nav` mediumint(8) unsigned NOT NULL,
  `brand` mediumint(8) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `sn` varchar(50) NOT NULL,
  `attr` varchar(255) DEFAULT NULL,
  `price_sale` decimal(10,2) unsigned DEFAULT '0.00',
  `price_market` decimal(10,2) unsigned DEFAULT '0.00',
  `price_cost` decimal(10,2) unsigned DEFAULT '0.00',
  `keyword` varchar(200) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT '0.00',
  `thumbnail` varchar(200) DEFAULT NULL,
  `thumbnail2` varchar(200) DEFAULT NULL,
  `content` text,
  `is_up` tinyint(1) unsigned DEFAULT '0',
  `is_freight` tinyint(1) unsigned DEFAULT '0',
  `inventory` smallint(6) unsigned DEFAULT '0',
  `warn_inventory` smallint(2) unsigned DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `service` mediumint(8) DEFAULT NULL COMMENT '//售后服务',
  `sales` smallint(6) DEFAULT '0' COMMENT '//销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_goods`
-- ----------------------------
BEGIN;
INSERT INTO `mall_goods` VALUES ('13', '19', '7', '万代海贼王手办拼装船千里阳光号梅利桑尼号九蛇海贼船卡普模型 ', 'A0001', '颜色:白色|红色|黑色;大小:10|15|20|25', '129.00', '199.00', '100.00', '海贼王', '个', '1.00', '/uploads/20140814/20140814172329919.jpg', '/uploads/20140814/20140814172329919220_220.jpg', '<p><img src=\"http://img03.taobaocdn.com/imgextra/i3/618119447/T2QRGWXt0XXXXXXXXX_%21%21618119447.jpg\" /></p>\r\n\r\n<p><img src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /></p>\r\n\r\n<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/618119447/T2NSyUXztaXXXXXXXX_%21%21618119447.jpg\" />&nbsp;</p>\r\n\r\n<p><img src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img src=\"http://img03.taobaocdn.com/imgextra/i3/618119447/T2ZB1UXDtXXXXXXXXX_%21%21618119447.jpg\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/618119447/T22f9WXplaXXXXXXXX_%21%21618119447.jpg\" /></p>\r\n', '1', '1', '100', '1', '2014-08-14 17:23:40', '3', '0'), ('14', '19', '7', '2014新品 BANDAI万代航海王 海贼 超级王系列玩偶手办 公仔 ', 'A0002', '颜色:白色|红色|黑色;大小:10|15|20|25', '39.00', '55.00', '30.00', '海贼王', '个', '1.00', '/uploads/20140814/20140814172505461.png', '/uploads/20140814/20140814172505461220_220.png', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:750px\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img src=\"http://img01.taobaocdn.com/imgextra/i1/859385837/TB2ipavXVXXXXb6XXXXXXXXXXXX-859385837.jpg\" /></td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"alt\" src=\"http://img01.taobaocdn.com/imgextra/i1/859385837/T2hbu3XuJXXXXXXXXX-859385837.jpg\" style=\"height:225px; width:750px\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '1', '1', '100', '1', '2014-08-14 17:25:09', '3', '0'), ('15', '20', '8', 'MegaHouse 银魂 G.E.M 神乐 中国旗袍Ver GEM 正版手办', 'B0001', '颜色:白色|红色|黑色;大小:10|15|20|25', '450.00', '500.00', '300.00', '银魂', '个', '1.00', '/uploads/20140814/20140814172623456.jpg', '/uploads/20140814/20140814172623456220_220.jpg', '<p>现货产品和补款选项，不要跟预订的订金一起拍，请分开拍下，预订的拍在一起，现货/补款的拍在一起，谢谢。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>写给不懂预订、没预订过的客户：<br />\r\n这个是预订。<br />\r\n订金50。全价亚太版约450左右、日版约510左右 再另+国内运费。<br />\r\n<img src=\"http://gd4.alicdn.com/imgextra/T2orL5XaJbXXXXXXXX_%21%2121784470.gif\" /><br />\r\n2014年 12月发售，2015年1-2月左右到货。<br />\r\n（这是官方发售时间。我们不是生产，只是销售。有时候到货速度比其他淘宝店慢。）<br />\r\n订金要确认到帐的。<br />\r\n如果还是不懂预订的话，建议不要预订，官方发售后，淘宝会有现货出售的。<br />\r\n等不急的客户不要预订，有时候会比其他店铺慢1个月、2个月。<br />\r\n<br />\r\n如果预订的话，大概的流程是：<br />\r\n你付订金，我点发货，你点收货 确认到帐订金。<br />\r\n中间是漫长的等待。<br />\r\n最后货到我这后或即将到货时，通知补余款+国内运费，然后再实际发送货物。你收到货后确认收货余款。<br />\r\n<br />\r\n补款后发货是先补款的先发货，都是随机发货，不保好盒，无完美盒，介意盒压的不要在本店预订。</p>\r\n\r\n<p>0.&nbsp;店内所有产品都不保完美，全新的玩具经常会遇到掉漆、蹭漆、局部重涂等瑕疵问题（有时也会遇到2次封胶、内部开盒、外部开盒等问题），若遇瑕疵问题只能自己处理，不接受瑕疵问题退换货，不退部分款。不能接受的请至其他店铺购买。<br />\r\n店内所有商品，都是随机发货，不代为挑选品相。</p>\r\n\r\n<p>1.&nbsp;新客户预订请加旺旺&ldquo;dblcn7&rdquo;为好友，以免因旺旺的默认设置&ldquo;不接收陌生人消息&rdquo;而接收不到以后的通知补余款的消息。不常上旺旺的可留QQ通知、或常用邮箱、手机。<br />\r\n&nbsp;&nbsp;&nbsp;预订补款慢的：1.只剩盒压的，2.半个月还未补的，则补款价格可能会上涨(具体根据现货价格重定预订价)，3.一个月以后还未补的，若本店已无货，则不能补款并扣除订金（此时等同于毁单）。<br />\r\n&nbsp;&nbsp;&nbsp;预订的所有的情况都不能100%保证，请不能接受 砍单、涨价 的客户不要拍。砍单按预订顺序及比例给货（后面预订多个的若轮不到则1个都没）。<br />\r\n&nbsp;&nbsp;&nbsp;预订到货时间不能确定，请等不急的、要送人的 不要预订，否则延误后果自负，毁单不退订金。</p>\r\n\r\n<p>2. 全新的拆外盒后不接受退换货，正版的也会存在瑕疵，正版的也会在运输途中断损。<br />\r\n&nbsp;&nbsp;&nbsp;若从盒子外面看不到里面内容的，拆盒后也不接受退换货。各类眼镜厂的景品，未开封的盒蛋，请能接受各种情况的中奖（瑕疵、断损）后再购买。</p>\r\n\r\n<p>3.&nbsp;若需接收最新的预订、到货信息，请关注微薄http://weibo.com/cball0，或加旺旺群（5709489），或加QQ群（8608650）。以后旺旺好友一般不再群发消息，只作单独通知补余款用。</p>\r\n\r\n<p>4. 默认发韵达快递。可根据客户需求更换其他快递，费用一般都会贵些。各快递任何时候，店主都不能保证其到货速度，可自行询问快递公司、催快递公司，急件延误后果自负。</p>\r\n', '1', '1', '97', '1', '2014-08-14 17:26:28', '3', '3'), ('16', '19', '8', '电玩男 手办 预订 MH POP 航海王 海贼 七武海 女帝 汉库克 红衣', 'B0002', '颜色:白色|红色|黑色;大小:10|15|20|25', '100.00', '150.00', '80.00', '海贼王', '个', '1.00', '/uploads/20140814/20140814174222815.jpg', '/uploads/20140814/20140814174222815220_220.jpg', '<table border=\"0\" cellpadding=\"2\" cellspacing=\"2\" style=\"width:690px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>品牌</td>\r\n			<td colspan=\"2\">MEGA HOUSE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>包装</td>\r\n			<td colspan=\"2\">全新正品未拆封</td>\r\n		</tr>\r\n		<tr>\r\n			<td>发售时间</td>\r\n			<td colspan=\"2\">2014年12月</td>\r\n		</tr>\r\n		<tr>\r\n			<td>造型师</td>\r\n			<td colspan=\"2\">あじけん（アップラーク）</td>\r\n		</tr>\r\n		<tr>\r\n			<td>尺寸比例</td>\r\n			<td colspan=\"2\">1/8,全高约230mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>材质规格</td>\r\n			<td colspan=\"2\">PVC涂装完成品</td>\r\n		</tr>\r\n		<tr>\r\n			<td>官方定价</td>\r\n			<td colspan=\"2\">日元&nbsp;8424</td>\r\n		</tr>\r\n		<tr>\r\n			<td>预订价格</td>\r\n			<td colspan=\"2\">\r\n			<p><strong>大陆版546元（预订价格不包含运费）</strong></p>\r\n\r\n			<p><strong>亚太版538元（预订价格不包含运费）</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>商品介绍</td>\r\n			<td colspan=\"2\">\r\n			<p>P.O.P-DX シリーズ待望の海賊女帝が登場します。王下七武海の一員にして、九蛇海賊団船長の&ldquo;蛇姫&rdquo;ボア?ハンコック。その高貴な魅力に溢れた美貌を、イメージ通り に立体再現します。また顔と左手パーツの差し替えで二種類の表情が再現出来るなど、ファンの期待に応えるお楽しみ要素も満載です。</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>预订说明</td>\r\n			<td colspan=\"2\">\r\n			<p>预订流程：</p>\r\n\r\n			<p>拍下预订商品付订金&rarr;店主虚拟发货&rarr;买家确认收货&rarr;耐心等待商品发售&rarr;到货了再拍一次商品补款（按照预订价扣除订金）&rarr;买家付款&rarr;卖家发货&rarr;收到货后请确认付款&rarr;评价&rarr;交易完成</p>\r\n\r\n			<p>订金为100元，预定商品价格不包商品运费，到货后本店会通知您，您只要补齐尾款即可。<br />\r\n			预订后不会涨价，如最终价比预订价便宜，本店会按照最终价收取,<br />\r\n			预订商品到货后，本店会立刻通知您补齐尾款,已完成交易.买家需在接到本店通知一周内补齐尾款,否则本店将扣除定金,商品将被公开出售.<br />\r\n			预订好商品不得更换预定其他商品或退订.<br />\r\n			可能因厂方、海关等其他意外因素的影响造成延期，不接受以此为由的定金退款申请，敬请谅解。<br />\r\n			商品的正式发售日期以实际的出货日期为准，介意者慎拍！<br />\r\n			如因厂商卡单供货不足，(本店会尽量避免,但有时候日本厂商的卡单无法避免)则本店VIP买家优先给货，VIP买家之间按照预订顺序给货，然后再按预订的先后顺序发货。同时本店也会尽快通知不够给到货的买家，退还订金给您。<br />\r\n			如厂商跳票了，则到货时间相应顺延。预订商品照片为开发中样式，如有颜色、造型等变动，不再另行通知，以实际到货商品为准。<br />\r\n			买家如果预订了，则视为默认接受上述预定规定,谢谢!</p>\r\n\r\n			<p>补款说明</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '1', '1', '99', '1', '2014-08-14 17:42:34', '3', '1'), ('17', '20', '9', '电玩男 手办 预订 MegaHouse G.E.M. 银魂 冲田总悟 Ver.动乱 ', 'C0001', '颜色:白色|红色|黑色;大小:10|15|20|25', '472.00', '500.00', '450.00', '银魂', '个', '1.00', '/uploads/20140814/20140814174642755.jpg', '/uploads/20140814/20140814174642755220_220.jpg', '<table border=\"0\" cellpadding=\"2\" cellspacing=\"2\" style=\"width:690px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>品牌</td>\r\n			<td colspan=\"2\">MEGA HOUSE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>包装</td>\r\n			<td colspan=\"2\">全新正品未拆封</td>\r\n		</tr>\r\n		<tr>\r\n			<td>发售时间</td>\r\n			<td colspan=\"2\">2014年10月</td>\r\n		</tr>\r\n		<tr>\r\n			<td>造型师</td>\r\n			<td colspan=\"2\">もかまる（エムアイシー）</td>\r\n		</tr>\r\n		<tr>\r\n			<td>尺寸比例</td>\r\n			<td colspan=\"2\">1/8,全高约150mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>材质规格</td>\r\n			<td colspan=\"2\">PVC涂装完成品</td>\r\n		</tr>\r\n		<tr>\r\n			<td>官方定价</td>\r\n			<td colspan=\"2\">日元&nbsp;9990</td>\r\n		</tr>\r\n		<tr>\r\n			<td>预订价格</td>\r\n			<td colspan=\"2\">\r\n			<p><strong>亚太版472元（预订价格不包含运费）</strong></p>\r\n\r\n			<p><strong>大陆版481元（预订价格不包含运费）</strong></p>\r\n\r\n			<p><strong>日版563元（预订价格不包含运费）</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>商品介绍</td>\r\n			<td colspan=\"2\">\r\n			<p>原作 10 周年を迎える「銀魂」から人気のキャラクター真選組「沖田総悟」が新造形で再登場！<br />\r\n			「坂田銀時ver.紅桜」の造形を手がけた造形師「もかまる」によって魅力あるポーズで立体化。<br />\r\n			動乱篇で見せた沖田のワンシーンをイメージした迫力ある造形となっています。</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>预订说明</td>\r\n			<td colspan=\"2\">\r\n			<p>预订流程：</p>\r\n\r\n			<p>拍下预订商品付订金&rarr;店主虚拟发货&rarr;买家确认收货&rarr;耐心等待商品发售&rarr;到货了再拍一次商品补款（按照预订价扣除订金）&rarr;买家付款&rarr;卖家发货&rarr;收到货后请确认付款&rarr;评价&rarr;交易完成</p>\r\n\r\n			<p>订金为100元，预定商品价格不包商品运费，到货后本店会通知您，您只要补齐尾款即可。<br />\r\n			预订后不会涨价，如最终价比预订价便宜，本店会按照最终价收取,<br />\r\n			预订商品到货后，本店会立刻通知您补齐尾款,已完成交易.买家需在接到本店通知一周内补齐尾款,否则本店将扣除定金,商品将被公开出售.<br />\r\n			预订好商品不得更换预定其他商品或退订.<br />\r\n			可能因厂方、海关等其他意外因素的影响造成延期，不接受以此为由的定金退款申请，敬请谅解。<br />\r\n			商品的正式发售日期以实际的出货日期为准，介意者慎拍！<br />\r\n			如因厂商卡单供货不足，(本店会尽量避免,但有时候日本厂商的卡单无法避免)则本店VIP买家优先给货，VIP买家之间按照预订顺序给货，然后再按预订的先后顺序发货。同时本店也会尽快通知不够给到货的买家，退还订金给您。<br />\r\n			如厂商跳票了，则到货时间相应顺延。预订商品照片为开发中样式，如有颜色、造型等变动，不再另行通知，以实际到货商品为准。<br />\r\n			买家如果预订了，则视为默认接受上述预定规定,谢谢!</p>\r\n\r\n			<p>补款说明</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '1', '1', '99', '1', '2014-08-14 17:46:46', '3', '1'), ('18', '21', '10', 'GSC手办 粘土人Date.A.Live 约会大作战 四糸乃', 'D0001', '颜色:白色|红色|黑色;大小:10|15|20|25', '355.00', '380.00', '320.00', '约会大作战', '个', '1.00', '/uploads/20140814/20140814174926875.jpg', '/uploads/20140814/20140814174926875220_220.jpg', '<p><strong>2014年5月发售，发售后4周左右到货</strong></p>\r\n\r\n<p><strong>4200日元，预订价格不含国内发货运费</strong></p>\r\n\r\n<p><strong>ABS＆PVC塗装済み可動フィギュア<br />\r\n【サイズ】 全高：約 100 mm（ノンスケール）<br />\r\n<br />\r\n【セット内容一覧】<br />\r\n本体<br />\r\n専用台座</strong></p>\r\n\r\n<p><strong>原型制作：JUN（E.V.）<br />\r\n制作協力：ねんどろん<br />\r\n<br />\r\nアニメ第二期の放送が決定した『デート?ア?ライブ』より、精霊「四糸乃」をねんどろいど化！<br />\r\n表情パーツはほんわかとした「通常顔」のほか、怯えた「泣き顔」と、赤面した「デフォルメ顔」が付属。<br />\r\nオプションパーツには、パペット「よしのん」や、雪うさぎサイズにデフォルメした「氷結傀儡（ザドキエル）」が付属します。<br />\r\n特徴的な大きな耳はジョイントパーツにより自由に表情付けが可能なほか、フードとコートを取り外し専用の上半身パーツと差し替える事で、ワンピース姿を再現することが出来ます！</strong></p>\r\n\r\n<p><strong><img alt=\"FIGURE-004421_01.jpg\" src=\"http://gd1.alicdn.com/imgextra/i1/35007559/TB2yAaoXFXXXXaWXpXXXXXXXXXX_%21%2135007559.jpg\" style=\"border-width:0.0px; margin:3.0px auto\" /></strong></p>\r\n', '1', '1', '98', '1', '2014-08-14 17:49:29', '3', '2'), ('19', '22', '11', 'MF Figma 初音未来 雪初音 web受注 日版手办代购', 'E0001', '颜色:白色|红色|黑色;大小:10|15|20|25', '251.00', '280.00', '200.00', '初音', '个', '1.00', '/uploads/20140814/20140814175213411.jpg', '/uploads/20140814/20140814175213411220_220.jpg', '<p>商品名称：figma 雪ミク<br />\r\n厂商信息：MF<br />\r\n发售预定日：2014年<br />\r\n贩卖种类：预约贩卖<br />\r\n比例：figma<br />\r\n材料：PVC、ABS<br />\r\n日本官方售价：4000円(税込)<br />\r\n本店价格：350元（不含运费）</p>\r\n\r\n<p>&nbsp;<img src=\"http://gd1.alicdn.com/imgextra/i1/382417226/T28zRyXDRXXXXXXXXX_%21%21382417226.jpg\" /></p>\r\n', '1', '1', '99', '1', '2014-08-14 17:52:17', '3', '1');
COMMIT;

-- ----------------------------
--  Table structure for `mall_level`
-- ----------------------------
DROP TABLE IF EXISTS `mall_level`;
CREATE TABLE `mall_level` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_level`
-- ----------------------------
BEGIN;
INSERT INTO `mall_level` VALUES ('1', '超级管理员'), ('2', '普通管理员'), ('3', '商品发布专员'), ('4', '订单处理专员');
COMMIT;

-- ----------------------------
--  Table structure for `mall_manage`
-- ----------------------------
DROP TABLE IF EXISTS `mall_manage`;
CREATE TABLE `mall_manage` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `pass` char(40) NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `login_count` smallint(6) unsigned NOT NULL DEFAULT '1',
  `last_ip` varchar(20) NOT NULL,
  `last_time` datetime DEFAULT NULL,
  `reg_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_manage`
-- ----------------------------
BEGIN;
INSERT INTO `mall_manage` VALUES ('2', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '1', '127.0.0.1', null, '2014-07-23 16:21:02'), ('13', '黑崎一护', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '1', '127.0.0.1', null, '2014-07-24 17:15:21'), ('20', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1', '32', '127.0.0.1', '2014-08-14 16:36:36', '2014-07-25 12:44:24'), ('21', '柯南', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '1', '127.0.0.1', null, '2014-07-25 12:47:06'), ('22', '水冰月', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '1', '127.0.0.1', null, '2014-07-25 12:47:32'), ('23', '安蕾尔', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '1', '127.0.0.1', null, '2014-07-25 12:48:18'), ('27', '赛门', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '2', '127.0.0.1', '2014-07-28 17:32:54', '2014-07-25 12:49:22');
COMMIT;

-- ----------------------------
--  Table structure for `mall_nav`
-- ----------------------------
DROP TABLE IF EXISTS `mall_nav`;
CREATE TABLE `mall_nav` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `info` varchar(200) NOT NULL,
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sid` mediumint(8) NOT NULL DEFAULT '0',
  `brand` varchar(255) DEFAULT NULL,
  `price` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_nav`
-- ----------------------------
BEGIN;
INSERT INTO `mall_nav` VALUES ('12', '动漫手办', '动漫手办', '13', '0', '', 'a:10:{i:0;s:5:\"23-81\";i:1;s:6:\"82-150\";i:2;s:7:\"151-250\";i:3;s:7:\"251-350\";i:4;s:7:\"351-450\";i:5;s:7:\"451-550\";i:6;s:7:\"551-650\";i:7;s:7:\"651-750\";i:8;s:7:\"751-850\";i:9;s:8:\"851-1000\";}'), ('19', '海贼王', '海贼王', '19', '12', 'a:5:{i:0;s:1:\"7\";i:1;s:1:\"8\";i:2;s:1:\"9\";i:3;s:2:\"10\";i:4;s:2:\"11\";}', 'a:10:{i:0;s:5:\"23-81\";i:1;s:6:\"82-150\";i:2;s:7:\"151-250\";i:3;s:7:\"251-350\";i:4;s:7:\"351-450\";i:5;s:7:\"451-550\";i:6;s:7:\"551-650\";i:7;s:7:\"651-750\";i:8;s:7:\"751-850\";i:9;s:8:\"851-1000\";}'), ('20', '银魂', '银魂', '20', '12', 'a:5:{i:0;s:1:\"7\";i:1;s:1:\"8\";i:2;s:1:\"9\";i:3;s:2:\"10\";i:4;s:2:\"11\";}', 'a:10:{i:0;s:5:\"23-81\";i:1;s:6:\"82-150\";i:2;s:7:\"151-250\";i:3;s:7:\"251-350\";i:4;s:7:\"351-450\";i:5;s:7:\"451-550\";i:6;s:7:\"551-650\";i:7;s:7:\"651-750\";i:8;s:7:\"751-850\";i:9;s:8:\"851-1000\";}'), ('21', '约会大作战', '约会大作战', '21', '12', 'a:5:{i:0;s:1:\"7\";i:1;s:1:\"8\";i:2;s:1:\"9\";i:3;s:2:\"10\";i:4;s:2:\"11\";}', 'a:10:{i:0;s:5:\"23-81\";i:1;s:6:\"82-150\";i:2;s:7:\"151-250\";i:3;s:7:\"251-350\";i:4;s:7:\"351-450\";i:5;s:7:\"451-550\";i:6;s:7:\"551-650\";i:7;s:7:\"651-750\";i:8;s:7:\"751-850\";i:9;s:8:\"851-1000\";}'), ('22', '初音', '初音', '22', '12', 'a:5:{i:0;s:1:\"7\";i:1;s:1:\"8\";i:2;s:1:\"9\";i:3;s:2:\"10\";i:4;s:2:\"11\";}', 'a:9:{i:0;s:5:\"23-81\";i:1;s:6:\"82-150\";i:2;s:7:\"151-250\";i:3;s:7:\"251-350\";i:4;s:7:\"351-450\";i:5;s:7:\"451-550\";i:6;s:7:\"551-650\";i:7;s:7:\"751-850\";i:8;s:8:\"851-1000\";}');
COMMIT;

-- ----------------------------
--  Table structure for `mall_order`
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `tel` char(11) DEFAULT NULL,
  `buildings` varchar(100) DEFAULT NULL COMMENT '//标志建筑物',
  `delivery` varchar(50) DEFAULT NULL COMMENT '//物流',
  `pay` varchar(50) DEFAULT NULL COMMENT '//支付方式',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '//总价',
  `text` varchar(255) DEFAULT NULL COMMENT '//备注',
  `ps` varchar(50) DEFAULT NULL COMMENT '//缺货处理',
  `ordernum` varchar(100) DEFAULT NULL COMMENT '订单号',
  `goods` text COMMENT '//商品',
  `date` datetime DEFAULT NULL,
  `order_state` varchar(10) DEFAULT '未确认',
  `order_pay` varchar(10) DEFAULT '未支付',
  `order_delivery` varchar(10) DEFAULT '未发货',
  `delivery_name` varchar(20) DEFAULT NULL,
  `delivery_url` varchar(200) DEFAULT NULL,
  `delivery_number` varchar(200) DEFAULT NULL,
  `refund` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_order`
-- ----------------------------
BEGIN;
INSERT INTO `mall_order` VALUES ('22', '蜡笔小新', '李狗蛋', 'lgd@163.com', '山东青岛', '255000', '13361599285', '小桥流水', '顺丰快递', '支付宝', '825.00', '包装盒要完整', '先发有货的', '2014081418085253314', 'a:2:{i:18;s:369:\"a:9:{s:2:\"id\";s:2:\"18\";s:3:\"nav\";s:2:\"21\";s:4:\"name\";s:56:\"GSC手办 粘土人Date.A.Live 约会大作战 四糸乃\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"大小\";a:1:{i:0;s:2:\"10\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:5:\"D0001\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:46:\"/uploads/20140814/20140814174926875220_220.jpg\";s:10:\"price_sale\";s:6:\"355.00\";}\";i:15;s:375:\"a:9:{s:2:\"id\";s:2:\"15\";s:3:\"nav\";s:2:\"20\";s:4:\"name\";s:62:\"MegaHouse 银魂 G.E.M 神乐 中国旗袍Ver GEM 正版手办\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"大小\";a:1:{i:0;s:2:\"10\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:5:\"B0001\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:46:\"/uploads/20140814/20140814172623456220_220.jpg\";s:10:\"price_sale\";s:6:\"450.00\";}\";}', '2014-08-14 18:08:52', '已确认', '已支付', '已发货', '顺丰快递', 'http://www.sf-express.com', 'SF1234566', '0'), ('23', '路飞', '路飞', 'lf@163.com', '山东淄博', '255000', '13661585258', '火炬大厦', '顺丰快递', '支付宝', '912.00', '我要买双份', '先发有货的', '2014081418115689156', 'a:1:{i:15;s:375:\"a:9:{s:2:\"id\";s:2:\"15\";s:3:\"nav\";s:2:\"20\";s:4:\"name\";s:62:\"MegaHouse 银魂 G.E.M 神乐 中国旗袍Ver GEM 正版手办\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"白色\";}s:6:\"大小\";a:1:{i:0;s:2:\"10\";}}s:3:\"num\";s:1:\"2\";s:2:\"sn\";s:5:\"B0001\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:46:\"/uploads/20140814/20140814172623456220_220.jpg\";s:10:\"price_sale\";s:6:\"450.00\";}\";}', '2014-08-14 18:11:56', '已确认', '已支付', '已发货', '顺丰快递', 'http://www.sf-express.com', 'SF1234567', '0'), ('24', '樱桃小丸子', '樱桃小丸子', 'ytxwz@sina.com', '山东东营', '255000', '13366685741', '火车站', '顺丰快递', '支付宝', '1190.00', '来吧！', '先发有货的', '2014081418300018142', 'a:4:{i:19;s:373:\"a:9:{s:2:\"id\";s:2:\"19\";s:3:\"nav\";s:2:\"22\";s:4:\"name\";s:60:\"MF Figma 初音未来 雪初音 web受注 日版手办代购\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"黑色\";}s:6:\"大小\";a:1:{i:0;s:2:\"25\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:5:\"E0001\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:46:\"/uploads/20140814/20140814175213411220_220.jpg\";s:10:\"price_sale\";s:6:\"251.00\";}\";i:18;s:369:\"a:9:{s:2:\"id\";s:2:\"18\";s:3:\"nav\";s:2:\"21\";s:4:\"name\";s:56:\"GSC手办 粘土人Date.A.Live 约会大作战 四糸乃\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"红色\";}s:6:\"大小\";a:1:{i:0;s:2:\"15\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:5:\"D0001\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:46:\"/uploads/20140814/20140814174926875220_220.jpg\";s:10:\"price_sale\";s:6:\"355.00\";}\";i:17;s:385:\"a:9:{s:2:\"id\";s:2:\"17\";s:3:\"nav\";s:2:\"20\";s:4:\"name\";s:72:\"电玩男 手办 预订 MegaHouse G.E.M. 银魂 冲田总悟 Ver.动乱 \";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"黑色\";}s:6:\"大小\";a:1:{i:0;s:2:\"15\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:5:\"C0001\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:46:\"/uploads/20140814/20140814174642755220_220.jpg\";s:10:\"price_sale\";s:6:\"472.00\";}\";i:16;s:394:\"a:9:{s:2:\"id\";s:2:\"16\";s:3:\"nav\";s:2:\"19\";s:4:\"name\";s:81:\"电玩男 手办 预订 MH POP 航海王 海贼 七武海 女帝 汉库克 红衣\";s:4:\"attr\";a:2:{s:6:\"颜色\";a:1:{i:0;s:6:\"红色\";}s:6:\"大小\";a:1:{i:0;s:2:\"15\";}}s:3:\"num\";s:1:\"1\";s:2:\"sn\";s:5:\"B0002\";s:6:\"weight\";s:4:\"1.00\";s:10:\"thumbnail2\";s:46:\"/uploads/20140814/20140814174222815220_220.jpg\";s:10:\"price_sale\";s:6:\"100.00\";}\";}', '2014-08-14 18:30:00', '已确认', '已支付', '已发货', '顺丰快递', 'http://www.sf-express.com', 'SF1234568', '0');
COMMIT;

-- ----------------------------
--  Table structure for `mall_price`
-- ----------------------------
DROP TABLE IF EXISTS `mall_price`;
CREATE TABLE `mall_price` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `price_left` smallint(6) DEFAULT '0',
  `price_right` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_price`
-- ----------------------------
BEGIN;
INSERT INTO `mall_price` VALUES ('17', '23', '81'), ('18', '82', '150'), ('19', '151', '250'), ('20', '251', '350'), ('21', '351', '450'), ('22', '451', '550'), ('23', '551', '650'), ('24', '651', '750'), ('25', '751', '850'), ('26', '851', '1000');
COMMIT;

-- ----------------------------
--  Table structure for `mall_record`
-- ----------------------------
DROP TABLE IF EXISTS `mall_record`;
CREATE TABLE `mall_record` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `user` varchar(200) DEFAULT NULL,
  `attr` varchar(200) DEFAULT NULL,
  `num` smallint(6) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_record`
-- ----------------------------
BEGIN;
INSERT INTO `mall_record` VALUES ('7', '15', 'MegaHouse 银魂 G.E.M 神乐 中国旗袍Ver GEM 正版手办', '路飞', '颜色:白色,大小:10;', '2', '450.00', '2014-08-14 18:12:41'), ('8', '18', 'GSC手办 粘土人Date.A.Live 约会大作战 四糸乃', '蜡笔小新', '颜色:白色,大小:10;', '1', '355.00', '2014-08-14 18:14:18'), ('9', '15', 'MegaHouse 银魂 G.E.M 神乐 中国旗袍Ver GEM 正版手办', '蜡笔小新', '颜色:白色,大小:10;', '1', '450.00', '2014-08-14 18:14:18'), ('10', '19', 'MF Figma 初音未来 雪初音 web受注 日版手办代购', '樱桃小丸子', '颜色:黑色,大小:25;', '1', '251.00', '2014-08-14 18:30:26'), ('11', '18', 'GSC手办 粘土人Date.A.Live 约会大作战 四糸乃', '樱桃小丸子', '颜色:红色,大小:15;', '1', '355.00', '2014-08-14 18:30:26'), ('12', '17', '电玩男 手办 预订 MegaHouse G.E.M. 银魂 冲田总悟 Ver.动乱 ', '樱桃小丸子', '颜色:黑色,大小:15;', '1', '472.00', '2014-08-14 18:30:26'), ('13', '16', '电玩男 手办 预订 MH POP 航海王 海贼 七武海 女帝 汉库克 红衣', '樱桃小丸子', '颜色:红色,大小:15;', '1', '100.00', '2014-08-14 18:30:26'), ('14', '19', 'MF Figma 初音未来 雪初音 web受注 日版手办代购', '樱桃小丸子', '颜色:黑色,大小:25;', '1', '251.00', '2014-08-14 18:31:40'), ('15', '18', 'GSC手办 粘土人Date.A.Live 约会大作战 四糸乃', '樱桃小丸子', '颜色:红色,大小:15;', '1', '355.00', '2014-08-14 18:31:40'), ('16', '17', '电玩男 手办 预订 MegaHouse G.E.M. 银魂 冲田总悟 Ver.动乱 ', '樱桃小丸子', '颜色:黑色,大小:15;', '1', '472.00', '2014-08-14 18:31:40'), ('17', '16', '电玩男 手办 预订 MH POP 航海王 海贼 七武海 女帝 汉库克 红衣', '樱桃小丸子', '颜色:红色,大小:15;', '1', '100.00', '2014-08-14 18:31:40');
COMMIT;

-- ----------------------------
--  Table structure for `mall_service`
-- ----------------------------
DROP TABLE IF EXISTS `mall_service`;
CREATE TABLE `mall_service` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  `first` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_service`
-- ----------------------------
BEGIN;
INSERT INTO `mall_service` VALUES ('1', '服饰售后', '<p>服饰售后</p>\r\n', '2014-08-06 15:23:16', '0'), ('3', '通用售后', '<p><img src=\"./uploads/20140814/20140814165115369.png\" style=\"height:48px; width:48px\" /></p>\r\n\r\n<p>24小时发货</p>\r\n\r\n<p>付款后24小时内发货</p>\r\n\r\n<p><img src=\"./uploads/20140814/20140814165133858.png\" style=\"height:48px; width:48px\" /></p>\r\n\r\n<p>7天退货</p>\r\n\r\n<p>退货条件：商品签收之日起7天内，在不影响商品二次销售的前提下，可申请无理由退货。</p>\r\n\r\n<p>邮费说明：非商品质量问题的包邮商品，由买卖双方分别承担发货运费，其他情形根据&ldquo;谁责任，谁承担&rdquo;的原则处理。</p>\r\n\r\n<p><img src=\"./uploads/20140814/20140814165145965.png\" style=\"height:48px; width:48px\" /></p>\r\n\r\n<p>消费者保障服务</p>\r\n\r\n<p>该卖家已缴纳1000.0元保证金。</p>\r\n\r\n<p>在确认收货15天内，如有商品质量问题、描述不符或未收到货等，您有权申请退款或退货，来回邮费由卖家承担。</p>\r\n', '2014-08-06 15:32:16', '1');
COMMIT;

-- ----------------------------
--  Table structure for `mall_user`
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) DEFAULT NULL,
  `pass` char(40) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mall_user`
-- ----------------------------
BEGIN;
INSERT INTO `mall_user` VALUES ('1', '蜡笔小新', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2014-08-03 16:00:00'), ('2', '路飞', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2014-08-14 18:10:23'), ('3', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2014-08-14 18:28:04');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
