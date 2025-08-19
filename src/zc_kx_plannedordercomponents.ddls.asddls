@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PlannedOrderComponents - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PlannedOrderComponents
  as select from ZI_PlannedOrderComponents
{
  key    Reservation,
  key    ReservationItem,
  key    RecordType,
  key    PlannedOrder,
         PlannedOrderType,
         MatlCompRequirementDate,
         RequirementType,
         ReservationMaterial,
         Plant,
         StorageLocation,
         Assembly,
         @Semantics.quantity.unitOfMeasure: 'BaseUnit'
         RequiredQuantity  as RequiredQuantity,
         @Semantics.quantity.unitOfMeasure: 'BaseUnit'
         WithdrawnQuantity as WithdrawnQuantity,
         Material,
         MRPPlant,
         ProductionPlant,
         PlannedOrderIsFirm,
         BaseUnit
}
