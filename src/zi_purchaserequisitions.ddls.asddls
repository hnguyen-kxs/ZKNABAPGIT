@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Requisition - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_PurchaseRequisitions
  as select from I_PurchaseRequisitionItemAPI01
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
where
        IsDeleted         =  ''
  and   IsClosed          =  ''
  and   ProcessingStatus  <> 'L'
  and   RequestedQuantity >  0
  and   Material          != ''
  and   not(
      ConsumptionPosting  =  'V'
      and PurReqnOrigin   =  'V'
    )
