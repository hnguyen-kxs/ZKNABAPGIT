@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_PurchaseOrders
  as select from    I_PurOrdScheduleLineAPI01 as _PurOrdLine
    inner join      I_PurchaseOrderItemAPI01  as _PurOrdItem on  _PurOrdLine.PurchaseOrder     = _PurOrdItem.PurchaseOrder
                                                             and _PurOrdLine.PurchaseOrderItem = _PurOrdItem.PurchaseOrderItem
    inner join      I_PurchaseOrderAPI01      as _PurOrd     on _PurOrdLine.PurchaseOrder = _PurOrd.PurchaseOrder
    left outer join I_Supplier                as _Supplier   on _PurOrd.Supplier = _Supplier.Supplier
{
  key _PurOrdLine.PurchaseOrder                 as PurchaseOrder,
  key _PurOrdLine.PurchaseOrderItem             as PurchaseOrderItem,
  key _PurOrdLine.PurchaseOrderScheduleLine     as PurchaseOrderScheduleLine,
      _PurOrdLine.ScheduleLineDeliveryDate      as ScheduleLineDeliveryDate,
      _PurOrdLine.SchedLineStscDeliveryDate     as SchedLineStscDeliveryDate,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      _PurOrdLine.ScheduleLineOrderQuantity     as ScheduleLineOrderQuantity,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      _PurOrdLine.RoughGoodsReceiptQty          as RoughGoodsReceiptQty,
      _PurOrdLine.PurchaseOrderQuantityUnit     as PurchaseOrderQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      _PurOrdLine.MRPRelevantQuantity           as MRPRelevantQuantity,

      _PurOrdItem.Material                      as Material,
      _PurOrdItem.Plant                         as Plant,
      _PurOrdItem.OrderItemQtyToBaseQtyNmrtr    as OrderItemQtyToBaseQtyNmrtr,
      _PurOrdItem.OrderItemQtyToBaseQtyDnmntr   as OrderItemQtyToBaseQtyDnmntr,
      _PurOrdItem.NetPriceQuantity              as NetPriceQuantity,
      _PurOrdItem.PlannedDeliveryDurationInDays as PlannedDeliveryDurationInDays,
      _PurOrdItem.GoodsReceiptDurationInDays    as GoodsReceiptDurationInDays,
      _PurOrdItem. DocumentCurrency             as DocumentCurrency,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _PurOrdItem.NetPriceAmount                as NetPriceAmount,


      _PurOrd.PurchaseOrderType                 as PurchaseOrderType,
      _PurOrd.Supplier                          as Supplier,
      _PurOrd.SupplyingPlant                    as SupplyingPlant,
      _Supplier.SupplierName                    as SupplierName

}
where
      _PurOrd.PurchasingDocumentDeletionCode     =  ''
  and _PurOrdItem.PurchaseOrderCategory          <> 'A'
  and _PurOrdItem.PurchasingDocumentDeletionCode =  ''
  and _PurOrdItem.IsCompletelyDelivered          =  ''
  and _PurOrdItem.IsFinallyInvoiced              =  ''
  and _PurOrdItem.Material                       <> ''
  and _PurOrdItem.OrderQuantity                  >  0
  and _PurOrdLine.ScheduleLineOrderQuantity      >  0
