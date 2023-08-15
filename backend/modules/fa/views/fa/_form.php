<?php

use backend\modules\fa\models\FaCategory;
use backend\modules\fa\models\FaDepartment;
use backend\modules\fa\models\FaLocation;
use backend\modules\fa\models\FaStatus;
use common\models\User;
use kartik\widgets\DatePicker;
use kartik\widgets\FileInput;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var backend\modules\fa\models\Fa $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="fa-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">
            <div class="row">

                <div style="display: none;">
                    <?= $form->field($model, 'asset_code')->textInput(['maxlength' => true, 'disabled' => true]) ?>
                </div>

                <div class="row mb-2">
                    <div class="col-md-4 ">
                        <?= $form->field($model, 'coming_date')->widget(
                            DatePicker::class,
                            [
                                'language' => 'th',
                                'options' => [
                                    'placeholder' => Yii::t('app', 'Select...'),
                                    'required' => true,
                                ],
                                'pluginOptions' => [
                                    'format' => 'yyyy-mm-dd',
                                    'todayHighlight' => true,
                                    'autoclose' => true,
                                ]
                            ]
                        ); ?>
                    </div>

                    <div class="col-md-4">
                        <?= $form->field($model, 'category')->widget(Select2::class, [
                            'language' => 'th',
                            'data' => ArrayHelper::map(FaCategory::find()->all(), 'id', 'name'),
                            'options' => ['placeholder' => Yii::t('app', 'Select...')],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                        ?>
                    </div>

                    <div class="col-md-4">
                        <?= $form->field($model, 'owner')->widget(Select2::class, [
                            'language' => 'th',
                            'data' => ArrayHelper::map(User::find()->all(), 'id', 'thai_name'),
                            'options' => ['placeholder' => Yii::t('app', 'Select...')],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                        ?>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-12">
                        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-12">
                        <?= $form->field($model, 'description')->textarea(['rows' => 3]) ?>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-4">
                        <?= $form->field($model, 'department')->widget(Select2::class, [
                            'language' => 'th',
                            'data' => ArrayHelper::map(FaDepartment::find()->all(), 'id', 'name'),
                            'options' => ['placeholder' => Yii::t('app', 'Select...')],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                        ?>
                    </div>

                    <div class="col-md-4">
                        <?= $form->field($model, 'location')->widget(Select2::class, [
                            'language' => 'th',
                            'data' => ArrayHelper::map(FaLocation::find()->all(), 'id', 'name'),
                            'options' => ['placeholder' => Yii::t('app', 'Select...')],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                        ?>
                    </div>

                    <div class="col-md-2">
                        <?= $form->field($model, 'qty')->textInput() ?>
                    </div>

                    <div class="col-md-2">
                        <?= $form->field($model, 'unit')->textInput(['maxlength' => true]) ?>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-4">
                        <?= $form->field($model, 'cost')->textInput(['maxlength' => true]) ?>
                    </div>


                    <div class="col-md-4">
                        <?= $form->field($model, 'depreciation')->textInput(['maxlength' => true]) ?>
                    </div>

                    <div class="col-md-4">
                        <?= $form->field($model, 'status')->widget(Select2::class, [
                            'language' => 'th',
                            'data' => ArrayHelper::map(FaStatus::find()->all(), 'id', 'name'),
                            'options' => ['placeholder' => Yii::t('app', 'Select...')],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                        ?>
                    </div>
                </div>
                <div class="row mb-2 mt-2">
                    <div class="col-md-12 ">
                        <?= $form->field($model, 'images')->fileInput() ?>
                    </div>
                </div>

            </div>
        </div>


        <div class="card-footer">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="d-grid gap-2">
                        <?= Html::submitButton('<i class="fas fa-save"></i> ' . Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <?php ActiveForm::end(); ?>
</div>