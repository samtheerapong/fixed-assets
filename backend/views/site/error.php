<?php

/** @var yii\web\View $this */
/** @var string $name */
/** @var string $message */
/** @var Exception $exception*/

use yii\helpers\Html;

$this->title = $name;
?>
<div class="site-error">

    <div class="site-error text-center">
        <div class="jumbotron">
            <img>
            <?= Html::img('https://www.northernfoodcomplex.com/wp-content/uploads/2018/10/logo.png') ?>
            </img>
            <h1>
                <p><?= Html::encode($this->title) ?></p>
            </h1>
            <h2>
                <p class="text-danger"><?= nl2br(Html::encode($message)) ?></p>
            </h2>
        </div>
    </div>
</div>