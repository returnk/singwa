<?php
namespace app\bis\controller;
use think\Controller;
class Login extends Controller
{

    // 跟着上面做的 用户登录
    public function index()
    {
        if(request()->isPost()) {
            $data = input('post.');
            $ret = model('BisAccount')->get(['username'=>$data['username']]);
            // 判断用户是否存在
            if(!$ret || $ret->status != 1) {
                $this->error('该用户不存在，或者用户未被审核通');
            }
            // password
            if($ret->password != md5($data['password'])) {
                $this->error('密码不正确');
            }
            model('BisAccount')->updateById(['last_login_time'=>time()],$ret->id);
            // 保存用户信息
            session('bisAccount',$ret,'bis');
            return $this->success('成功','index/index');
        }else {
            $account = session('bisAccount','','bis');
            if($account && $account->id) {
               return $this->redirect('index/index');
            }
            return $this->fetch();
        }
    }

    public function logout()
    {
        session(null,'bis');
        $this->redirect('login/index');
    }
}