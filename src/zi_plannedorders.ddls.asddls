@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Planned Order - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_PlannedOrders
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
where
      PlannedTotalQtyInBaseUnit > 0
  and PlannedOrderCategory      = '1'
