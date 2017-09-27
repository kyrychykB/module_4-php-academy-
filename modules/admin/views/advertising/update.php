<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Adversting */

$this->title = 'Update Adversting: ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Adverstings', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="adversting-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
