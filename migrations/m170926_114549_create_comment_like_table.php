<?php

use yii\db\Migration;

/**
 * Handles the creation of table `comment_like`.
 */
class m170926_114549_create_comment_like_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('comment_like', [
            'id' => $this->primaryKey(),
            'comment_id' => $this->integer(),
            'user_id' => $this->integer(),
        ]);

        /**
         * creates index for column `comment_id`
         */
        $this->createIndex(
            'idx-comment_like-comment_id',
            'comment_like',
            'comment_id'
        );

        /**
         * add foreign key `comment_id` for table `comment_like`
         */
        $this->addForeignKey(
            'fk-comment_like-comment_id',
            'comment_like',
            'comment_id',
            'comment',
            'id',
            'CASCADE'
        );

        /**
         * creates index for column `user_id`
         */
        $this->createIndex(
            'idx-comment_like-user_id',
            'comment_like',
            'user_id'
        );

        /**
         * add foreign key `user_id` for table `comment_like`
         */
        $this->addForeignKey(
            'fk-comment_like-user_id',
            'comment_like',
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
         * drops foreign key `fk-comment_like-comment_id` for table `comment_like`
         */
        $this->dropForeignKey(
            'fk-comment_like-comment_id',
            'comment_like'
        );

        /**
         * drops index `idx-comment_like-comment_id` for column `comment_like`
         */
        $this->dropIndex(
            'idx-comment_like-comment_id',
            'comment_like'
        );

        /**
         * drops foreign key `fk-comment_like-user_id` for table `comment_like`
         */
        $this->dropForeignKey(
            'fk-comment_like-user_id',
            'comment_like'
        );

        /**
         * drops index `idx-comment_like-user_id` for column `comment_like`
         */
        $this->dropIndex(
            'idx-comment_like-user_id',
            'comment_like'
        );

        $this->dropTable('comment_like');
    }
}
