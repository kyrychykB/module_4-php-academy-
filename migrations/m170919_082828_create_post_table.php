<?php

use yii\db\Migration;

/**
 * Handles the creation of table `post`.
 */
class m170919_082828_create_post_table extends Migration
{
    public function up()
    {
        /**
         * Creates `post` table
         * @inheritdoc
         */
        $this->createTable('post', [
            'id' => $this->primaryKey(),
            'category_id' => $this->integer(),
            'title' => $this->string(),
            'description' => $this->text(),
            'created_at' => $this->dateTime()->notNull(),
            'updated_at' => $this->dateTime()->notNull(),
            'view_total' => $this->integer()->defaultValue(0),
            'view_current' => $this->integer()->defaultValue(0),
        ]);
        /**
         * Creates index for column `category_id`.
         */
        $this->createIndex(
            'idx-post-category_id',
            'post',
            'category_id'
        );

        /**
         * Adds foreign key `category_id` for table `post`.
         */
        $this->addForeignKey(
            'fk-post-category_id',
            'post',
            'category_id',
            'post_category',
            'id',
            'CASCADE'
        );

    }

    public function down()
    {
        /**
         * Drops foreign key `fk-post-category_id` for table `post`.
         */
        $this->dropForeignKey(
            'fk-post-category_id',
            'post'
        );

        /**
         * Drops index `idx-post-category_id` for column `category_id`.
         */
        $this->dropIndex(
            'idx-post-category_id',
            'post'
        );

        /**
         * Drops `post` table
         * @inheritdoc
         */
        $this->dropTable('post');
    }
}
