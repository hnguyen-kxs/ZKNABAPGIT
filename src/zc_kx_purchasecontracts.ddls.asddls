@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PurchaseContracts - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PurchaseContracts
  as select from ZI_PurchaseContracts
{
  key PurchaseContract,
  key PurchaseContractItem,
      PurchaseContractType,
      PurchasingDocumentCategory,
      Supplier,
      PurchasingOrganization,
      DocumentCurrency,
      ValidityStartDate,
      ValidityEndDate,
      ReleaseCode,
      PurchasingDocumentDeletionCode,
      SupplyingSupplier,
      PurchasingDocumentOrigin,
      Material,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      ContractNetPriceAmount,
      OrderPriceUnit,
      OrderQuantityUnit,
      Subcontractor,
      Plant,
      StorageLocation,
      AccountAssignmentCategory,
      @Semantics.quantity.unitOfMeasure: 'OrderPriceUnit'
      NetPriceQuantity,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      TargetQuantity,
      OrdPriceUnitToOrderUnitDnmntr,
      OrderPriceUnitToOrderUnitNmrtr,
      PurchasingDocumentItemCategory,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      PurgDocReleaseOrderQuantity,
      StockType,
      RequirementTracking,
      PlannedDeliveryDurationInDays,
      PurchasingInfoRecord,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      FixedLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      MaximumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      MinimumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      LotSizeRoundingQuantity,
      BaseUnit,
      LotSizingProcedure,
      PlanningTimeFence,
      PlannedDelDurationInDaysPlan,
      ProcurementType,
      ProcurementSubType,
      AssemblyScrapPercent,
      GoodsReceiptDuration,
      FactoryCalendar,
      @Semantics.amount.currencyCode: 'Currency'
      StandardPrice,
      Currency,
      PriceUnitQty,
      SupplierName
}
