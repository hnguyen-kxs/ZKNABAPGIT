@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Requisition - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PurchaseRequisitions
  as select from ZI_PurchaseRequisitions
{
  key PurchaseRequisition,
  key PurchaseRequisitionItem,
      PurchasingDocument,
      PurchasingDocumentItem,
      PurchaseRequisitionType,
      PurchasingDocumentItemCategory,
      Material,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequestedQuantity,
      BaseUnit,
      @Semantics.amount.currencyCode: 'PurReqnItemCurrency'
      PurchaseRequisitionPrice,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      PurReqnPriceQuantity,
      MaterialGoodsReceiptDuration,
      PurchaseRequisitionReleaseDate,
      Plant,
      SupplyingPlant,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      OrderedQuantity,
      DeliveryDate,
      CreationDate,
      ProcessingStatus,
      Supplier,
      FixedSupplier,
      PurReqnItemCurrency,
      MaterialPlannedDeliveryDurn,
      StorageLocation,
      PurReqnOrigin,
      Reservation,
      MRPArea,
      PurchaseRequisitionIsFixed

}
