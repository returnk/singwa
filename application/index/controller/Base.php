<?php
namespace app\index\controller;

use think\Controller;

class Base extends Controller
{
    public $city = '';
    public $account = '';

    protected function initialize()
    {
        $citys = model('city')->getNormalCitys();
        // 前台首页 左上角默认定位效果
        $this->getCity($citys);
        // 前台首页 左上角默认定位效果
        $this->assign('citys',$citys);
        // 获取首页分类的数据
        $cats = $this->getRecommendCats();
        $this->assign('city',$this->city);
        $this->assign('cats', $cats);
        $this->assign('user', $this->getLoginUser());
        $this->assign('title', 'o2o团购网');
        $this->assign('controler', strtolower(request()->controller())); // 动态加载css 样式



    }


    public function getCity($citys)
    {
        // 前台首页 左上角默认定位效果
        $defaultuname = '';
        foreach($citys as $city) {
//            print_r($city);die; // 这里是一个对象 可以转换成数组
            $city = $city->toArray();
//            print_r($city);die;// 这里是一个数组
            if($city['is_default'] == 1) { // is_default == 1 数据库字段 首页默认城市
                $defaultuname = $city['uname'];
                break;
            }
            // 如果$defaultuname存在就要它否则取 nanchang
            $defaultuname = $defaultuname ? $defaultuname : 'nanchang';
            // 如果session存在这个值并且没有点击链接获取地址就用session的
            if(session('cityuname', '', 'o2o') && !input('get.city')) {
                $cityuname = session('cityuname', '', 'o2o');
            }else {
                // 如果是通过链接得到城市 没有值就用$defaultuanme
                $cityuname = input('get.city', $defaultuname, 'trim');
                session('cityuname', $cityuname, 'o2o');
            }
            // 获取表中相关数据
            $this->city = model('City')->where(['uname'=>$cityuname])->find();

        }
        // 前台首页 左上角默认定位效果
    }

    // 获取用户数据
    public function getLoginUser() {
        if(!$this->account) {
            $this->account = session('o2o_user', '', 'o2o');
        }
        return $this->account;
    }

    /**
     * 获取首页推荐当中中的商品分类数据
     */
    public function getRecommendCats() {
        $parentIds = $sedcatArr = $recomCats = [];
        $cats = model('Category')->getNormalRecommendCategoryByParentId(0,5);
//        print_r($cats);die;
        foreach($cats as $cat) {
            $parentIds[] = $cat->id;
//           var_dump($parentIds);
        }
//        die;
        // 获取二级分类的数据
        $sedCats = model('Category')->getNormalCategoryIdParentId($parentIds);

        // 拼装数据
        foreach($sedCats as $sedcat) {
            $sedcatArr[$sedcat->parent_id][] = [
                'id' => $sedcat->id,
                'name' => $sedcat->name,
            ];
        }

        // 再遍历
        foreach($cats as $cat) {
            // recomCats 代表是一级 和 二级数据，  []第一个参数是 一级分类的name, 第二个参数 是 此一级分类下面的所有二级分类数据
            $recomCats[$cat->id] = [$cat->name, empty($sedcatArr[$cat->id]) ? [] : $sedcatArr[$cat->id]];
        }
        return $recomCats;
    }

}
