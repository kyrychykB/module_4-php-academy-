<?php
/**
 * Created by PhpStorm.
 * User: UM
 * Date: 9/22/2017
 * Time: 2:19 PM
 */

namespace app\controllers;

use Yii;
use app\models\Post;
use app\models\Tag;
use yii\web\Response;
use yii\web\Controller;
use yii\data\Pagination;

class SearchController extends Controller
{
    const PAGE_SIZE = 5;

    public function actionIndex($q = '')
    {
        $q = trim($q);
        $query = Post::find()
            ->where(['like', 'title', $q]);

        $pagination = new Pagination([
            'totalCount' => $query->count(),
            'pageSize' => self::PAGE_SIZE,
            'forcePageParam' => false,
            'pageSizeParam' => false
        ]);

        $posts = $query->offset($pagination->offset)->limit($pagination->limit)->all();

        return $this->render('index', compact('posts', 'q', 'pagination'));
    }

    public function actionTag($tag_id)
    {
        $tag = Tag::findOne($tag_id);

        $query = Post::find()
                ->select(['post.id', 'post.title'])
                ->innerJoin('post_tag', '`post`.`id`=`post_tag`.`post_id` AND `post_tag`.`tag_id`=' . $tag_id);

        $pagination = new Pagination([
            'totalCount' => $query->count(),
            'pageSize' => self::PAGE_SIZE,
            'forcePageParam' => false,
            'pageSizeParam' => false
        ]);

        $posts = $query->offset($pagination->offset)->limit($pagination->limit)->all();

        return $this->render('view', compact('posts', 'tag', 'pagination'));
    }

    public function actionAjaxHint($title)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        return Tag::find()->select(['id', 'title'])->where(['like', 'title', $title])->all();
    }
}