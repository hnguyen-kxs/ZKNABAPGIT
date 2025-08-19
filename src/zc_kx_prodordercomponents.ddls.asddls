@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProdOrderComponents - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_ProdOrderComponents
  as select from ZI_ProdOrderComponents
{
  key Reservation,
  key ReservationItem,
  key ReservationRecordType,
  key ManufacturingOrder,
      ReservationMaterial,
      Plant,
      ManufacturingOrderType,
      
      MatlCompRequirementDate,
      RequirementType,
      BOMExplosionDateID,
      Assembly,
      BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequiredQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      WithdrawnQuantity,
      StorageLocation,

      Material,
      MaterialGoodsReceiptDuration,
      ProductionUnit,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderItemPlannedTotalQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderItemGoodsReceiptQty,
      MRPPlant
}
