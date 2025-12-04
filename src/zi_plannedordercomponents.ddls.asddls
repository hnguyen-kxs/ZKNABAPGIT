@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PlannedOrderComponents'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_PlannedOrderComponents
  as select from I_PlannedOrderComponent as _Comp
    inner join   I_PlannedOrder          as _Ord on _Comp.PlannedOrder = _Ord.PlannedOrder
{
  key    _Comp.Reservation                     as Reservation,
  key    _Comp.ReservationItem                 as ReservationItem,
  key    _Comp.RecordType                      as RecordType,
  key    _Comp.PlannedOrder                    as PlannedOrder,
         _Comp.PlannedOrderType                as PlannedOrderType,
         _Comp.MatlCompRequirementDate         as MatlCompRequirementDate,
         _Comp.RequirementType                 as RequirementType,
         cast(_Comp.Material as abap.char(40)) as ReservationMaterial,
         _Comp.Plant                           as Plant,
         _Comp.StorageLocation                 as StorageLocation,
         _Comp.Assembly                        as Assembly,
         @Semantics.quantity.unitOfMeasure: 'BaseUnit'
         _Comp.RequiredQuantity                as RequiredQuantity,
         @Semantics.quantity.unitOfMeasure: 'BaseUnit'
         _Comp.WithdrawnQuantity               as WithdrawnQuantity,
         cast(_Ord.Material as abap.char(40))  as Material,
         _Ord.MRPPlant                         as MRPPlant,
         _Ord.ProductionPlant                  as ProductionPlant,
         _Ord.PlannedOrderIsFirm               as PlannedOrderIsFirm,
         _Ord.BaseUnit                         as BaseUnit
}
where
      _Ord.PlannedTotalQtyInBaseUnit > 0
  and _Ord.PlannedOrderCategory      = '1'
