<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Index extends Controller
{
    public function index()
    {

        return $this->fetch();
    }

    public function test()
    {
        return '后台管理';
    }
}
