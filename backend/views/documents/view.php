<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var backend\models\Documents $model */

$this->title = $model->numbers;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Documents'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);

?>
<div class="documents-view">

    <div style="display: flex; justify-content: space-between;">
        <p>
            <?= Html::a('<i class="fas fa-chevron-left"></i> ' . Yii::t('app', 'Go Back'), ['index'], ['class' => 'btn btn-primary']) ?>
            <?= Html::button('<i class="fas fa-share"></i> ' . Yii::t('app', 'Share'), ['class' => 'btn btn-secondary', 'id' => 'copy-button']) ?>
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

    <!-- copy-button -->
    <?php $currentUrl = Yii::$app->request->absoluteUrl; ?>
    <script>
        document.getElementById('copy-button').addEventListener('click', function() {
            var textArea = document.createElement('textarea');
            textArea.value = '<?= $currentUrl ?>';
            document.body.appendChild(textArea);
            textArea.select();
            try {
                document.execCommand('copy');
                alert('URL copied to clipboard.');
            } catch (err) {
                console.error('Unable to copy URL: ', err);
            }
            document.body.removeChild(textArea);
        });
    </script>

    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">

            <div class="col-md-12">
                <div class="<?= $model->getDaysToExpiration() < $model->document_date ? 'alert alert-danger' : 'alert alert-success' ?>">
                    เอกสารนี้จะหมดอายุในอีก: <?= $model->getDaysToExpiration() ?> วัน
                </div>
            </div>

            <?= DetailView::widget([
                'model' => $model,
                'template' => '<tr><th style="width: 160px;">{label}</th><td> {value}</td></tr>',
                'attributes' => [
                    // 'id',
                    'numbers',
                    'title',
                    'description:ntext',
                    // 'expiration_date:date',
                    [
                        'attribute' => 'expiration_date',
                        'format' => 'html',
                        'value' => Yii::$app->formatter->asDate($model->expiration_date, 'php:d M Y') .
                            ' <span class="badge" style="background-color: ' . ($model->getDaysToExpiration() < $model->document_date ? 'red' : 'green') . ';">' . $model->getDaysToExpiration() . ' days left</span>'
                    ],
                    'document_date',
                    'created_at:date',
                    'updated_at:date',
                    // 'created_by',
                    [
                        'attribute' => 'created_by',
                        'format' => 'html',
                        'value' => function ($model) {
                            $user = $model->createdBy->thai_name;
                            return $user ? $model->createdBy->thai_name : $model->createdBy->username;
                        },
                    ],
                    // 'updated_by',
                    // [
                    //     'attribute' => 'updated_by',
                    //     'format' => 'html',
                    //     'value' => function ($model) {
                    //         $user = $model->createdBy->thai_name;
                    //         return $user ? $model->createdBy->thai_name : $model->createdBy->username;
                    //     },
                    // ],

                    // 'categories_id',

                    [
                        'attribute' => 'categories_id',
                        'format' => 'html',
                        'value' => function ($model) {
                            return '<span class="badge" style="background-color:'
                                . $model->categories->color . ';"><b>'
                                . $model->categories->name
                                . ' </b></span>';
                        },
                    ],

                    [
                        'attribute' => 'occupier_id',
                        'format' => 'html',
                        'value' => function ($model) {
                            return '<span class="badge" style="background-color:'
                                . $model->occupier->color . ';"><b>'
                                . $model->occupier->name
                                . ' </b></span>';
                        },
                    ],

                    [
                        'attribute' => 'types_id',
                        'format' => 'html',
                        'value' => function ($model) {
                            return '<span class="badge" style="background-color:'
                                . $model->types->color . ';"><b>'
                                . $model->types->name
                                . ' </b></span>';
                        },
                    ],
                    // 'status_id',
                    [
                        'attribute' => 'status_id',
                        'format' => 'html',
                        'value' => function ($model) {
                            return '<span class="badge" style="background-color:'
                                . $model->status->color . ';"><b>'
                                . $model->status->name
                                . ' </b></span>';
                        },
                    ],
                    // 'ref',
                    // 'files:ntext',
                    [
                        'attribute' => 'docs',
                        'format' => 'html',
                        'value' => $model->listDownloadFiles('docs')
                    ],
                ],
            ]) ?>

        </div>
    </div>
</div>