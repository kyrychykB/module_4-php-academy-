<?php

use yii\db\Migration;

/**
 * Handles the creation of table `post_comment`.
 */
class m170925_140643_create_post_comment_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('post_comment', [
            'id' => $this->primaryKey(),
            'post_id' => $this->integer(),
            'comment_id' => $this->integer(),
            'user_id' => $this->integer(),
        ]);

        /**
         * creates index for column `post_id`
         */
        $this->createIndex(
            'idx-post_comment-post_id',
            'post_comment',
            'post_id'
        );

        /**
         * add foreign key `post_id` for table `post_comment`
         */
        $this->addForeignKey(
            'fk-post_comment-post_id',
            'post_comment',
            'post_id',
            'post',
            'id',
            'CASCADE'
        );

        /**
         * creates index for column `comment_id`
         */
        $this->createIndex(
            'idx-post_comment-comment_id',
            'post_comment',
            'comment_id'
        );

        /**
         * add foreign key `comment_id` for table `post_comment`
         */
        $this->addForeignKey(
            'fk-post_comment-comment_id',
            'post_comment',
            'comment_id',
            'comment',
            'id',
            'CASCADE'
        );

        /**
         * creates index for column `user_id`
         */
        $this->createIndex(
            'idx-post_comment-user_id',
            'post_comment',
            'user_id'
        );

        /**
         * add foreign key `user_id` for table `post_comment`
         */
        $this->addForeignKey(
            'fk-post_comment-user_id',
            'post_comment',
            'user_id',
            'user',
            'id',
            'CASCADE'
        );
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        /**
         * drops foreign key `fk-post_comment-post_id` for table `post_comment`
         */
        $this->dropForeignKey(
            'fk-post_comment-post_id',
            'post_comment'
        );

        /**
         * drops index `idx-post_comment-post_id` for column `post_comment`
         */
        $this->dropIndex(
            'idx-post_comment-post_id',
            'post_comment'
        );

        /**
         * drops foreign key `fk-post_comment-comment_id` for table `post_comment`
         */
        $this->dropForeignKey(
            'fk-post_comment-comment_id',
            'post_comment'
        );

        /**
         * drops index `idx-post_comment-comment_id` for column `post_comment`
         */
        $this->dropIndex(
            'idx-post_comment-comment_id',
            'post_comment'
        );

        /**
         * drops foreign key `fk-post_comment-user_id` for table `post_comment`
         */
        $this->dropForeignKey(
            'fk-post_comment-user_id',
            'post_comment'
        );

        /**
         * drops index `idx-post_comment-user_id` for column `post_comment`
         */
        $this->dropIndex(
            'idx-post_comment-user_id',
            'post_comment'
        );

        $this->dropTable('post_comment');
    }
}
