@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #CHECK
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
  key     Reservation,
  key     ReservationItem,
  key     RecordType,
  key     PurchaseOrder,
  key     PurchaseOrderItem,
  key     PurchaseOrderScheduleLine,
          ReservationMaterial,
          RequirementDate,
          ReservationPlant,
          StorageLocation,
          BaseUnit,
          @Semantics.quantity.unitOfMeasure: 'BaseUnit'
          RequiredQuantity,
          @Semantics.quantity.unitOfMeasure: 'BaseUnit'
          WithdrawnQuantity,

          PurchaseOrderQuantityUnit,
          Material,
          Plant,
          PurchaseOrderType,
          SupplyingPlant
}
