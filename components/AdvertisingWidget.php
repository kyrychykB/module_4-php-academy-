<?php

namespace app\components;

use app\models\Advertising;
use yii\base\Widget;

class AdvertisingWidget extends Widget
{
    public $status;

    public function init()
    {
        parent::init();
        if($this->status == 'left') {
            $this->status = 0;
        } elseif ($this->status == 'right') {
            $this->status = 1;
        } else {
            $this->status = null;
        }
    }

    public function run()
    {
        $blocks = Advertising::find()->where(['status' => $this->status])->limit(4)->all();
        return $this->render('advertising', compact('blocks'));
    }
}