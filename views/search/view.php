<?php

/* @var $this yii\web\View */
/* @var $tag app\models\Tag */
/* @var $posts app\models\Post */
/* @var $pagination yii\data\Pagination */

use yii\helpers\Html;
use yii\widgets\LinkPager;

$this->title = 'Search results by tag: ' . $tag->title;
$this->params['breadcrumbs'][] = $this->title;
?>
<h1><?=$this->title?></h1>

<? if(!empty($posts)): ?>
    <ul class="list-group">
        <? foreach ($posts as $post): ?>
            <li class="list-group-item">
                <?= Html::a($post->title, ['post/view', 'id' => $post->id]) ?>
            </li>
        <? endforeach; ?>
    </ul>
    <?= LinkPager::widget([
        'pagination' => $pagination,
        'hideOnSinglePage' => true,
        'activePageCssClass' => 'active pagination_active'
    ]);
    ?>
<? else: ?>
    <div class="alert alert-info" role="alert">
        <p>Sorry, but there are no posts by your request</p>
    </div>
<? endif;?>
