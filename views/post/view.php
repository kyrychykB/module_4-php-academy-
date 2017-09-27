<?php

/* @var $this yii\web\View */
/* @var $post app\models\Post */
/* @var $post_category app\models\PostCategory */
/* @var $comment app\models\Comment */

use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\widgets\ActiveForm;

$this->title = $post->title;
$this->params['breadcrumbs'][] = ['label' => $post_category->title, 'url' => ['/post-category/view', 'id' => $post_category->id]];
$this->params['breadcrumbs'][] = $this->title;


$this->registerJs(
    '$("document").ready(function(){
        $("#new_comment").on("pjax:end", function() {
        $.pjax.reload({container:"#comments"});  //Reload GridView
    });
});'
);
?>


    <h1><?=$this->title?></h1>
    <?
        $image = $post->getImage();
        if(!empty($image))
            echo Html::img($image->getUrl(), ['alt' => $post->title]);
    ?>
    <div class="clearfix views_counter" data-id="<?=$post->id?>" style="margin-top: 20px">
        <div class="views_counter_current">
            Current reading
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <span class="view_current"><?=$post->view_current?></span>
        </div>
        <div class="views_counter_total">
            Total views
            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
            <span class="view_total"><?=$post->view_total?></span>
        </div>
    </div>
    <div class="tags" style="margin-top: 20px">
        <?
        $tags = $post->tags;
        foreach ($tags as $tag) {
            echo Html::a($tag->title, ['search/tag', 'tag_id' => $tag->id], ['class' => 'btn btn-info', 'style' => 'margin-right: 5px']);
        }
        ?>
    </div>

    <div class="post_description" style="margin-top: 30px">
        <h3>Post description</h3>
        <p><?= $post->description?></p>
    </div>

    <? if(!empty($post_comments)): ?>
        <h3>Comments:</h3>
    <? else: ?>
        <? if (!Yii::$app->user->isGuest): ?>
            <h3>Live first comment</h3>
        <? endif;?>
    <? endif; ?>

    <?php Pjax::begin(['id' => 'comments']) ?>
        <? if(!empty($post_comments)): ?>
                <? foreach ($post_comments as $post_comment) : ?>
                    <div class="media" style="padding-left: 20px">
                        <div class="media-left">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading clearfix">
                                <b><?=$post_comment->user->username?></b>
                                <span
                                   class="comment_like pull-right"
                                   style="text-decoration: none"
                                   data-comment_id = "<?= $post_comment->comment->id ?>"
                                >
                                    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                    <span class="total_like"><?=$post_comment->comment->totalLikes?></span>
                                </span>
                            </h4>
                            <p><?=$post_comment->comment->description?></p>
                        </div>
                    </div>
                <? endforeach;?>
        <? endif; ?>
    <?php Pjax::end() ?>

    <? if (Yii::$app->user->isGuest): ?>
        <h3> To live comment you need to</h3>
        <?=Html::a('Login', ['/site/login'], ['class' => 'btn btn-primary'])?>
    <? else: ?>
        <?php Pjax::begin(['id' => 'new_comment']) ?>
        <?php $form = ActiveForm::begin(['options' => ['data-pjax' => true]]); ?>

        <?= $form->field($comment, 'description')->textarea(['rows' => 6])->label('your comment:') ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Submit') : Yii::t('app', 'Submit'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>
        <?php Pjax::end(); ?>
    <? endif;?>
