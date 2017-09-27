
<option
        value="<?=$category['id']?>"
        <?
            if($category['id'] == $this->model->parent_id) echo 'selected';
            if($category['id'] == $this->model->id) echo 'disabled';
        ?>
    >
            <?=$tab . $category['title']?>
</option>
<?php if(isset($category['childs'])): ?>
    <?=$this->getMenuHtml($category['childs'], $tab . '	&nbsp-&nbsp'); ?>
<?php endif; ?>