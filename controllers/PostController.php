<?php
/**
 * Created by PhpStorm.
 * User: UM
 * Date: 9/21/2017
 * Time: 10:53 AM
 */

namespace app\controllers;

use app\models\Comment;
use app\models\PostComment;
use Yii;
use app\models\Post;
use yii\web\Response;
use yii\web\Controller;
use app\models\PostCategory;

class PostController extends Controller
{
    public function actionView($id)
    {
        $post = Post::findOne($id);
        $comment = new Comment();
        if ($comment->load(Yii::$app->request->post()) && $comment->save())
        {
            $post_comment = new PostComment();
            $post_comment->post_id = $post->id;
            $post_comment->comment_id = $comment->id;
            $post_comment->user_id = Yii::$app->user->id;
            $post_comment->save();

            $comment = new Comment();
        }

        $post_comments = PostComment::findAll(['post_id' => $post->id]);
        $post_category = PostCategory::findOne(['id' => $post->category_id]);

        return $this->render('view', compact('post', 'post_category', 'comment', 'post_comments'));
    }



    public function actionRandomViews($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;

        $post = Post::findOne($id);
        $result = ['status' => false, 'view_current' => $post->view_current, 'view_total' => $post->view_total];

        $post->view_current = $post->generateRandomViews();
        $post->view_total += $post->view_current;

        if($post->save()) {
            $result = ['status' => true, 'view_current' => $post->view_current, 'view_total' => $post->view_total];
        }

        return $result;
    }
}