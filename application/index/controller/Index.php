<?php
namespace app\index\controller;

use think\Controller;

class Index extends Base
{
    public function index()
    {
        $type = input('get.type',0,'intval');
        $result = model('featured')->getFeaturedsByType($type);
//        halt($result);
        $ad = model('featured')->where(['type'=>1])->order('id','desc')->select();
        // 推荐位
//        halt($ad);
        // 商品分类 数据-美食 推荐的数据
        $datas = model('Deal')->getNormalDealByCategoryCityId(1, $this->city->id);
        // 获取4个子分类
        $meishicates = model('Category')->getNormalRecommendCategoryByParentId(1, 4);
        return $this->fetch('',[
            'featured' => $result,
            'ad' => $ad,
            'datas' => $datas,
            'meishicates' => $meishicates,
            'empty' =>'<span style="color: red;font-size: 24px">该城市下没有分类数据</span>'
        ]);
    }
}
