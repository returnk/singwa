<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
class Category extends Controller
{
    public function getCategoryByParentId()
    {
        $id = input('post.id',0,'intval');
        if(!$id) {
            $this->error('ID不合法');
        }
        // 通过ID获取二级城市信息
        $categorys = model('category')->getNormalCategorysByParentId($id);
        if($categorys) {
            return show(1,'success',$categorys);
        }else {
            return show(0,'error');
        }
    }


}
