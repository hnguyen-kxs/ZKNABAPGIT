@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SalesOrders HDA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SalesOrders_HDA
  as select from I_SalesDocumentItem         as _Item
    inner join   I_SalesDocumentScheduleLine as _Sched  on  _Item.SalesDocument     = _Sched.SalesDocument
                                                        and _Item.SalesDocumentItem = _Sched.SalesDocumentItem
    inner join   I_SalesDocument             as _Header on _Item.SalesDocument = _Header.SalesDocument
{
  key _Item.SalesDocument                                       as SalesDocument,
  key _Item.SalesDocumentItem                                   as SalesDocumentItem,
  key _Sched.ScheduleLine                                       as ScheduleLine,
      _Item.IndependentRequirementType                          as IndependentRequirementType, //bedae
      _Item.MRPArea                                             as MRPArea, //berid
      _Item.DeliveryGroup                                       as DeliveryGroup, //grkpr
      cast(_Item.ConfdDelivQtyInOrderQtyUnit as abap.char(17) ) as ConfdDelivQtyInOrderQtyUnit, //kbmeng
      _Item.NetPriceQuantityUnit                                as NetPriceQuantityUnit, //kmein
      _Item.NetPriceQuantity                                    as NetPriceQuantity, //kpein
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _Item.OrderQuantity                                       as OrderQuantity, //kwmeng
      _Item.PartialDeliveryIsAllowed                            as PartialDeliveryIsAllowed, //kztlf
      _Item.ItemIsDeliveryRelevant                              as ItemIsDeliveryRelevant, //lfrel
      _Item.StorageLocation                                     as StorageLocation, //lgort
      _Item.DeliveryPriority                                    as DeliveryPriority, //lprio
      cast(_Item.Material as abap.char(40))                     as Material, //matnr
      _Item.BaseUnit                                            as BaseUnit, //meins
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _Item.NetPriceAmount                                      as NetPriceAmount, //netpr
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _Item.NetAmount                                           as NetAmount, //netwr
      _Item.UnderlyingPurchaseOrderItem                         as UnderlyingPurchaseOrderItem, //posex
      _Item.SalesDocumentItemCategory                           as SalesDocumentItemCategory, //pstyv
      cast(_Item.WBSElement as abap.char(24))                   as WBSElement, //ps_psp_pnr
      _Item._Route.Route                                        as Route, //route
      //sernr not exposed
      _Item.BOMExplosionDate                                    as BOMExplosionDate, //stdat
      _Item.HigherLevelItem                                     as HigherLevelItem, //uepos
      _Item.OrderToBaseQuantityDnmntr                           as OrderToBaseQuantityDnmntr, //umvkn
      _Item.OrderToBaseQuantityNmrtr                            as OrderToBaseQuantityNmrtr, //umvkz
      _Item.TargetToBaseQuantityNmrtr                           as TargetToBaseQuantityNmrtr, //umziz
      _Item.OrderQuantityUnit                                   as OrderQuantityUnit, //vrkme
      _Item.ShippingPoint                                       as ShippingPoint, //vstel
      _Item.TransactionCurrency                                 as TransactionCurrency, //waerk
      _Item.Plant                                               as Plant, //werks
      _Item.TargetQuantityUnit                                  as TargetQuantityUnit, //zieme
      _Item.CustomerGroup                                       as CustomerGroup, //kdgrp_ana
      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      _Item.TargetQuantity                                      as TargetQuantity, //zmeng
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _Sched.ConfdOrderQtyByMatlAvailCheck                      as ConfdOrderQtyByMatlAvailCheck, //SalesLine //bmeng
      _Sched.DeliveryDate                                       as DeliveryDate, //edatu
      _Sched.ProductAvailabilityDate                            as ProductAvailabilityDate, //mbdat
      _Item.CreationDate                                        as CreationDate, //erdat
      _Header.CreationDate                                      as CreatedOnHeader,
      _Header.SoldToParty                                       as SoldToParty, //kunnr
      _Header.SalesDocumentType                                 as SalesDocumentType //aurt
}
