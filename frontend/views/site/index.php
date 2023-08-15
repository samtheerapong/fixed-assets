<?php

/** @var yii\web\View $this */

use yii\bootstrap5\Html;

$this->title = 'Documents Center';
?>
<div class="site-index">

    <div class="alert alert-info">
        <div class="d-grid gap-2 m-2">
            <?= Html::a(Yii::t('app', 'Start App'), ['../../backend/web/documents/index'], ['class' => 'btn btn-primary btn-block']) ?>
        </div>
        <center>สอบถามการใช้งาน โทร 087-087-3830 Line ID = sam-it </center>
        <p>
            <center><img src="https://portfoliotheerapong.web.app/assets/img/qrcode-line.jpg" alt="https://portfoliotheerapong.web.app/assets/img/qrcode-line.jpg" width="400"></center>
        </p>
    </div>


</div>