@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Confirmation - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_POConfirmations
  as select from ZI_POConfirmations
{
  key PurchaseOrder,
  key PurchaseOrderItem,
  key SequentialNmbrOfSuplrConf,
      SupplierConfirmationCategory,
      DeliveryDate,
      DelivDateCategory,
      DeliveryTime,
      CreationDate,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ConfirmedQuantity,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      MRPRelevantQuantity,
      SuplrConfCreationCategory,
      IsDeleted,
      ConfIsRelevantToMRP,
      SupplierConfirmationExtNumber,
      DeliveryDocument,
      DeliveryDocumentItem,
      ManufacturerPartProfile,
      ManufacturerMaterial,
      Batch,
      OrderQuantityUnit,
      PurchaseOrderCategory,
      DocumentCurrencyPOItem,
      Material,
      Plant,
      Subcontractor,
      SupplierIsSubcontractor,
      StorageLocation,
      PurchaseOrderQuantityUnit,
      OrderItemQtyToBaseQtyNmrtr,
      OrderItemQtyToBaseQtyDnmntr,
      NetPriceQuantity,
      PlannedDeliveryDurationInDays,
      GoodsReceiptDurationInDays,
      PurchaseOrderItemCategory,
      OrderPriceUnit,
      AccountAssignmentCategory,
      PurchasingInfoRecord,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      OrderQuantity,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetPriceAmount,
      OrderPriceUnitToOrderUnitNmrtr,
      OrdPriceUnitToOrderUnitDnmntr,
      StockType,
      InventorySpecialStockType,
      PurchaseOrderType,
      PurchasingDocumentOrigin,
      PurchaseOrderDate,
      PurchasingDocumentDeletionCode,
      ReleaseCode,
      PurchasingOrganization,
      Supplier,
      SupplyingSupplier,
      SupplyingPlant,
      DocumentCurrency,
      ValidityStartDate,
      ValidityEndDate,
      SupplierName
}
