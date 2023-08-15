<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var backend\modules\fa\models\FaLocation $model */

$this->title = Yii::t('app', 'Create Fa Location');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Fa Locations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="fa-location-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
