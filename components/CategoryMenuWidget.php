<?php
/**
 * Created by PhpStorm.
 * User: UM
 * Date: 04.05.2017
 * Time: 16:47
 */

namespace app\components;
use yii\base\Widget;
use app\models\PostCategory;
use Yii;

class CategoryMenuWidget extends Widget
{
    public $template;
    public $data;
    public $tree;
    public $menuHtml;
    public $model;

    public function init()
    {
        parent::init();
        if($this->template === null || $this->template == "") {
            $this->template = 'menu';
        }
        $this->template .= '.php';
    }

    public function run()
    {
        //get cache
//        if($this->template == 'menu.php') {
//            $menu = Yii::$app->cache->get('category_menu');
//            if ($menu) return $menu;
//        }

        $this->data = PostCategory::find()->indexBy('id')->asArray()->all();
        $this->tree = $this->getTree($this->data);
        $this->menuHtml = $this->getMenuHtml($this->tree);

        //set cache
//        if($this->template == 'menu.php') {
//            Yii::$app->cache->set('category_menu', $this->menuHtml, 60);
//        }

        return $this->menuHtml;
    }

    public function getTree($array)
    {
        $tree = [];
        foreach ($array as $id => &$node) {
            if(!$node['parent_id'])
                $tree[$id] = &$node;
            else
                $array[$node['parent_id']]['childs'][$node['id']] = &$node;
        }
        return $tree;
    }

    protected function getMenuHtml($tree, $tab = '')
    {
        $str = '';
        foreach ($tree as $category) {
            $str .= $this->categoryToTemplate($category, $tab);
        }
        return $str;
    }

    protected  function categoryToTemplate($category, $tab)
    {
        ob_start(); // buffer view
        include __DIR__ . '/CategoryMenuWidgetTemplate/' .$this->template;
        return ob_get_clean();
    }

}