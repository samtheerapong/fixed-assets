<?php

namespace backend\models;

use backend\models\Categories;
use backend\models\Types;
use backend\models\Status;
use common\models\User;
use DateTime;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\BaseActiveRecord;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\helpers\Url;

/**
 * This is the model class for table "documents".
 *
 * @property int $id
 * @property string $numbers รหัสเอกสาร
 * @property string $title ชื่อเอกสาร
 * @property string|null $description รายละเอียด
 * @property string|null $created_at วันที่เอกสาร
 * @property string|null $updated_at วันที่ปรับปรุง
 * @property int|null $created_by ผู้สร้าง
 * @property int|null $updated_by ผู้ปรับปรุง
 * @property int|null $categories_id หมวดหมู่
 * @property int|null $status_id สถานะ
 * @property string|null $ref อ้างอิง
 * @property string|null $docs ไฟล์เอกสาร
 *
 * @property Categories $categories
 * @property Status $status
 */
class Documents extends \yii\db\ActiveRecord
{

    const UPLOAD_FOLDER = 'uploads';

    // public $notify_date;
    // public $pdf_file;


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
            [
                'class' => 'mdm\autonumber\Behavior',
                'attribute' => 'numbers', // required
                // 'group' => $this->id_branch, // optional
                'value' => date('Ym') . '-?', // format auto number. '?' will be replaced with generated number
                'digit' => 3 // optional, default to null. 
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'documents';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['numbers', 'title', 'categories_id', 'status_id', 'types_id', 'occupier_id'], 'required'],
            [['numbers'], 'autonumber', 'format' => date('Ym') . '-?'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'expiration_date'], 'safe'],
            // [['notify_date'], 'safe'],
            [['created_by', 'updated_by', 'categories_id', 'status_id', 'document_date', 'types_id', 'occupier_id'], 'integer'],
            [['numbers', 'title', 'ref'], 'string', 'max' => 255],
            [['categories_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categories::class, 'targetAttribute' => ['categories_id' => 'id']],
            [['occupier_id'], 'exist', 'skipOnError' => true, 'targetClass' => Occupier::class, 'targetAttribute' => ['occupier_id' => 'id']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => Status::class, 'targetAttribute' => ['status_id' => 'id']],
            [['types_id'], 'exist', 'skipOnError' => true, 'targetClass' => Types::class, 'targetAttribute' => ['types_id' => 'id']],
            // [['pdf_file'], 'file', 'skipOnEmpty' => true, 'on' => 'update', 'extensions' => 'pdf'],
            [['docs'], 'file', 'maxFiles' => 10, 'skipOnEmpty' => true]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'numbers' => Yii::t('app', 'DocumentID'),
            'title' => Yii::t('app', 'Title'),
            'description' => Yii::t('app', 'Description'),
            'expiration_date' => Yii::t('app', 'Expiration Date'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
            'categories_id' => Yii::t('app', 'Categories'),
            'occupier_id' => Yii::t('app', 'Occupier'),
            'types_id' => Yii::t('app', 'Types'),
            'status_id' => Yii::t('app', 'Status'),
            'ref' => Yii::t('app', 'Ref'),
            'docs' => Yii::t('app', 'Docs'),
            'expiration' => Yii::t('app', 'Expiration'),
            'document_date' => Yii::t('app', 'Notify Date'),
            // 'notify_date' => Yii::t('app', 'Notify Date'),
            // 'pdf_file' => Yii::t('app', 'ไฟล์เอกสาร'),
        ];
    }

    public function getCategories()
    {
        return $this->hasOne(Categories::class, ['id' => 'categories_id']);
    }

    public function getOccupier()
    {
        return $this->hasOne(Occupier::class, ['id' => 'occupier_id']);
    }

    public function getStatus()
    {
        return $this->hasOne(Status::class, ['id' => 'status_id']);
    }

    public function getTypes()
    {
        return $this->hasOne(Types::class, ['id' => 'types_id']);
    }

    public static function getUploadPath()
    {
        return Yii::getAlias('@webroot') . '/' . self::UPLOAD_FOLDER . '/';
    }

    public static function getUploadUrl()
    {
        return Url::base(true) . '/' . self::UPLOAD_FOLDER . '/';
    }

    public function listDownloadFiles($type)
    {
        $docs_file = '';
        if (in_array($type, ['docs'])) {
            $data = $type === 'docs' ? $this->docs : '';
            $files = Json::decode($data);
            if (is_array($files)) {
                $docs_file = '<ul>';
                foreach ($files as $key => $value) {
                    if (strpos($value, '.jpg') !== false || strpos($value, '.jpeg') !== false || strpos($value, '.png') !== false || strpos($value, '.gif') !== false) {
                        $thumbnail = Html::img(['/documents/download', 'id' => $this->id, 'file' => $key, 'fullname' => $value], ['class' => 'img-thumbnail', 'alt' => 'Image', 'style' => 'width: 150px']);
                        $fullSize = Html::a($thumbnail, ['/documents/download', 'id' => $this->id, 'file' => $key, 'fullname' => $value], ['target' => '_blank']);
                        $docs_file .= '<li>' . $fullSize . '</li>';
                    } else {
                        $docs_file .= '<li>' . Html::a($value, ['/documents/download', 'id' => $this->id, 'file' => $key, 'fullname' => $value]) . '</li>';
                    }
                }
                $docs_file .= '</ul>';
            }
        }

        return $docs_file;
    }

    public function isImage($filePath)
    {
        return @is_array(getimagesize($filePath)) ? true : false;
    }

    public function initialPreview($data, $field, $type = 'file')
    {
        $initial = [];
        $files = Json::decode($data);
        if (is_array($files)) {
            foreach ($files as $key => $value) {
                $filePath = self::getUploadUrl() . $this->ref . '/' . $value;
                $filePathDownload = self::getUploadUrl() . $this->ref . '/' . $value;

                $isImage = $this->isImage($filePath);

                if ($type == 'file') {
                    $initial[] = "<div class='file-preview-other'><h2><i class='glyphicon glyphicon-file'></i></h2></div>";
                } elseif ($type == 'config') {
                    $initial[] = [
                        'caption' => $value,
                        'width'  => '120px',
                        'url'    => Url::to(['documents/deletefile', 'id' => $this->id, 'fileName' => $key, 'field' => $field]),
                        'key'    => $key
                    ];
                } else {
                    if ($isImage) {
                        $file = Html::img($filePath, ['class' => 'file-preview-image', 'alt' => $this->file_name, 'title' => $this->file_name]);
                    } else {
                        $file = Html::a('View File', $filePathDownload, ['target' => '_blank']);
                    }
                    $initial[] = $file;
                }
            }
        }
        return $initial;
    }

    public function getCreatedBy()
    {
        return $this->hasOne(User::class, ['id' => 'created_by']);
    }

    // ฟังก์ชันคำนวณจำนวนวันหมดอายุ
    public function getDaysToExpiration()
    {
        $currentDate = new DateTime(); // วันปัจจุบัน
        $expiryDate = new DateTime($this->expiration_date); // วันหมดอายุ
        // $expiryDate = new DateTime('2023-08-08'); // test
        $interval = $currentDate->diff($expiryDate); // คำนวณความต่าง

        $daysToExpiration = $interval->format('%r%a');
        //%r%a เป็นรูปแบบการจัดรูปของตัวเลขที่ใช้ในฟังก์ชัน DateTime::format() ในภาษา PHP เพื่อแสดงผลลัพธ์จากการคำนวณระหว่างวันที่สองวัน โดย %r จะแสดงเครื่องหมายบวกหรือลบขึ้นอยู่กับว่าค่าที่คำนวณมาเป็นบวกหรือลบ และ %a จะแสดงจำนวนวันที่ผ่านมา.

        return ($daysToExpiration <= 0) ? 0 : $daysToExpiration;

    }
}
