@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SalesOrder - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_SalesOrders
  as select from ZI_SalesOrders
{
  key SalesDocument,
  key SalesDocumentItem,
  key ScheduleLine,
      ScheduleLineCategory,
      OrderQuantityUnit,
      DeliveryDate,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ScheduleLineOrderQuantity,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ConfdOrderQtyByMatlAvailCheck,
      ProductAvailabilityDate,
      ProdAvailabilityCheckRqmtType,
      GoodsIssueDate,
      ItemIsDeliveryRelevant,
      DelivBlockReasonForSchedLine,
      SalesDocumentType,
      Product,
      Plant,
      Batch,
      InventorySpecialStockType,
      SoldToParty,
      IndependentRqmtMRPRelevancy,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequestedQuantityInBaseUnit,
      SalesDocumentItemCategory,
      MRPArea,
      IndependentRequirementType,
      UnderlyingPurchaseOrderItem,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderToBaseQuantityDnmntr,
      OrderToBaseQuantityNmrtr,
      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      TargetQuantity,
      TargetQuantityUnit,
      TargetToBaseQuantityDnmntr,
      TargetToBaseQuantityNmrtr,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ConfdDelivQtyInOrderQtyUnit,
      BaseUnit,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetPriceAmount,
      NetPriceQuantity,
      NetPriceQuantityUnit,
      ShippingPoint,
      DeliveryPriority,
      StorageLocation,
      Route,
      DeliveryGroup,
      PartialDeliveryIsAllowed,
      CustomerName,
      SalesDocumentTypeLangDepdnt
}
