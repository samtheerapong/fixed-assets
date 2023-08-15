<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var backend\modules\fa\models\FaStatus $model */

$this->title = Yii::t('app', 'Create Fa Status');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Fa Statuses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="fa-status-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
