<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use think\Db;

// 后台分类管理的状态
function status($status) {
    if($status == 1) {
        $str = "正常";
    }elseif($status ==0) {
        $str = "待审";
    }else {
        $str = "已删除";
    }
    return $str;
}

// 商户入驻申请的文案
function bisRegister($status) {
    if($status == 1) {
        $str = "入驻申请成功";
    }elseif($status == 0) {
        $str = "待审核，审核后平台方会发送邮件通知，请关注邮件";

    }elseif($status == 2) {
        $str = "非常抱歉，您提交的材料不符合条件，请重新提交";
    }else {
        $str = "该申请已被删除";
    }
    return $str;
}

// 获取城市名称
function getSeCityName($path) {
    if(empty($path)) {
        return '';
    }
    if(preg_match('/,/', $path)) {
        $cityPath = explode(',', $path);
        $cityId = $cityPath[1];
    }else {
        $cityId = $path;
    }

    $city = model('City')->get($cityId);
    return $city->name;
}

function countLocation($ids) {
    if(!$ids) {
        return 1;
    }

    if(preg_match('/,/', $ids)) {
        $arr = explode(',', $ids);
        return count($arr);
    }
}

// 获取分类名称
function getCategoryName($cateId) {
    return Db::table('o2o_category')->where(['id'=>$cateId])->value('name');
}
// 获取城市名称
function getCityName($cityId) {
    return Db::table('o2o_city')->where(['id'=>$cityId])->value('name');
}

// 设置订单号
function setOrderSn()
{
    list($t1, $t2) = explode(' ',microtime());
    /*echo $t1.'<br>';
    echo $t2.'<br>';exit;*/
    $t3 = explode('.', $t1*10000);
    return $t2.$t3[0].(rand(10000,99999));
}



