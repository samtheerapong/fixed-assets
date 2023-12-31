<?php

use kartik\widgets\ColorInput;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var backend\models\Types $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="types-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'details')->textarea(['rows' => 3]) ?>

            <?= $form->field($model, 'color')->widget(ColorInput::class, ['options' => ['placeholder' => Yii::t('app', 'Select...')],]); ?>
        </div>

        <div class="card-footer">
            <div class="form-group">
                <div class="d-grid gap-2">
                    <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
                </div>
            </div>

        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>