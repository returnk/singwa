<?php
namespace app\admin\validate;
use think\Validate;

class Category extends Validate
{
    protected $rule = [
        'name|分类名称'=>'require|max:1000',
        'parent_id'=>'number',
        'id'=> 'number',
        'status|状态'=> 'in:-1,0,1',
        'listorder'=> 'number',
    ];

    protected  $scene = [
        'add' => ['name', 'parent_id', 'id'],// 添加
        'listorder' => ['id', 'listorder'], //排序
        'status' => ['id', 'status'],
    ];

}