<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\CommentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Comments';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="comment-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'description:ntext',

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
