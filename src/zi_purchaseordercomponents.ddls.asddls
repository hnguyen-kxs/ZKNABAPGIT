@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PurchaseOrderComponents - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_PurchaseOrderComponents
  as select from I_ReservationDocumentItem as _Res
    inner join   ZI_PurchaseOrders         as _PurOrd on _Res.Reservation = _PurOrd.Reservation
{
  key _Res.Reservation                        as Reservation,
  key _Res.ReservationItem                    as ReservationItem,
  key _Res.RecordType                         as RecordType,
      cast(_Res.Product as abap.char(40))     as ReservationMaterial,
      _Res.RequirementType                    as RequirementType,
      _Res.MatlCompRequirementDate            as MatlCompRequirementDate,
      _Res.Plant                              as Plant,
      _Res.StorageLocation                    as StorageLocation,
      _Res.BaseUnit                           as BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Res.ResvnItmRequiredQtyInBaseUnit      as ResvnItmRequiredQtyInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Res.ResvnItmWithdrawnQtyInBaseUnit     as ResvnItmWithdrawnQtyInBaseUnit,
      //_Res.ReferenceOrder                     as RefererenceOrder,

      _PurOrd.PurchaseOrder                   as PurchaseOrder,
      _PurOrd.PurchaseOrderItem               as PurchaseOrderItem,
      _PurOrd.PurchaseOrderScheduleLine       as PurchaseOrderScheduleLine,
      _PurOrd.PurchaseOrderQuantityUnit       as PurchaseOrderQuantityUnit,
      cast(_PurOrd.Material as abap.char(40)) as PurchaseOrderMaterial,
      _PurOrd.Plant                           as PurchaseOrderPlant,
      _PurOrd.PurchaseOrderType               as PurchaseOrderType,
      _PurOrd.SupplyingPlant                  as PurchaseOrderSupplyingPlant
}
where
      _Res.Product                        <> ''
  and _Res.ReservationItmIsMarkedForDeltn =  ''
  and _Res.ReservationItemIsFinallyIssued =  ''
  and _Res.ResvnItmRequiredQtyInBaseUnit  >  0
//  and _Res.IsBulkMaterialComponent        =  ''
//  and _res.MaterialComponentIsPhantomItem =  ''
