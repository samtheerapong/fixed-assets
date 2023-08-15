<?php

use common\models\User;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\User $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">

            <?= $form->field($model, 'username')->textInput() ?>

            <?= $form->field($model, 'password_hash')->passwordInput() ?>

            <?= $form->field($model, 'thai_name')->textInput() ?>

            <?= $form->field($model, 'email')->textInput() ?>

            <?= $form->field($model, 'status')->dropDownList([
                User::STATUS_ACTIVE => Yii::t('app', 'Active'),
                User::STATUS_INACTIVE => Yii::t('app', 'Inactive'),
                // User::STATUS_DELETED => Yii::t('app', 'Delete'),
            ]) ?>

            <?= $form->field($model, 'role')->dropDownList([
                User::ROLE_ADMIN => Yii::t('app', 'Admin'),
                User::ROLE_QA => Yii::t('app', 'QA'),
                User::ROLE_SALE => Yii::t('app', 'Sale'),
                User::ROLE_MANAGER => Yii::t('app', 'Manager'),
                User::ROLE_USER => Yii::t('app', 'User'),
            ]) ?>

        </div>
        <div class="card-footer">
            <div class="form-group">
                <div class="d-grid gap-2">
                    <?= Html::submitButton('<i class="fas fa-save"></i> ' . Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
                </div>
            </div>

        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>