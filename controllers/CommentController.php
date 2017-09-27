<?php
/**
 * Created by PhpStorm.
 * User: UM
 * Date: 9/26/2017
 * Time: 2:31 PM
 */

namespace app\controllers;

use app\models\PostComment;
use app\models\User;
use Yii;
use yii\web\Response;
use yii\web\Controller;
use app\models\CommentLike;
use yii\data\Pagination;

class CommentController extends Controller
{
    const PAGE_SIZE = 5;

    public function actionList($user_id)
    {
        $user = User::findOne($user_id);
        $user_comments_query = PostComment::find()->where(['user_id' => $user_id]);

        if(empty($user) || empty($user_comments_query)) {
            throw new \yii\web\HttpException(404, 'No comments');
        }

        $pagination = new Pagination([
            'totalCount' => $user_comments_query->count(),
            'pageSize' => self::PAGE_SIZE,
            'forcePageParam' => false,
            'pageSizeParam' => false
        ]);

        $user_comments = $user_comments_query->offset($pagination->offset)->limit($pagination->limit)->all();

        return $this->render('list', compact('user', 'user_comments', 'pagination'));
    }

    public function actionLike($comment_id)
    {
        $user_id = Yii::$app->user->id;

        Yii::$app->response->format = Response::FORMAT_JSON;

        $comment = CommentLike::findOne(['comment_id' => $comment_id, 'user_id' => $user_id]);
        $result = ['status' => false, 'total_like' => 0];

        if(!empty($comment)) {
            $result['status'] = boolval($comment->delete());
        } else {
            $comment = new CommentLike();
            $comment->comment_id = $comment_id;
            $comment->user_id = $user_id;
            $result['status'] = $comment->save();
        }
        $result['total_like'] = CommentLike::find()->where(['comment_id' => $comment_id])->count();

        return $result;
    }
}