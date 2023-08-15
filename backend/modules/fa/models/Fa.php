<?php

namespace backend\modules\fa\models;

use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;
use yii\bootstrap5\Html;
use yii\db\BaseActiveRecord;
use yii\helpers\Url;

/**
 * This is the model class for table "fa".
 *
 * @property int $id
 * @property string|null $coming_date วันที่ได้มา
 * @property int|null $category ประเภท
 * @property string|null $name ชื่อ
 * @property string|null $description รายละเอียด
 * @property string|null $asset_code รหัสทรัพย์สิน
 * @property string|null $images รูปภาพ
 * @property int|null $location สถานที่
 * @property int|null $department หน่วยงาน
 * @property int|null $owner ผู้ครอบครอง
 * @property int|null $qty จำนวน
 * @property string|null $unit หน่วย
 * @property float|null $cost ราคาทุน
 * @property string|null $status
 * @property float|null $depreciation ค่าเสื่อมคงเหลือ
 * @property string|null $created_at สร้างเมื่อ
 * @property string|null $updated_at ปรับปรุงเมื่อ
 * @property string|null $created_by สร้างโดย
 * @property string|null $updated_by ปรับปรุงโดย
 */
class Fa extends \yii\db\ActiveRecord
{

    const UPLOAD_FOLDER = 'fixedassets';

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::class,
                'attributes' => [
                    self::EVENT_BEFORE_INSERT => ['created_at'],
                    self::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
                'value' => function () {
                    return date('Y-m-d H:i:s');
                },
            ],
            [
                'class' => BlameableBehavior::class,
                'attributes' => [
                    BaseActiveRecord::EVENT_BEFORE_INSERT => ['created_by', 'updated_by'],
                    BaseActiveRecord::EVENT_BEFORE_UPDATE => ['updated_by'],
                ],
            ],
            // [
            //     'class' => 'mdm\autonumber\Behavior',
            //     'attribute' => 'asset_code', // required
            //     // 'group' => $this->id_branch, // optional
            //     'value' => $model->departmentFa->code . '-?', // format auto number. '?' will be replaced with generated number
            //     'digit' => 3 // optional, default to null. 
            // ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'fa';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            // required
            [['name', 'coming_date', 'category', 'department', 'location', 'owner', 'status'], 'required'],

            // safe
            [['coming_date', 'created_at', 'updated_at'], 'safe'],

            // integer
            [['category', 'location', 'department', 'owner', 'qty', 'created_by', 'updated_by', 'status'], 'integer'],

            // number
            [['cost', 'depreciation'], 'number'],

            // string
            [['description', 'images', 'cover'], 'string'],
            [['asset_code', 'unit'], 'string', 'max' => 45],
            [['name'], 'string', 'max' => 255],

            // unique
            [['asset_code'], 'unique'],

            // Relation
            [['category'], 'exist', 'skipOnError' => true, 'targetClass' => FaCategory::class, 'targetAttribute' => ['category' => 'id']],
            [['location'], 'exist', 'skipOnError' => true, 'targetClass' => FaLocation::class, 'targetAttribute' => ['location' => 'id']],
            [['department'], 'exist', 'skipOnError' => true, 'targetClass' => FaDepartment::class, 'targetAttribute' => ['department' => 'id']],
            [['status'], 'exist', 'skipOnError' => true, 'targetClass' => FaStatus::class, 'targetAttribute' => ['status' => 'id']],

            // Upload
            [['cover'], 'file', 'extensions' => 'png, jpg, jpeg'],
            [['images'], 'file', 'extensions' => 'png, jpg, jpeg'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'coming_date' => Yii::t('app', 'วันที่ได้มา'),
            'category' => Yii::t('app', 'ประเภท'),
            'name' => Yii::t('app', 'ชื่อ'),
            'description' => Yii::t('app', 'รายละเอียด'),
            'asset_code' => Yii::t('app', 'รหัสทรัพย์สิน'),
            'cover' => Yii::t('app', 'ภาพหน้าปก'),
            'images' => Yii::t('app', 'รูปภาพ'),
            'location' => Yii::t('app', 'สถานที่'),
            'department' => Yii::t('app', 'หน่วยงาน'),
            'owner' => Yii::t('app', 'ผู้ครอบครอง'),
            'qty' => Yii::t('app', 'จำนวน'),
            'unit' => Yii::t('app', 'หน่วย'),
            'cost' => Yii::t('app', 'ราคาทุน'),
            'status' => Yii::t('app', 'Status'),
            'depreciation' => Yii::t('app', 'ค่าเสื่อมคงเหลือ'),
            'created_at' => Yii::t('app', 'สร้างเมื่อ'),
            'updated_at' => Yii::t('app', 'ปรับปรุงเมื่อ'),
            'created_by' => Yii::t('app', 'สร้างโดย'),
            'updated_by' => Yii::t('app', 'ปรับปรุงโดย'),
        ];
    }

    // Relation Table
    public function getCategoryFa()
    {
        return $this->hasOne(FaCategory::class, ['id' => 'category']);
    }

    public function getDepartmentFa()
    {
        return $this->hasOne(FaDepartment::class, ['id' => 'department']);
    }

    public function getLocationFa()
    {
        return $this->hasOne(FaLocation::class, ['id' => 'location']);
    }

    public function getStatusFa()
    {
        return $this->hasOne(FaStatus::class, ['id' => 'status']);
    }

    // Uploads path & Url
    public static function getUploadPath()
    {
        return Yii::getAlias('@webroot') . '/' . self::UPLOAD_FOLDER . '/';
    }

    public static function getUploadUrl()
    {
        return Url::base(true) . '/' . self::UPLOAD_FOLDER . '/';
    }

    public function getPhotoViewer()
    {
        return empty($this->cover) ? Yii::getAlias('@web') .  '/' . self::UPLOAD_FOLDER . '/noimg.png' : $this->getUploadUrl() . $this->cover;
    }

    // public function getPhotoViewer(){
    //     $images = $this->images ? @explode(',',$this->images) : [];
    //     $img = '';
    //     foreach ($images as  $image) {
    //       $img.= ' '.Html::img($this->getUploadUrl().$image,['class'=>'img-thumbnail','style'=>'max-width:100px;']);
    //     }
    //     return $img;
    //   }
}
