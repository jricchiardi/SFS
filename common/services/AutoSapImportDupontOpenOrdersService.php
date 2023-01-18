<?php

namespace common\services;

use OpenSpout\Reader\Common\Creator\ReaderEntityFactory;
use OpenSpout\Reader\CSV\Reader;
use common\models\Import;
use common\models\sap\DupontOpenOrders;
use common\models\sap\Elemento;
use common\models\TypeImport;

class AutoSapImportDupontOpenOrdersService extends AutoSapImportService
{
    const ARCHIVOS_IMPORTADOS_FOLDER_PATH = "@console/importacion_automatica_sap/dupont/archivos_importados";
    const FILENAME = "@console/importacion_automatica_sap/dupont/DupontOpenOrders.csv";

//    const FILENAME = "Y:\\\\OpenOrders.csv";

    /**
     * @return string
     */
    public function getJobName()
    {
        return "SAP Dupont OpenOrders";
    }

    /**
     * @return Reader
     */
    protected function createCSVReader()
    {
        $readerCSV = ReaderEntityFactory::createCSVReader();
        $readerCSV->setFieldDelimiter(';');

        return $readerCSV;
    }

    /**
     * @return int
     */
    protected function getTypeImportId()
    {
        return TypeImport::AUTOMATIC_DUPONT_OPEN_ORDERS;
    }

    /**
     * @param array $data
     * @param $campaignId
     * @param $importId
     * @param int $rowNumber
     * @return Elemento
     */
    protected function createElemento(array $data, $OrderNo, $SoldToCustName, int $rowNumber)
    {
        return DupontOpenOrders::fromCSV($data, $OrderNo, $SoldToCustName, $rowNumber);
    }

    /**
     * @param Import $import
     * @param array $elementosValidos
     * @return array
     */
    protected function doImportToDb(Import $import, array $elementosValidos)
    {
        return $import->importToDBOpenOrdersFromAutomaticImport($elementosValidos);
    }

    /**
     * @inheritDoc
     */
    protected function exitWhenClientNotFound()
    {
        return false;
    }

    /**
     * @inheritDoc
     */
    protected function exitWhenExistsInvalidElements()
    {
        return false;
    }

    /**
     * @inheritDoc
     */
    protected function considerClientNotFoundAsError()
    {
        return true;
    }

    /**
     * @inheritDoc
     */
    protected function considerInvalidElementsAsError()
    {
        return false;
    }

    /**
     * @inheritDoc
     */
    protected function exitWhenGmidNotFound()
    {
        return false;
    }

    /**
     * @inheritDoc
     */
    protected function exitWhenFailedElement()
    {
        return false;
    }

    /**
     * @inheritDoc
     */
    protected function considerGmidNotFoundAsError()
    {
        return true;
    }

    /**
     * @inheritDoc
     */
    protected function considerFailedElementsAsError()
    {
        return false;
    }

    /**
     * @return array
     */
    protected function getGmidsExcluidos()
    {
        return [];
    }
}
