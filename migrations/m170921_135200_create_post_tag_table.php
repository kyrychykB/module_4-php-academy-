<?php

use yii\db\Migration;

/**
 * Handles the creation of table `post_tag`.
 */
class m170921_135200_create_post_tag_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('post_tag', [
            'id' => $this->primaryKey(),
            'post_id' => $this->integer(),
            'tag_id' => $this->integer(),
        ]);

        /**
         * creates index for column `post_id`
         */
        $this->createIndex(
            'idx-post_tag-post_id',
            'post_tag',
            'post_id'
        );

        /**
         * creates index for column `post_id`
         */
        $this->createIndex(
            'idx-post_tag-tag_id',
            'post_tag',
            'tag_id'
        );

        /**
         * add foreign key `post_id` for table `post_tag`
         */
        $this->addForeignKey(
            'fk-post_tag-post_id',
            'post_tag',
            'post_id',
            'post',
            'id',
            'CASCADE'
        );

        /**
         * add foreign key `tag_id` for table `post_tag`
         */
        $this->addForeignKey(
            'fk-post_tag-tag_id',
            'post_tag',
            'tag_id',
            'tag',
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
         * drops foreign key `fk-post_tag-post_id` for table `post_tag`
         */
        $this->dropForeignKey(
            'fk-post_tag-post_id',
            'post_tag'
        );
        /**
         * drops foreign key `fk-post_tag-tag_id` for table `post_tag`
         */
        $this->dropForeignKey(
            'fk-post_tag-tag_id',
            'post_tag'
        );

        /**
         * drops index `idx-post_tag-post_id` for column `post_tag`
         */
        $this->dropIndex(
            'idx-post_tag-post_id',
            'post_tag'
        );

        /**
         * drops index `idx-post_tag-tag_id` for column `post_tag`
         */
        $this->dropIndex(
            'idx-post_tag-tag_id',
            'post_tag'
        );

        $this->dropTable('post_tag');
    }
}
