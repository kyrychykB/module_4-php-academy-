<?php

use yii\db\Migration;

/**
 * Handles the creation of table `advertising`.
 */
class m170926_135251_create_adversting_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('advertising', [
            'id' => $this->primaryKey(),
            'title' => $this->string(),
            'price' => $this->float()->notNull()->defaultValue(0),
            'site_url' => $this->string(),
            'status' => $this->smallInteger()
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('advertising');
    }
}
