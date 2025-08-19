@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PurchaseOrders
  as select from ZI_PurchaseOrders
{
  key PurchaseOrder,
  key PurchaseOrderItem,
  key PurchaseOrderScheduleLine,
      ScheduleLineDeliveryDate,
      SchedLineStscDeliveryDate,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      ScheduleLineOrderQuantity,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      RoughGoodsReceiptQty,
      PurchaseOrderQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      MRPRelevantQuantity,

      Material,
      Plant,
      OrderItemQtyToBaseQtyNmrtr,
      OrderItemQtyToBaseQtyDnmntr,
      NetPriceQuantity,
      PlannedDeliveryDurationInDays,
      GoodsReceiptDurationInDays,
      DocumentCurrency,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetPriceAmount,

      PurchaseOrderType,
      Supplier,
      SupplierName
}
