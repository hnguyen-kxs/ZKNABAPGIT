@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Delivery - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_Deliveries
  as select from ZI_Deliveries
{
  key DeliveryDocument,
  key DeliveryDocumentItem,
      SDDocumentCategory,
      Material,
      Plant,
      StorageLocation,
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      ActualDeliveryQuantity,
      DeliveryQuantityUnit,
      BaseUnit,
      DeliveryToBaseQuantityDnmntr,
      DeliveryToBaseQuantityNmrtr,
      ProductAvailabilityDate,
      DeliveryGroup,
      ReferenceSDDocument,
      ReferenceSDDocumentItem,
      @Semantics.amount.currencyCode:'TransactionCurrency'
      NetPriceAmount,
      TransactionCurrency,
      DeliveryDocumentType,
      ShipToParty,
      ActualGoodsMovementDate,
      SalesDocument,
      SalesDocumentItem,
      ScheduleLine,
      SalesDocumentType,
      RequirementType,
      Batch,
      AccountAssignmentCategory,
      IndependentRqmtMRPRelevancy,
      CustomerName
}
