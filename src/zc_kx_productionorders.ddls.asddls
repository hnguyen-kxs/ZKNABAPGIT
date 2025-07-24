@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProductionOrder - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_ProductionOrders
  as select from ZI_ProductionOrders
{
  key ManufacturingOrder,
      ManufacturingOrderItem,
      ManufacturingOrderCategory,
      ManufacturingOrderType,
      Material,
      MaterialGoodsReceiptDuration,
      Currency,
      ProductionPlant,
      PlanningPlant,
      MRPArea,
      SalesOrder,
      SalesOrderItem,
      Reservation,
      BillOfOperationsMaterial,
      BillOfOperationsType,
      BillOfOperations,
      BillOfOperationsVariant,
      MfgOrderPlannedStartDate,
      MfgOrderPlannedEndDate,
      MfgOrderScheduledStartDate,
      MfgOrderScheduledEndDate,
      MfgOrderActualStartDate,
      MfgOrderConfirmedEndDate,
      MfgOrderActualEndDate,
      ProductionUnit,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderPlannedTotalQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderConfirmedYieldQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      ActualDeliveredQuantity,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderItemPlannedTotalQty
}
