<?php
/**
 * Created by PhpStorm.
 * User: UM
 * Date: 9/21/2017
 * Time: 9:58 AM
 */

namespace app\controllers;

use app\models\Post;
use yii\web\Controller;
use yii\data\Pagination;
use app\models\PostCategory;

class PostCategoryController extends Controller
{
    const PAGE_SIZE = 5;

    public function actionView($id)
    {
        $post_category = PostCategory::findOne($id);

        $posts_query = Post::find()->select(['id', 'title'])->where(['category_id' => $id])->orderBy(['created_at' => SORT_DESC]);
        $pagination = new Pagination([
            'totalCount' => $posts_query->count(),
            'pageSize' => self::PAGE_SIZE,
            'forcePageParam' => false,
            'pageSizeParam' => false
        ]);
        $posts = $posts_query->offset($pagination->offset)->limit($pagination->limit)->all();

        return $this->render('view', compact('post_category', 'posts', 'pagination'));
    }
}