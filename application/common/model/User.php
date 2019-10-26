<?php
namespace app\common\model;

use think\Model;

class User extends BaseModel
{
    // 注册的
    public function add($data = [])
    {
        // 如果提交的数据不是数组
        if(!is_array($data)) {
            exception('传递的数据不是数组');
        }
        $data['status'] = 1;
        return $this->data($data)->allowField(true)->save();
    }

    // 根据用户查找用户信息 前台用户
    public function getUserByUsername($username)
    {
        if(!$username) {
            exception('用户名不合法');
        }

        $map = ['username'=>$username];
        return $this->where($map)->find();
    }
}