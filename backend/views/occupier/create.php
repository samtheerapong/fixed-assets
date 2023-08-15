<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var backend\models\Occupier $model */

$this->title = Yii::t('app', 'Create Occupier');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Occupiers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="occupier-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
