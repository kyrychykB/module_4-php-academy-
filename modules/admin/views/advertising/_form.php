<?php

use yii\helpers\Html;
use kartik\file\FileInput;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Advertising */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="adversting-form">

    <?php $form = ActiveForm::begin(); ?>
    <?php
    $image = $model->getImage();
    $initialPreview = [];
    if(!empty($image)) {
        $initialPreview[] = $image->getUrl();
    }
    ?>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'image')->widget(FileInput::classname(), [
                'options'=>[
                    'multiple'=> false
                ],
                'pluginOptions' => [
                    'initialPreview' => $initialPreview,
                    'initialPreviewAsData'=>true,
                    'showCaption' => false,
                    'showRemove' => false,
                    'showUpload' => false,
                    'browseClass' => 'btn btn-primary btn-block',
                    'browseIcon' => '<i class="glyphicon glyphicon-camera"></i> ',
                    'browseLabel' =>  'Photo'
                ]
            ]);?>
        </div>
    </div>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'price')->textInput() ?>

    <?= $form->field($model, 'site_url')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->dropDownList(\app\models\Advertising::getStatusList()) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
