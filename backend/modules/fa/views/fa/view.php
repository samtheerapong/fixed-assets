<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var backend\modules\fa\models\Fa $model */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Fas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="fa-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'coming_date',
            'category',
            'name',
            'description:ntext',
            'asset_code',
            // 'images:ntext',
            'location',
            'department',
            'owner',
            'qty',
            'unit',
            'cost',
            'status',
            'depreciation',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
            [
                'attribute'=>'cover',
                'format'=>'raw',
                'value'=>Html::img($model->photoViewer,['class'=>'img-thumbnail','style'=>'width:250px;'])
            ],
        ],
    ]) ?>

</div>
