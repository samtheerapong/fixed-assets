<?php

namespace backend\modules\fa\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\fa\models\Fa;

/**
 * FaSearch represents the model behind the search form of `backend\modules\fa\models\Fa`.
 */
class FaSearch extends Fa
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'category', 'location', 'department', 'owner', 'qty'], 'integer'],
            [['ref', 'coming_date', 'name', 'description', 'asset_code', 'images', 'unit', 'status', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'safe'],
            [['cost', 'depreciation'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Fa::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'coming_date' => $this->coming_date,
            'category' => $this->category,
            'location' => $this->location,
            'department' => $this->department,
            'owner' => $this->owner,
            'qty' => $this->qty,
            'cost' => $this->cost,
            'depreciation' => $this->depreciation,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'asset_code', $this->asset_code])
            ->andFilterWhere(['like', 'images', $this->images])
            ->andFilterWhere(['like', 'unit', $this->unit])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'created_by', $this->created_by])
            ->andFilterWhere(['like', 'updated_by', $this->updated_by]);

        return $dataProvider;
    }
}
