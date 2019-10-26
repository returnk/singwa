<?php
namespace app\index\controller;

use think\Controller;

class User extends Controller
{
    // 前台登录
    public function login()
    {
        $user = session('o2o_user','', 'o2o');
        if($user) {
            $this->redirect(url('index/index'));
        }
        return $this->fetch();
    }

    // 前台登录处理
    public function logincheck()
    {
        if(!request()->isPost()) {
            $this->error('请求类型错误');
        }
        $data = input('post.');
        // validate校验

        // 根据用户名检索数据
        try{
            $user = model('User')->getUserByUsername($data['username']);
        }catch(\Exception $e) {
            $this->error($e->getMessage());
        }
        // 判断用户是否存在
        if(!$user && $user->status != 1) {
            $this->error('该用户不存在');
        }
        // 判断密码
        if(md5($data['password']) != $user['password']) {
            $this->error('密码不正确');
        }
        // 通过
        model('User')->updateById(['last_login_time'=>time()],$user->id);
        // 把用户信息记录到session
        session('o2o_user',$user,'o2o');
        $this->success('登录成功','index/index');

    }

    // 前台注册
    public function register()
    {
        if(request()->isPost()) {
            $data = input('post.');
            if(!captcha_check($data['verifyCode'])) {
                $this->error('验证码不正确');
            }else {
                // 检验validate
                if($data['password'] != $data['repassword']) {
                    $this->error('两次输入的密码不一样');
                }
                // 密码加密
                $data['password'] = md5($data['password']);
                try{
                    $res = model('User')->add($data);
                }catch (\Exception $e) {
                    // 唯一错误信息
                    // SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry 'admin1' for key 'username'
                    $this->error($e->getMessage());
                }
                if($res) {
                    $this->success('注册成功','user/login');
                }else {
                    $this->success('注册失败');
                }
                $data['password'] = md5($data['password']);

            }
        }else {
            return $this->fetch();
        }
    }

    // 退出登录
    public function logout()
    {
        session(null,'o2o');
        $this->redirect('user/login');
    }

}
