@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reservations - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Reservations
  as select from I_ReservationDocumentItem as _Res
{
  key _Res.Reservation                                       as Reservation,
  key _Res.ReservationItem                                   as ReservationItem,
  key _Res.RecordType                                        as RecordType,
      cast(_Res.Product as abap.char(40))                    as Material,
      _Res.RequirementType                                   as RequirementType,
      _Res.MatlCompRequirementDate                           as MatlCompRequirementDate,
      _Res.Plant                                             as Plant,
      cast(_Res.ManufacturingOrderOperation as abap.char(4)) as ManufacturingOrderOperation,
      _Res.StorageLocation                                   as StorageLocation,
      _Res.DebitCreditCode                                   as DebitCreditCode,
      _Res.GoodsMovementType                                 as GoodsMovementType,
      _Res.CompanyCodeCurrency                               as CompanyCodeCurrency,
      _Res.IssuingOrReceivingPlant                           as IssuingOrReceivingPlant,
      _Res.IssuingOrReceivingStorageLoc                      as IssuingOrReceivingStorageLoc,
      _Res.PurchasingDocument                                as PurchasingDocument,
      _Res.PurchasingDocumentItem                            as PurchasingDocumentItem,
      _Res.BaseUnit                                          as BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Res.ResvnItmRequiredQtyInBaseUnit                     as ResvnItmRequiredQtyInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Res.ResvnItmWithdrawnQtyInBaseUnit                    as ResvnItmWithdrawnQtyInBaseUnit,
      _Res.Supplier                                          as Supplier
      //_Res.ScheduleLine as ScheduleLine
}
where
      _Res.Product                        <> ''
  and _Res.ReservationItmIsMarkedForDeltn =  ''
  and _Res.ReservationItemIsFinallyIssued =  ''
  and _Res.ResvnItmRequiredQtyInBaseUnit  >  0
