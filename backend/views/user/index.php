<?php

use common\models\User;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use kartik\grid\GridView;
use kartik\widgets\Select2;

/** @var yii\web\View $this */
/** @var common\models\UserSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Users');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">
    <p>
        <!-- <?= Html::a('<i class="fa fa-plus"></i> ' . Yii::t('app', 'Create Data'), ['../../frontend/web/site/signup'], ['class' => 'btn btn-danger']) ?> -->
        <?= Html::a('<i class="fa fa-plus"></i> ' . Yii::t('app', 'Create Data'), ['create'], ['class' => 'btn btn-danger']) ?>
    </p>

    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],

                        // 'id',
                        'username',
                        'thai_name',
                        // 'auth_key',
                        // 'password_hash',
                        //'password_reset_token',
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
                            'filter' => Select2::widget([
                                'model' => $searchModel,
                                'attribute' => 'status',
                                'data' => [
                                    User::STATUS_ACTIVE     => Yii::t('app', 'Active'),
                                    User::STATUS_INACTIVE   => Yii::t('app', 'In Active'),
                                ],
                                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                                'language' => 'th',
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ]),
                        ],
                        // 'created_at:date',
                        //'updated_at',
                        //'verification_token',
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
                            'filter' => Select2::widget([
                                'model' => $searchModel,
                                'attribute' => 'role',
                                'data' => [
                                    User::ROLE_ADMIN    => Yii::t('app', 'Admin'),
                                    User::ROLE_QA       => Yii::t('app', 'QA'),
                                    User::ROLE_SALE     => Yii::t('app', 'Sale'),
                                    User::ROLE_MANAGER  => Yii::t('app', 'Manager'),
                                    User::ROLE_USER     => Yii::t('app', 'User'),
                                ],
                                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                                'language' => 'th',
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ]),
                        ],
                        [
                            // 'class' => ActionColumn::class,
                            'class' => 'kartik\grid\ActionColumn',
                            'header' => 'จัดการ',
                            'headerOptions' => ['style' => 'width: 140px;'],
                            'contentOptions' => ['class' => 'text-center'], // จัดตรงกลาง
                            'buttonOptions' => ['class' => 'btn btn-sm btn-outline-primary btn-group'],
                            'urlCreator' => function ($action, User $model, $key, $index, $column) {
                                return Url::toRoute([$action, 'id' => $model->id]);
                            }
                        ],
                    ],
                ]); ?>


            </div>
        </div>
    </div>
</div>