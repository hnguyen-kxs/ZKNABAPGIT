@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Order Components'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_PurchaseOrderComponents
  as select from I_POSubcontractingCompAPI01 as _Res
    inner join   ZI_PurchaseOrders           as _PurOrd on _Res.Reservation = _PurOrd.Reservation
{
  key _Res.Reservation                        as Reservation,
  key _Res.ReservationItem                    as ReservationItem,
  key _Res.RecordType                         as RecordType,
  key _PurOrd.PurchaseOrder                   as PurchaseOrder,
  key _PurOrd.PurchaseOrderItem               as PurchaseOrderItem,
  key _PurOrd.PurchaseOrderScheduleLine       as PurchaseOrderScheduleLine,
      cast(_Res.Material as abap.char(40))    as ReservationMaterial,
      _Res.RequirementDate                    as RequirementDate,
      _Res.Plant                              as ReservationPlant,
      _Res.StorageLocation                    as StorageLocation,
      _Res.BaseUnit                           as BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Res.RequiredQuantity                   as RequiredQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Res.WithdrawnQuantity                  as WithdrawnQuantity,
      //_Res.ReferenceOrder                     as RefererenceOrder,

      _PurOrd.PurchaseOrderQuantityUnit       as PurchaseOrderQuantityUnit,
      cast(_PurOrd.Material as abap.char(40)) as Material,
      _PurOrd.Plant                           as Plant,
      _PurOrd.PurchaseOrderType               as PurchaseOrderType,
      _PurOrd.SupplyingPlant                  as SupplyingPlant
}
where
      _Res.Material                   <> ''
  and _Res.ReservationIsFinallyIssued =  ''
  and _Res.RequiredQuantity           >  0
  and _Res.IsBulkMaterialComponent    =  ''
