<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $all_tags array */

$this->title = 'Create Post';
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'all_tags' => $all_tags
    ]) ?>

</div>
