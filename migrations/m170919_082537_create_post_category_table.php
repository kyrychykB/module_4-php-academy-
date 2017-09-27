<?php

use yii\db\Migration;

/**
 * Handles the creation of table `post_category`.
 */
class m170919_082537_create_post_category_table extends Migration
{
    public function up()
    {
        /**
         * Creates `post_category` table
         * @inheritdoc
         */
        $this->createTable('post_category', [
            'id' => $this->primaryKey(),
            'parent_id' => $this->integer()->notNull()->defaultValue(0),
            'title' => $this->string()
        ]);
    }

    public function down()
    {
        /**
         * Drops `post_category` table
         * @inheritdoc
         */
        $this->dropTable('post_category');
    }
}
