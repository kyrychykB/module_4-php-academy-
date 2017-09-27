<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\components\CategoryMenuWidget;

/* @var $this yii\web\View */
/* @var $model app\models\PostCategory */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-category-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="form-group field-postcategory-parent_id has-success">
        <label class="control-label" for="postcategory-parent_id">Parent ID</label>
        <select id="postcategory-parent_id" class="form-control" name="PostCategory[parent_id]" aria-invalid="false">
            <option value="0">Root category</option>
            <?=CategoryMenuWidget::widget(['template' => 'select', 'model' => $model])?>
        </select>

        <div class="help-block"></div>
    </div>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
