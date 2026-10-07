@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HistoricalDemand - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_HistoricalDemand
  with parameters
    p_days : int2
  as select from ZI_KX_HistoricalDemand( p_days: $parameters.p_days )
{
  key DeliveryDocument,
  key DeliveryDocumentItem,
      SalesDocument,
      SalesDocumentItem,
      ScheduleLine,
      Customer,
      ShipToParty,
      DeliveryDocumentType,
      ActualGoodsMovementDate,
      DeliveryGroup,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      ActualDeliveryQuantity,
      StorageLocation,
      Material,
      ProductAvailabilityDate,
      BaseUnit,
      NetPriceAmount,
      DeliveryToBaseQuantityDnmntr,
      DeliveryToBaseQuantityNmrtr,
      ReferenceSDDocument,
      ReferenceSDDocumentItem,
      DeliveryQuantityUnit,
      Plant,
      IndependentRequirementType,
      MRPAreaSales,
      DeliveryGroupSales,
      ConfdDelivQtyInOrderQtyUnit,
      NetPriceQuantityUnit,
      NetPriceQuantity,
      PartialDeliveryIsAllowed,
      ItemIsDeliveryRelevant,
      StorageLocationSales,
      DeliveryPriority,
      MaterialSales,
      BaseUnitSales,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetPriceAmountSales,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      UnderlyingPurchaseOrderItem,
      SalesDocumentItemCategory,
      WBSElement,
      Route,
      BOMExplosionDate,
      HigherLevelItem,
      OrderToBaseQuantityDnmntr,
      OrderToBaseQuantityNmrtr,
      TargetToBaseQuantityNmrtr,
      OrderQuantityUnit,
      ShippingPoint,
      TransactionCurrency,
      PlantSales,
      TargetQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      TargetQuantity,
      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      ConfdOrderQtyByMatlAvailCheck,
      DeliveryDate,
      ProductAvailDateSales,
      CreationDateItem,
      CreationDate,
      SoldToParty,
      SalesDocumentType,
      CustomerGroup,
      Industry,
      CustomerAccountGroup,
      CustomerName
}
