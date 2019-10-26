<?php
namespace app\index\controller;

use think\Controller;

class Featured extends Base
{
    // 自己创建的
    public function index()
    {
        return $this->fetch();
    }
}
