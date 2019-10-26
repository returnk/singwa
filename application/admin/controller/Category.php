<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\validate\Category as CateValidate;
class Category extends Base
{
    public function index()
    {
        // 在app.php开启为true  URL普通方式参数 用于自动生成
        // 获取子栏目
        $parentId = input('get.parent_id',0,'intval'); // 子栏目传递过来的parent_id，默认为0
        // 获取子栏目
        // 获取栏目列表下的一级栏目
        $categorys = model('category')->getFirstCategorys($parentId);
        return $this->fetch('',[
            'categorys' => $categorys,
        ]);
    }

    public function add(Request $request)
    {
        // 获取添加分类下的一级分类
        $categorys = model('category')->getNormalFirstCategory();
        return $this->fetch('',[
                'categorys' => $categorys,
            ]);
    }

    public function save(Request $request)
    {
        // 判断是否post请求
         if(!$request->isPost()) {
             $this->error('请求错误');
         }

        $data = $request->post();
        $validate = validate('category');
        if(!$validate->scene('add')->check($data)) {
            $this->error($validate->getError());
        }
        // 有$data['id']是更新
        if(!empty($data['id'])) {
            return $this->update($data);
        }
        // 有$data['id']是更新

        // 将数据提交到模型
        $res = model('category')->add($data);
        if($res) {
            $this->success('添加成功','category/index');
        }else {
            $this->error('添加失败');
        }
    }

    // 编辑页面
    public function edit($id=0)
    {
        if(intval($id) < 1) {
            $this->error('参数不合法');
        }
        // 获取要修改哪条栏目
        $category = model('category')->get($id);
        // 获取添加分类下的一级分类
        $categorys = model('category')->getNormalFirstCategory();
        return $this->fetch('',[
            'categorys' => $categorys,
            'category' => $category,
        ]);
    }

    // 更新操作
    public function update($data)
    {
        $res = model('category')->save($data,['id'=>intval($data['id'])]);
        if($res) {
            $this->error('更新成功');
        }else {
            $this->error('更新失败');
        }
    }

    // 分类管理列表的排序
    public function listorder($id, $listorder)
    {
        $res = model('category')->save(['listorder'=>$listorder],['id'=>$id]);
        if($res) {
            // 返回json数据也可以用result
            $this->result($_SERVER['HTTP_REFERER'],1,'success'); // url 状态码 信息
        }else {
            $this->result($_SERVER['HTTP_REFERER'],0,'更新失败'); // url 状态码 信息
        }
    }

    // 修改状态 继承到base里去了
    /*public function status(){
        // print_r(input('get.'));exit;
        $data = input('get.');
        $validate = validate('Category');
        if(!$validate->scene('status')->check($data)) {
            $this->error($validate->getError());
        }
        $res = model('category')->save(['status'=>$data['status']], ['id'=>$data['id']]);
        if($res){
            $this->success('状态更新成功');
        } else {
            $this->error('状态更新失败');
        }
    }*/
}
