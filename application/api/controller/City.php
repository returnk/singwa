<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
class City extends Controller
{
    public function getCitysByParentId()
    {
        $id = input('post.id');
        if(!$id) {
            $this->error('ID不合法');
        }
        // 通过ID获取二级城市信息
        $citys = model('city')->getNormalCitysByParentId($id);
        if($citys) {
            return show(1,'success',$citys);
        }else {
            return show(0,'error');
        }
    }


}
