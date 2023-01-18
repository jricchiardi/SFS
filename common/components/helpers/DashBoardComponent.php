<?php

namespace common\components\helpers;

use common\models\AuthItem;
use common\models\Campaign;
use common\models\Forecast;
use common\models\Import;
use common\models\Sale;
use Yii;
use yii\base\Component;

class DashBoardComponent extends Component implements IDashBoard
{
    public function generateDashBoard($dashBoardFilter)
    {
        ini_set("memory_limit", -1);
        ini_set("max_execution_time", "9200");
        $results = array();
        $results['Campaign'] = Campaign::getActualCampaign()->Name;
        $dashBoardFilter->CampaignId = Campaign::getActualCampaign()->CampaignId;
        switch (Yii::$app->user->identity->authAssignment->item_name) {
            case AuthItem::ROLE_ADMIN:
            case AuthItem::ROLE_DIRECTOR_COMERCIAL:
                break;
            case AuthItem::ROLE_DSM:
                $dashBoardFilter->DsmId = Yii::$app->user->identity->UserId;
                break;
            case AuthItem::ROLE_RSM:
                $dashBoardFilter->RsmId = Yii::$app->user->identity->UserId;
                break;
            case AuthItem::ROLE_SELLER:
                $dashBoardFilter->SellerId = Yii::$app->user->identity->UserId;
                break;
        }

        $results['lastDateAutomaticDASSale'] = Import::getLastDateAutomaticDASSale();
        $results['lastDateAutomaticDupontSale'] = Import::getLastDateAutomaticDupontSale();
        $results['lastDateAutomaticDASCyo'] = Import::getLastDateAutomaticDASCyo();
        $results['lastDateAutomaticDupontCyo'] = Import::getLastDateAutomaticDupontCyo();
        
        // HARCODEADO PARA LA DEMO PORQUE ESTA LENTO EN AZURE
        $results['campaigns'] = [];
        $results['sales'] = [];
        $results['distribution']['sale'] = 100.0;
        $results['distribution']['forecast'] = 200.0;
        $results['distribution']['cyo'] = 300.0;
        $results['resume'] = [];
        $results['profit'] = 1.5;
        
        // $results['campaigns'] = (new Campaign)->getAll($dashBoardFilter);
        // $results['sales'] = Sale::getDashHistorySales($dashBoardFilter);
        
        // $forecast = new Forecast;
        // $results['distribution'] = $forecast->getDashDistribution($dashBoardFilter);
        // $results['resume'] = $forecast->getTempGrafico1($dashBoardFilter);
        // $results['profit'] = $forecast->getDashProfit($dashBoardFilter);

        return $results;
    }
}
