@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Planned Order - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZC_KX_PlannedOrders
  as select from I_PlannedOrder
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
