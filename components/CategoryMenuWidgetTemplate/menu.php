<?php
use yii\helpers\Url;

$id = Yii::$app->request->get('id');
$active = ($id == $category['id'] ) ? 'active' : '';
?>
<li>
    <a href="<?=Url::to(['/category/view', 'id' => $category['id']])?>" class="sidebar__category <?=$active?>">
        <span class="sidebar__cart__text">
            <?=$category['name']?>
        </span>
    </a>
    <?php if(isset($category['childs'])): ?>
        <ul class="list sidebar__category__child">
            <?=$this->getMenuHtml($category['childs']); ?>
        </ul>
    <?php endif; ?>
</li>

