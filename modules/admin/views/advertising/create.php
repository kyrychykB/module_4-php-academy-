<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Adversting */

$this->title = 'Create Adversting';
$this->params['breadcrumbs'][] = ['label' => 'Adverstings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="adversting-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
