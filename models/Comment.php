<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "comment".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $description
 * @property integer $like
 * @property integer $dislike
 *
 * @property PostComment[] $postComments
 */
class Comment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'comment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'required'],
            [['parent_id'], 'integer'],
            [['parent_id'], 'safe'],
            [['description'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'description' => 'Description',
            'like' => 'Like',
            'dislike' => 'Dislike',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPostComments()
    {
        return $this->hasMany(PostComment::className(), ['comment_id' => 'id']);
    }

    public function getTotalLikes()
    {
        return $this->hasMany(CommentLike::className(), ['comment_id' => 'id'])->count();
    }
}
