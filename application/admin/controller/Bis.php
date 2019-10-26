<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Bis extends Controller
{
    private $obj;

    public function initialize()
    {
        $this->obj = model('Bis');
    }

    /**
     * 正常的商户列表
     * @return mixed
     */
    public function index() {
        $bis = $this->obj->getBisByStatus(1);
        return $this->fetch('', [
            'bis' => $bis,
        ]);
    }

    // 删除的用户
    public function dellist()
    {
        $dellist = $this->obj
            ->where('status',-1)
            ->all();
        return $this->fetch('',[
            'dellist' => $dellist,
        ]);
    }

    // 入驻申请列表
    public function apply()
    {
      $bis =  $this->obj->getBisByStatus();
      return $this->fetch('',[
          'bis' => $bis,
      ]);

    }

    // 商家用户修改
    public function detail()
    {
        $id = input('get.id');

        if(empty($id)) {
            return $this->error('ID错误');
        }
        //获取一级城市的数据
        $citys = model('City')->getNormalCitysByParentId();
        //获取一级栏目的数据
        $categorys = model('Category')->getNormalCategorysByParentId();
        // 获取商户数据
        $bisData = model('Bis')->get($id);
        $locationData = model('BisLocation')->get(['bis_id'=>$id, 'is_main'=>1]);
        $accountData = model('BisAccount')->get(['bis_id'=>$id, 'is_main'=>1]);
        // 页面填充的数据没有写完
        return $this->fetch('',[
            'citys' => $citys,
            'categorys' => $categorys,
            'bisData' => $bisData,
            'locationData' => $locationData,
            'accountData' => $accountData,
        ]);
    }
}
