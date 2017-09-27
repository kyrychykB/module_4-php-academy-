<?php

use yii\helpers\Html;
use kartik\file\FileInput;
use kartik\select2\Select2;
use yii\widgets\ActiveForm;
use app\components\CategoryMenuWidget;

/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $form yii\widgets\ActiveForm */
/* @var $all_tags array */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin([
            'options' => [
                'enctype' => 'multipart/form-data'
            ]
    ]); ?>

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

    <div class="form-group field-post-category_id has-success">
        <label class="control-label" for="post-category_id">Category</label>
        <select id="post-category_id" class="form-control" name="Post[category_id]" aria-invalid="false">
            <?=CategoryMenuWidget::widget(['template' => 'select_product', 'model' => $model])?>
        </select>
        <div class="help-block"></div>
    </div>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'current_tags')->widget(Select2::classname(), [
        'data' => \yii\helpers\ArrayHelper::map($all_tags, 'title', 'title'),
        'options' => ['placeholder' => 'Select tags', 'multiple' => true],
        'pluginOptions' => [
            'tags' => true,
            'tokenSeparators' => [',', ' '],
            'maximumInputLength' => 10
        ],
    ])->label('Tag Multiple');?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
