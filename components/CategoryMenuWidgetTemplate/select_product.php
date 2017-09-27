<option
    value="<?=$category['id']?>"
    <?
        if($category['id'] == $this->model->category_id) echo 'selected';
    ?>
>
    <?=$tab . $category['title']?>
</option>
<?php if(isset($category['childs'])): ?>
    <?=$this->getMenuHtml($category['childs'], $tab . '	&nbsp-&nbsp'); ?>
<?php endif; ?>