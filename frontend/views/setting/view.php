<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Setting */

$this->title = $model->Name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Settings'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="setting-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->SettingId], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->SettingId], [
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
            'SettingId',
            'Name',
            'DisplayName',
            'Value',
        ],
    ]) ?>

</div>
