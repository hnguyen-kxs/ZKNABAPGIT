@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Historical Supply Buy - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_HistoricalSupplyBuy
  with parameters
    p_days : int2
  as select from ZI_HistoricalSupplyBuy( p_days: $parameters.p_days  )
{
  key    PurchaseOrder,
  key    PurchaseOrderItem,
  key    AccountAssignmentNumber,
  key    PurchasingHistoryDocumentType,
  key    PurchasingHistoryDocumentYear,
  key    PurchasingHistoryDocument,
  key    PurchasingHistoryDocumentItem,
         Currency,
         DebitCreditCode,
         Material,
         Plant,
         PostingDate,
         @Semantics.quantity.unitOfMeasure:'PurchaseOrderQuantityUnit'
         Quantity,
         PurchaseOrderType,
         PurchaseOrderDate,
         Supplier,
         SupplyingPlant,
         PurchaseOrderQuantityUnit,
         OrderItemQtyToBaseQtyNmrtr,
         OrderItemQtyToBaseQtyDnmntr,
         @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
         NetPriceQuantity,
         OrderPriceUnit,
         @Semantics.amount.currencyCode: 'Currency'
         NetPriceAmount,
         OrderPriceUnitToOrderUnitNmrtr,
         OrdPriceUnitToOrderUnitDnmntr,
         BaseUnit
}
