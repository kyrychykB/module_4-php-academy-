<?php

/* @var $this yii\web\View */
/* @var $post_categories app\models\PostCategory */
/* @var $latest_posts app\models\Post */
/* @var $top_commentators app\models\PostComment */

use yii\helpers\Html;

$this->title = 'Module 4';
?>
<div class="site-index">

    <h1><?=$this->title?></h1>

    <? //debug($latest_posts); die();?>
    <div class="body-content">
        <div class="row">
            <div class="col-md-12">
                <h3>Latest posts</h3>
                <div class="slider">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <? foreach ($latest_posts as $key => $post): ?>
                                <div class="item <? if($key == 0) echo 'active' ?>">

                                    <?
                                        $image = $post->getImage();
                                        if(!empty($image)) {
                                            echo Html::img($image->getUrl('750x400'), ['alt' => $post->title]);
                                        }
                                     ?>
                                    <div class="carousel-caption">
                                        <h3><?=$post->title?></h3>
                                        <p>
                                            <?=Html::a('Read more', ['post/view', 'id' => $post->id], ['class' => 'btn btn-primary'])?>
                                        </p>
                                    </div>
                                </div>
                            <? endforeach;?>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <h3>Categories</h3>
                        <? if(!empty($post_categories)):?>
                            <ul class="list-group">
                                <? foreach ($post_categories as $category): ?>
                                    <li class="list-group-item">
                                        <b><?= Html::a($category['title'], ['/post-category/view', 'id' => $category['id']])?></b>
                                    </li>
                                    <? if( is_array($category['posts'])): ?>
                                        <? foreach ($category['posts'] as $key => $post): ?>
                                            <? if($key < 5): ?>
                                                <li class="list-group-item" style="padding-left: 30px"><?= Html::a($post['title'], ['/post/view', 'id' => $post['id']])?></li>
                                            <? else:
                                                continue 2;
                                            endif;?>
                                        <? endforeach;?>
                                    <? endif; ?>
                                <? endforeach;?>
                            </ul>
                        <? endif; ?>
                    </div>
                    <div class="col-md-6">
                        <h3>Top commentators</h3>
                        <? if(!empty($top_commentators)):?>
                            <ul class="list-group">
                                <? foreach ($top_commentators as $commentator): ?>
                                    <li class="list-group-item">
                                        <b><?= Html::a($commentator['username'], ['/comment/list', 'user_id' => $commentator['user_id']])?></b>
                                    </li>
                                <? endforeach;?>
                            </ul>
                        <? endif; ?>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
