<?php
use yii\helpers\Html;
?>
<? if (!empty($blocks)): ?>
    <div class="thumbnail_list" style="margin-top: 100px">
        <? foreach ($blocks as $block): ?>
            <div class="thumbnail">
                <?
                $image = $block->getImage();
                if(!empty($image))
                    echo Html::img($image->getUrl('x150'), ['alt' => $block->title]); ;
                ?>
                <h5><?=$block->title?></h5>
                <p><?=$block->price?> $</p>
                <?= Html::a($block->site_url, $block->site_url, ['target' => '_blank', 'rel' => 'nofollow', 'style' => 'font-size:12px']) ?>
            </div>
        <? endforeach;?>
    </div>
<? endif; ?>