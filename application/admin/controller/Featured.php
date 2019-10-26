<?php
namespace app\admin\controller;

use think\Controller;

class Featured extends  Base
{
    private $obj;
    public function initialize()
    {
        $this->obj = model('Featured');
    }

    public function index()
    {

        $type = input('get.type',0,'intval');
        $result = $this->obj->getFeaturedsByType($type);
//        halt($result);
        // 推荐位
        $types = [

            0 => '首页大图推荐位',
            1 => '首页右侧广告位',
            // todo
        ];
        // 推荐位
        return $this->fetch('',[
            'types' => $types,
            'results' => $result,
        ]);
    }

    public function add()
    {
        if(request()->isPost()) {
            // 入库逻辑
            $data = input('post.');
            $id = model('Featured')->add($data);
            if($id) {
                $this->success('添加成功');
            }else {
                $this->success('添加失败');
            }
        } else {
            // 推荐位
            $types = [

                0 => '首页大图推荐位',
                1 => '首页右侧广告位',
                // todo
            ];
            // 推荐位

            return $this->fetch('',[
                'types' => $types,
            ]);
        }
    }

    // 继承到Base里啦
    /*public function status()
    {
        $data = input('param.');
        $res = $this->obj->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($res) {
            $this->success('修改成功','featured/index');
        }else {
            $this->error('修改失败');
        }
    }*/
}
