<?php

use backend\models\Categories;
use yii\bootstrap5\LinkPager;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
// use yii\grid\GridView;
use kartik\grid\GridView;

/** @var yii\web\View $this */
/** @var backend\models\CategoriesSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Categories');
$this->params['breadcrumbs'][] = $this->title;
?>

<!-- Add the following meta tag to refresh the page every 1 minute -->
<meta http-equiv="refresh" content="360">

<div class="categories-index">

    <p>
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
                        'name',
                        'details:ntext',
                        [
                            'attribute' => 'color',
                            'format' => 'html',
                            'value' => function ($model) {
                                return '<span class="badge" style="background-color:' . $model->color . ';"><b>' . $model->color . '</b></span>';
                            },
                        ],
                        [
                            // 'class' => ActionColumn::class,
                            'class' => 'kartik\grid\ActionColumn',
                            'header' => 'จัดการ',
                            'headerOptions' => ['style' => 'width: 140px;'],
                            'contentOptions' => ['class' => 'text-center'], // จัดตรงกลาง
                            'buttonOptions' => ['class' => 'btn btn-sm btn-outline-primary btn-group'],
                            'urlCreator' => function ($action, Categories $model, $key, $index, $column) {
                                return Url::toRoute([$action, 'id' => $model->id]);
                            }
                        ],
                    ],
                ]); ?>


            </div>
        </div>
    </div>
</div>