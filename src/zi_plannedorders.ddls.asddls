@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Planned Order - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_PlannedOrders
  as select from I_PlannedOrder
{
  key PlannedOrder,
      PlannedOrderType,
      cast(Material as abap.char(40)) as Material,
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
