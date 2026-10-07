@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Historical Supply Buy - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_HistoricalSupplyBuy
  with parameters
    p_days : int2
  as select from I_PurchaseOrderHistoryAPI01 as _History
    inner join   I_PurchaseOrderAPI01        as _Header on _History.PurchaseOrder = _Header.PurchaseOrder
    inner join   I_PurchaseOrderItemAPI01    as _Item   on  _History.PurchaseOrder     = _Item.PurchaseOrder
                                                        and _History.PurchaseOrderItem = _Item.PurchaseOrderItem
    inner join   I_Product                   as _Prod   on _History.Material = _Prod.Product
{
  key    _History.PurchaseOrder                   as PurchaseOrder,
  key    _History.PurchaseOrderItem               as PurchaseOrderItem,
  key    _History.AccountAssignmentNumber         as AccountAssignmentNumber,
  key    _History.PurchasingHistoryDocumentType   as PurchasingHistoryDocumentType,
  key    _History.PurchasingHistoryDocumentYear   as PurchasingHistoryDocumentYear,
  key    _History.PurchasingHistoryDocument       as PurchasingHistoryDocument,
  key    _History.PurchasingHistoryDocumentItem   as PurchasingHistoryDocumentItem,
         _History.Currency                        as Currency,
         _History.DebitCreditCode                 as DebitCreditCode,
         cast(_History.Material as abap.char(40)) as Material,
         _History.Plant                           as Plant,
         _History.PostingDate                     as PostingDate,
         @Semantics.quantity.unitOfMeasure:'PurchaseOrderQuantityUnit'
         _History.Quantity                        as Quantity,
         _Header.PurchaseOrderType                as PurchaseOrderType,
         _Header.PurchaseOrderDate                as PurchaseOrderDate,
         _Header.Supplier                         as Supplier,
         _Header.SupplyingPlant                   as SupplyingPlant,
         _Item.PurchaseOrderQuantityUnit          as PurchaseOrderQuantityUnit,
         _Item.OrderItemQtyToBaseQtyNmrtr         as OrderItemQtyToBaseQtyNmrtr,
         _Item.OrderItemQtyToBaseQtyDnmntr        as OrderItemQtyToBaseQtyDnmntr,
         @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
         _Item.NetPriceQuantity                   as NetPriceQuantity,
         _Item.OrderPriceUnit                     as OrderPriceUnit,
         @Semantics.amount.currencyCode: 'Currency'
         _Item.NetPriceAmount                     as NetPriceAmount,
         _Item.OrderPriceUnitToOrderUnitNmrtr     as OrderPriceUnitToOrderUnitNmrtr,
         _Item.OrdPriceUnitToOrderUnitDnmntr      as OrdPriceUnitToOrderUnitDnmntr,
         _Prod.BaseUnit                           as BaseUnit
}
where
      _History.PurchasingHistoryDocumentType =  '1'
  and _History.Material                      <> ''
  and _History.PostingDate                   >= (dats_add_days( $session.system_date, -$parameters.p_days, 'FAIL' ) )
