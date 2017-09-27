<?php

/* @var $this yii\web\View */
/* @var $user app\models\User */
/* @var $user_comments app\models\PostComment */
/* @var $pagination yii\data\Pagination */

use yii\helpers\Html;
use yii\widgets\LinkPager;

$this->title = $user->username;
$this->params['breadcrumbs'][] = $this->title;
?>

    <h1><?=$this->title?></h1>

<? if(!empty($user_comments)): ?>
    <ul class="list-group">
        <? foreach ($user_comments as $user_comment): ?>
            <li class="list-group-item">
                <?=$user_comment->comment->description?>
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
        <p>Sorry, but there are no posts in this category yet</p>
    </div>
<? endif;?>