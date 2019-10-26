<?php
namespace app\api\controller;

use think\Controller;
use think\Request;
use think\File;

class Image extends Controller
{
    public function upload() {
        $file = request()->file('file');
        // 给定一个目录
        $info = $file->move('upload');
        $data = '/' . $info->getPathname();
        if($info && $info->getPathname()) {
            return json(['status'=>1,'message'=>'success','data'=>$data]);
//            return show(1, 'success','/'.$info->getPathname()); //不知道 自定义show不行
        }
//        return show(0,'upload error');
        return json(['status'=>0,'message'=>$file->getError()]);
    }
}