<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/23
 * Time: 17:01
 */

namespace app\admin\controller;


use think\Controller;

class Base extends Controller
{
    public function status()
    {
        $data = input('get.');
        if(empty($data['id'])) {
            $this->error('ID不合法');
        }
        if(!is_numeric($data['status'])) {
            $this->error('status不合法');
        }

        // 获取控制器
        $model = request()->controller();
        $res = model($model)->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($res) {
            $this->success('修改成功');
        }else {
            $this->error('修改失败');
        }
    }
}