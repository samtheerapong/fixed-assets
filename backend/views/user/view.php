<?php

use common\models\User;
use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var common\models\User $model */

$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="user-view">
    <div style="display: flex; justify-content: space-between;">
        <p>
            <?= Html::a('<i class="fas fa-chevron-left"></i> ' . Yii::t('app', 'Go Back'), ['index'], ['class' => 'btn btn-primary']) ?>
        </p>

        <p style="text-align: right;">
            <?= Html::a('<i class="fas fa-edit"></i> ' . Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-warning']) ?>

            <?= Html::a('<i class="fas fa-trash"></i> ' . Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ]) ?>

        </p>
    </div>
    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">

            <?= DetailView::widget([
                'model' => $model,
                'template' => '<tr><th style="width: 200px;">{label}</th><td> {value}</td></tr>',
                'attributes' => [
                    // 'id',
                    'username',
                    'thai_name',
                    // 'auth_key',
                    // 'password_hash',
                    // 'password_reset_token',
                    'email:email',
                    // 'status',
                    [
                        'attribute' => 'status',
                        'format' => 'raw',
                        'value' => function ($model) {
                            return $model->status === User::STATUS_ACTIVE
                                ? '<span class="badge" style="background-color: #1A5D1A">Active</span>'
                                : '<span class="badge" style="background-color: #FE0000">In Active</span>';
                        },
                    ],
                    // 'role',
                    [
                        'attribute' => 'role',
                        'format' => 'raw',
                        'value' => function ($model) {
                            $roleLabels = [
                                User::ROLE_ADMIN    => '<span class="badge" style="background-color: #0079FF">Admin</span>',
                                User::ROLE_QA       => '<span class="badge" style="background-color: #FFB84C">QA</span>',
                                User::ROLE_SALE     => '<span class="badge" style="background-color: #7149C6">Sale</span>',
                                User::ROLE_MANAGER  => '<span class="badge" style="background-color: #F31559">Manager</span>',
                                User::ROLE_USER     => '<span class="badge" style="background-color: #6C3428">User</span>',
                            ];

                            return isset($roleLabels[$model->role]) ? $roleLabels[$model->role] : '';
                        },
                    ],
                    'created_at:date',
                    'updated_at:date',
                    // 'verification_token',
                ],
            ]) ?>


        </div>
    </div>
</div>