@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Delivery HDA - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_Delivery_HDA
  with parameters
    p_days : int2
  as select from I_DeliveryDocumentItem as _Item
    inner join   I_DeliveryDocument     as _Header on _Item.DeliveryDocument = _Header.DeliveryDocument
{
  key _Item.DeliveryDocument                       as DeliveryDocument, //vbeln
  key _Item.DeliveryDocumentItem                   as DeliveryDocumentItem, //posnr
      _Header.ShipToParty                          as ShipToParty, //kunnr
      _Header.DeliveryDocumentType                 as DeliveryDocumentType, //lfart
      _Header.ActualGoodsMovementDate              as ActualGoodsMovementDate, //wadat_ist
      //berid MRPArea not exposed
      _Item.DeliveryGroup                          as DeliveryGroup, //grkor
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Item.ActualDeliveryQuantity                 as ActualDeliveryQuantity, //lfimg
      _Item.StorageLocation                        as StorageLocation, //lgort
      cast(_Item.Material as abap.char(40))        as Material, //matnr
      _Item.ProductAvailabilityDate                as ProductAvailabilityDate, //mbdat,
      _Item.BaseUnit                               as BaseUnit, //meins
      cast(_Item.NetPriceAmount as abap.char(17) ) as NetPriceAmount, //netpr
      _Item.DeliveryToBaseQuantityDnmntr           as DeliveryToBaseQuantityDnmntr, //umvkn
      _Item.DeliveryToBaseQuantityNmrtr            as DeliveryToBaseQuantityNmrtr, // umvkz
      _Item.ReferenceSDDocument                    as ReferenceSDDocument, //vgbel
      _Item.ReferenceSDDocumentItem                as ReferenceSDDocumentItem, //vgpos
      _Item.DeliveryQuantityUnit                   as DeliveryQuantityUnit, //vrkme
      _Item.Plant                                  as Plant //werks
}
where
  _Header.ActualGoodsMovementDate >=(dats_add_days( $session.system_date, -$parameters.p_days, 'FAIL' ) )
