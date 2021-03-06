<?php

namespace app\common\model;

use think\Model;

class Order extends BaseModel
{
    protected $autoWriteTimestamp = true;

    public function add($data)
    {
        $data['status'] = 1;
        $this->save($data);
        return $this->id;
    }

}
