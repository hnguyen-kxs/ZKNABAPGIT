@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Planned Order - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PlannedOrders
  as select from ZI_PlannedOrders
{
  key PlannedOrder,
      PlannedOrderType,
      Material,
      MRPPlant,
      MaterialProcurementType,
      MaterialGoodsReceiptDuration,
      StorageLocation,
      BOMExplosionDateID,
      ProductionPlant,
      Reservation,
      SalesOrder,
      SalesOrderItem,
      CapacityRequirement,
      PlannedOrderIsFirm,
      PlndOrderPlannedStartDate,
      PlndOrderPlannedEndDate,
      BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      PlannedTotalQtyInBaseUnit
}
