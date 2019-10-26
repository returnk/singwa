<?php

namespace app\common\model;

use think\Model;

class Category extends BaseModel
{
    // 添加分类下的一级栏目
    public function getNormalFirstCategory() {
        $data = [
            'status' => 1,
            'parent_id' => 0,
        ];

        $order = [
            'id' => 'desc',
        ];

        return $this->where($data)
            ->order($order)
            ->select();
    }

    // 获取栏目列表下的一级栏目
    public function getFirstCategorys($parentId = 0) {
        $map[] = ['parent_id','eq',$parentId];
        $map[] = ['status','neq',-1];

        $order =[
            'listorder' => 'desc',
            'id' => 'desc',
        ];
        $result = $this->where($map)
            ->order($order)
            ->paginate(8);
        // echo $this->getLastSql();
        return $result;

    }

    // 获取所属分类下的信息 bis/register/index
    public function getNormalCategorysByParentId($parentId=0)
    {
        $data = [
            'status' => 1,
            'parent_id' => $parentId,
        ];
        $order = [
            'id' => 'desc',
        ];
        return $this->where($data)
            ->order($order)
            ->select();
    }

    // 获取首页的全部分类 默认显示5条
    public function getNormalRecommendCategoryByParentId($id=0, $limit=5) {
        $data = [
            'parent_id' => $id,
            'status' => 1,
        ];
        $order = [
            'listorder' => 'desc',
            'id' => 'desc',
        ];
        $result = $this->where($data)
            ->order($order);
        if($limit) {
            $result = $result->limit($limit);
        }
        return $result->select();

    }

    public function getNormalCategoryIdParentId($ids) {
        $data = [
            ['parent_id','in',implode(',',$ids)],
            ['status','eq',1],
//            'parent_id' => ['in', implode(',', $ids)],
//            'status' => 1,
        ];

        $order = [
            'listorder' => 'desc',
            'id' => 'desc',
        ];

        $result = $this->where($data)
            ->order($order)
            ->select();

        return $result;
    }
}
