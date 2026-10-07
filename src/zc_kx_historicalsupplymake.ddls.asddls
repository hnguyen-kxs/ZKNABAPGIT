@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Historical Supply Make - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_HistoricalSupplyMake
  with parameters
    p_days : int2
  as select from ZI_HistoricalSupplyMake( p_days: $parameters.p_days  )
{
  key  ManufacturingOrder,
  key  ManufacturingOrderItem,
       ManufacturingOrderType,
       Currency,
       ProductionPlant,
       @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
       MfgOrderItemGoodsReceiptQty,
       BillofOperationsMaterial,
       MfgOrderScheduledEndDate,
       MfgOrderActualEndDate,
       ProductionUnit,
       @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
       MfgOrderConfirmedYieldQty,
       @Semantics.amount.currencyCode: 'Currency'
       StandardPrice,
       PriceUnitQty
}
