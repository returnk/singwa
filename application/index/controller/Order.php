<?php
namespace app\index\controller;

use think\Controller;

class Order extends Base
{
    public function index()
    {
        $user = $this->getLoginUser();
        if(!$user) {
            $this->error('请登录','user/login');
        }
        $id = input('get.id',0,'intval');
        if(!$id) {
            $this->error('参数不合法');
        }
        $dealCount = input('get.deal_count',0,'intval');
        $totalPrice = input('get.total_price');
        $deal = model('deal')->find($id);
        if(!$deal || $deal->status != 1) {
            $this->error('商品不存在');
        }
        // 来源不存在时
        if(empty($_SERVER['HTTP_REFERER'])){
            $this->error('请求不合法');
        }
        // common 定义的
        $orderSn = setOrderSn();
        // 组装数据入库
        $data = [
            'out_trade_no' => $orderSn,
            'user_id' => $user->id,
            'username' => $user->username,
            'deal_id' => $id,
            'deal_count' => $dealCount,
            'total_price' => $totalPrice,
            'referer' => $_SERVER['HTTP_REFERER']
        ];
        try{
            $orderId = model('Order')->add($data);
        }catch(\Exception $e) {
            $this->error('订单处理失败');
        }
        $this->redirect('pay/index',['id'=>$orderId]);

    }
    
    public function confirm()
    {
        // 判断用户是否存在
        if(!$this->getLoginUser()) {
            $this->error('请登录','user/login');
        }
        // deal的ID
        $id = input('get.id',0,'intval');
        if(!$id) {
            $this->error('参数不合法');
        }
        $count = input('get.count',1,'intval');
//        $count = 2;
        $deal = model('deal')->find($id); // 返回的是数组 视频里是对象
//        echo model('deal')->getLastSql();exit;
        if(!$deal || $deal->status != 1) {
            $this->error('商品不存在');
        }
        return $this->fetch('',[
            'controller'=> 'pay',
            'count' => $count,
            'deal' => $deal,
        ]);
    }
}
