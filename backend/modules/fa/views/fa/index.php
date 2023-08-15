<?php

use backend\modules\fa\models\Fa;
use backend\modules\fa\models\FaCategory;
use backend\modules\fa\models\FaDepartment;
use backend\modules\fa\models\FaLocation;
use backend\modules\fa\models\FaStatus;
use yii\bootstrap5\LinkPager;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use kartik\grid\GridView;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var backend\modules\fa\models\FaSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Fixed Assets');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="fa-index">

    <p>
        <?= Html::a('<i class="fa fa-plus"></i> ' . Yii::t('app', 'Create Data'), ['create'], ['class' => 'btn btn-danger']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">
            <div class="table-responsive">


                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'pager' => [
                        'class' => LinkPager::class,
                        // 'prevPageLabel' => 'Previous',
                        // 'nextPageLabel' => 'Next',
                        'options' => ['class' => 'pagination justify-content-center'], // Adjust this class to center the pagination.
                        'linkContainerOptions' => ['class' => 'page-item'],
                        'linkOptions' => ['class' => 'page-link'],
                    ],
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],

                        // 'id',
                        // 'asset_code',
                        // 'images:ntext',
                        [
                            'attribute' => 'cover',
                            'format' => 'html',
                            'options' => ['style' => 'width:150px;'],
                            'contentOptions' => ['class' => 'text-center'],
                            'value' => function ($model) {
                                $imageDiv = Html::img($model->photoViewer,['class'=>'img-thumbnail','style' => 'width:120px;height:90px; border: 1px solid dark;']);
                                // $imageDiv =  Html::tag('div', '', [
                                //     'style' => 'width:150px;height:95px;
                                //               border: 1px solid dark;
                                //               background-image:url(' . $model->photoViewer . ');
                                //               background-size: cover;
                                //               background-position:center center;
                                //               background-repeat:no-repeat;
                                //               '
                                // ]);
                                return Html::a($imageDiv, ['view', 'id' => $model->id]);
                                // return $imageDiv;
                            },
                        ],

                        [
                            'attribute' => 'name',
                            'format' => 'html',
                            // 'options' => ['style' => 'width:300px;'],
                            // 'contentOptions' => ['class' => 'text-center'],
                            'value' => function ($model) {
                                return Html::a($model->name, ['view', 'id' => $model->id]);
                            },
                        ],
                        
                        [
                            'attribute' => 'asset_code',
                            'format' => 'html',
                            'options' => ['style' => 'width:150px;'],
                            'contentOptions' => ['class' => 'text-center'],
                            'value' => function ($model) {
                                return Html::a($model->asset_code, ['view', 'id' => $model->id]);
                            },
                        ],
                        // 'coming_date',
                        // 'name',
                        
                        // 'description:ntext',
                        // 'location',
                        // 'category',
                        [
                            'attribute' => 'category',
                            'format' => 'html',
                            'contentOptions' => ['class' => 'text-center'], // จัดตรงกลาง
                            // 'options' => ['style' => 'width:180px;'],
                            'value' => function ($model) {
                                return '<span class="badge" style="background-color:' . $model->categoryFa->color . ';"><b>' . $model->categoryFa->name . '</b></span>';
                            },
                            'filter' => Select2::widget([
                                'model' => $searchModel,
                                'attribute' => 'category',
                                'data' => ArrayHelper::map(FaCategory::find()->all(), 'id', 'name'),
                                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                                'language' => 'th',
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ])
                        ],
                        // 'department',
                        [
                            'attribute' => 'department',
                            'format' => 'html',
                            'contentOptions' => ['class' => 'text-center'], // จัดตรงกลาง
                            'options' => ['style' => 'width:120px;'],
                            'value' => function ($model) {
                                return '<span class="badge" style="background-color:' . $model->departmentFa->color . ';"><b>' . $model->departmentFa->code . '</b></span>';
                            },
                            'filter' => Select2::widget([
                                'model' => $searchModel,
                                'attribute' => 'department',
                                'data' => ArrayHelper::map(FaDepartment::find()->all(), 'id', 'code'),
                                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                                'language' => 'th',
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ])
                        ],

                        [
                            'attribute' => 'location',
                            'format' => 'html',
                            'contentOptions' => ['class' => 'text-center'], // จัดตรงกลาง
                            'options' => ['style' => 'width:120px;'],
                            'value' => function ($model) {
                                return '<span class="badge" style="background-color:' . $model->locationFa->color . ';"><b>' . $model->locationFa->code . '</b></span>';
                            },
                            'filter' => Select2::widget([
                                'model' => $searchModel,
                                'attribute' => 'location',
                                'data' => ArrayHelper::map(FaLocation::find()->all(), 'id', 'code'),
                                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                                'language' => 'th',
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ])
                        ],
                        //'owner',
                        //'qty',
                        //'unit',
                        //'cost',
                        // 'status',
                        [
                            'attribute' => 'status',
                            'format' => 'html',
                            'contentOptions' => ['class' => 'text-center'], // จัดตรงกลาง
                            'options' => ['style' => 'width:120px;'],
                            'value' => function ($model) {
                                return '<span class="badge" style="background-color:' . $model->statusFa->color . ';"><b>' . $model->statusFa->name . '</b></span>';
                            },
                            'filter' => Select2::widget([
                                'model' => $searchModel,
                                'attribute' => 'status',
                                'data' => ArrayHelper::map(FaStatus::find()->all(), 'id', 'name'),
                                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                                'language' => 'th',
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ])
                        ],
                        //'depreciation',
                        //'created_at',
                        //'updated_at',
                        //'created_by',
                        //'updated_by',
                        [
                            // 'class' => ActionColumn::class,
                            'class' => 'kartik\grid\ActionColumn',
                            // 'header' => 'จัดการ',
                            'headerOptions' => ['style' => 'width: 140px;'],
                            'contentOptions' => ['class' => 'text-center'], // จัดตรงกลาง
                            'buttonOptions' => ['class' => 'btn btn-sm btn-outline-primary btn-group'],
                            'urlCreator' => function ($action, Fa $model, $key, $index, $column) {
                                return Url::toRoute([$action, 'id' => $model->id]);
                            }
                        ],
                    ],
                ]); ?>


            </div>
        </div>
    </div>

</div>