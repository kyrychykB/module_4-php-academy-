<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\AdverstingSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Adverstings';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="adversting-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Adversting', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'attribute' => 'image',
                'format' => 'html',
                'value' => function($data){
                    $image = $data->getImage();
                    if(!empty($image)) {
                        return Html::a(Html::img($image->getUrl('80x60'), ['alt' => $data->title, 'width' => 80, 'height' => 60]), ['/post/view', 'id' => $data->id]) ;
                    } else {
                        return false;
                    }
                }
            ],
            [
                'attribute' => 'id',
                'format' => 'html',
                'options' => ['style' => 'width: 65px; max-width: 65px;'],
                'contentOptions' => ['style' => 'width: 65px; max-width: 65px; font-size: 18px'],
                'value' => function($data) {
                    return "<b>{$data->id}</b>";
                }
            ],
            'title',
            'price',
            [
                'attribute' => 'status',
                'filter' => \app\models\Advertising::getStatusList(),
                'format' => 'html',
                'value' => function($data){
                    $result = '';
                    $name = $data->getStatusName();
                    if($data->status == 0) {
                        $result = "<span class=\"label label-info\">{$name}</span>";
                    } elseif ($data->status == 1) {
                        $result = "<span class=\"label label-success\">{$name}</span>";
                    }
                    return $result;
                },
            ],
            'site_url:url',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view}{update}{delete}',
                'options' => ['style' => 'width: 160px; max-width: 160px;'],
                'contentOptions' => ['style' => 'width: 160px; max-width: 160px;'],
                'buttons' => [
                    'view' => function ($url, $data) {
                        return Html::a('<button type="button" class="btn btn-info" style="margin-right: 5px"><span class="glyphicon glyphicon-eye-open"></span></button>', $url, [
                            'title' => Yii::t('app', 'view'),
                        ]);
                    },
                    'update' => function ($url, $data) {
                        return Html::a('<button type="button" class="btn btn-primary" style="margin-right: 5px"><span class="glyphicon  glyphicon-pencil"></span></button>', $url, [
                            'title' => Yii::t('app', 'update'),
                        ]);
                    },
                    'delete' => function ($url, $data) {
                        return Html::a('<button type="button" class="btn btn-danger" style="margin-right: 5px"><span class=" glyphicon glyphicon-trash"></span></button>', $url, [
                            'title' => Yii::t('app', 'delete'),
                        ]);
                    }
                ],
            ],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
