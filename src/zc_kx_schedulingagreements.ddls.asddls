@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SchedulingAgreements - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_SchedulingAgreements
  as select from ZI_SchedulingAgreements
{
  key SchedulingAgreement,
      PurchasingDocumentCategory,
      PurchasingDocumentType,
      PurchasingOrganization,
      DocumentCurrency,
      PurchasingDocumentOrderDate,
      Supplier,
      ValidityStartDate,
      ValidityEndDate,
      PurchasingDocumentOrigin,
      PurchasingDocumentDeletionCode,
      SupplyingSupplier,
      SchedulingAgreementItem,
      Material,
      Plant,
      OrderQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      TargetQuantity,
      RequirementTracking,
      AccountAssignmentCategory,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetPriceAmount,
      @Semantics.quantity.unitOfMeasure: 'OrderPriceUnit'
      NetPriceQuantity,
      OrderPriceUnit,
      StorageLocation,
      PurchasingInfoRecord,
      OrdPriceUnitToOrderUnitDnmntr,
      OrderPriceUnitToOrderUnitNmrtr,
      StockType,
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
      PlannedDeliveryDurationInDays,
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
