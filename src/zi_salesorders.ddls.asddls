@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SalesOrders - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SalesOrders
  as select from    I_SalesDocumentScheduleLine    as _SalesOrd
    inner join      I_SDScheduleLineWthOpenRqmtQty as _OpenQty   on  _SalesOrd.SalesDocument     = _OpenQty.SalesDocument
                                                                 and _SalesOrd.SalesDocumentItem = _OpenQty.SalesDocumentItem
                                                                 and _SalesOrd.ScheduleLine      = _OpenQty.ScheduleLine
    inner join      I_SalesDocumentItem            as _SalesItem on  _SalesOrd.SalesDocument     = _SalesItem.SalesDocument
                                                                 and _SalesOrd.SalesDocumentItem = _SalesItem.SalesDocumentItem
    inner join      I_Customer                     as _Customer  on _OpenQty.SoldToParty = _Customer.Customer
    left outer join I_SalesDocumentTypeLangDepdnt  as _Tauum     on  _OpenQty.SalesDocumentType = _Tauum.SalesDocumentType
                                                                 and _Tauum.Language            = 'E'
{
  key _SalesOrd.SalesDocument                 as SalesDocument,
  key _SalesOrd.SalesDocumentItem             as SalesDocumentItem,
  key _SalesOrd.ScheduleLine                  as ScheduleLine,
      _SalesOrd.ScheduleLineCategory          as ScheduleLineCategory,
      _SalesOrd.OrderQuantityUnit             as OrderQuantityUnit,
      _SalesOrd.DeliveryDate                  as DeliveryDate,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _SalesOrd.ScheduleLineOrderQuantity     as ScheduleLineOrderQuantity,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _SalesOrd.ConfdOrderQtyByMatlAvailCheck as ConfdOrderQtyByMatlAvailCheck,
      _SalesOrd.ProductAvailabilityDate       as ProductAvailabilityDate,
      _SalesOrd.ProdAvailabilityCheckRqmtType as ProdAvailabilityCheckRqmtType,
      _SalesOrd.GoodsIssueDate                as GoodsIssueDate,
      _SalesOrd.ItemIsDeliveryRelevant        as ItemIsDeliveryRelevant,
      _SalesOrd.DelivBlockReasonForSchedLine  as DelivBlockReasonForSchedLine,

      _OpenQty.SalesDocumentType              as SalesDocumentType,
      cast(_OpenQty.Product as abap.char(40)) as Product,
      _OpenQty.Plant                          as Plant,
      _OpenQty.Batch                          as Batch,
      _OpenQty.InventorySpecialStockType      as InventorySpecialStockType,
      _OpenQty.SoldToParty                    as SoldToParty,
      _OpenQty.IndependentRqmtMRPRelevancy    as IndependentRqmtMRPRelevancy,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _OpenQty.RequestedQuantityInBaseUnit    as RequestedQuantityInBaseUnit,

      _SalesItem.SalesDocumentItemCategory    as SalesDocumentItemCategory,
      _SalesItem.MRPArea                      as MRPArea,
      _SalesItem.IndependentRequirementType   as IndependentRequirementType,
      _SalesItem.UnderlyingPurchaseOrderItem  as UnderlyingPurchaseOrderItem,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _SalesItem.OrderQuantity                as OrderQuantity,
      _SalesItem.OrderToBaseQuantityDnmntr    as OrderToBaseQuantityDnmntr,
      _SalesItem.OrderToBaseQuantityNmrtr     as OrderToBaseQuantityNmrtr,

      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      _SalesItem.TargetQuantity               as TargetQuantity,
      _SalesItem.TargetQuantityUnit           as TargetQuantityUnit,
      _SalesItem.TargetToBaseQuantityDnmntr   as TargetToBaseQuantityDnmntr,
      _SalesItem.TargetToBaseQuantityNmrtr    as TargetToBaseQuantityNmrtr,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _SalesItem.ConfdDelivQtyInOrderQtyUnit  as ConfdDelivQtyInOrderQtyUnit,
      _SalesItem.BaseUnit                     as BaseUnit,
      _SalesItem.TransactionCurrency          as TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _SalesItem.NetAmount                    as NetAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _SalesItem.NetPriceAmount               as NetPriceAmount,
      _SalesItem.NetPriceQuantity             as NetPriceQuantity,
      _SalesItem.NetPriceQuantityUnit         as NetPriceQuantityUnit,
      _SalesItem.ShippingPoint                as ShippingPoint,
      _SalesItem.DeliveryPriority             as DeliveryPriority,
      _SalesItem.StorageLocation              as StorageLocation,
      _SalesItem.Route                        as Route,
      _SalesItem.DeliveryGroup                as DeliveryGroup,
      _SalesItem.PartialDeliveryIsAllowed     as PartialDeliveryIsAllowed,

      _Customer.CustomerName                  as CustomerName,

      _Tauum.SalesDocumentTypeLangDepdnt      as SalesDocumentTypeLangDepdnt
}
where
       _SalesItem.SalesDocumentRjcnReason     =  ''
  and(
       _SalesItem.ConfdDelivQtyInOrderQtyUnit != 0
    or _SalesItem.ItemIsDeliveryRelevant      =  'X'
  )
  and  _SalesItem.SDDocumentCategory          =  'C'
  or   _SalesItem.SDDocumentCategory          =  'E'
  or   _SalesItem.SDDocumentCategory          =  'I'
