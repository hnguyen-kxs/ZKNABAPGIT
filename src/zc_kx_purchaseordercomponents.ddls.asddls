@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_KX_PurchaseOrderComponents'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_KX_PurchaseOrderComponents
  as select from ZI_PurchaseOrderComponents
{
  key Reservation,
  key ReservationItem,
  key RecordType,
      ReservationMaterial,
      RequirementType,
      MatlCompRequirementDate,
      Plant,
      StorageLocation,
      BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      ResvnItmRequiredQtyInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      ResvnItmWithdrawnQtyInBaseUnit,

      PurchaseOrder,
      PurchaseOrderItem,
      PurchaseOrderScheduleLine,
      PurchaseOrderQuantityUnit,
      PurchaseOrderMaterial,
      PurchaseOrderPlant,
      PurchaseOrderType,
      PurchaseOrderSupplyingPlant
}
