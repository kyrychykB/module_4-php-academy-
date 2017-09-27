<?php
/**
 * Created by PhpStorm.
 * User: UM
 * Date: 9/25/2017
 * Time: 11:59 AM
 */

namespace app\controllers;

use Yii;
use yii\web\Controller;

class RoleController extends Controller
{
    private function actionIndex()
    {
        $admin = Yii::$app->authManager->createRole('admin');
        $admin->description = 'Admin';
        Yii::$app->authManager->add($admin);

        $user = Yii::$app->authManager->createRole('user');
        $user->description = 'User';
        Yii::$app->authManager->add($user);

        return 'Roles created';
    }

    private function actionPermit()
    {
        $permit = Yii::$app->authManager->createPermission('canAdmin');
        $permit->description = 'Permission to login admin panel';
        Yii::$app->authManager->add($permit);
        return 'Permission created';
    }

    private function actionChild()
    {
        $role_admin = Yii::$app->authManager->getRole('admin');
        $permit = Yii::$app->authManager->getPermission('canAdmin');
        Yii::$app->authManager->addChild($role_admin, $permit);

        return 'Child created';
    }

    private function actionUser()
    {
        $userRole = Yii::$app->authManager->getRole('admin');
        Yii::$app->authManager->assign($userRole, Yii::$app->user->getId());

        return 'User added';
    }

}