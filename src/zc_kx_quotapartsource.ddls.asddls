@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quota PartSource - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_QuotaPartSource
  as select from ZI_QuotaPartSource
{
  key QuotaArrangement,
  key QuotaArrangementItem,
      Material,
      Plant,
      ValidityEndDate,
      ValidityStartDate,
      MaterialBaseUnit,
      MaterialProcurementCategory,
      MaterialProcurementType,
      Supplier,
      SupplyingPlant,
      PurchasingSourceQuota,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      QuotaBaseQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      QuotaAllocatedQuantity,
      ProductionVersion,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MaterialMaxLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MaterialMinLotSizeQuantity,
      MaterialRoundingProfile,
      SourceOfSupplyIsAssignedOnce,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MaximumReleaseQuantity,
      QuotaReleasePeriodType,
      QuotaDeterminationPriority,
      ManufacturerMaterial,
      QuotaPlannedDelDurInDays,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      FixedLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MaximumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MinimumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      LotSizeRoundingQuantity,
      LotSizingProcedure,
      PlanningTimeFence,
      PlannedDeliveryDurationInDays,
      ProcurementType,
      ProcurementSubType,
      AssemblyScrapPercent,
      GoodsReceiptDuration,
      ProdInhProdnDurationInWorkDays,
      FactoryCalendar,
      Currency,
      @Semantics.amount.currencyCode: 'Currency'
      StandardPrice,
      PriceUnitQty,
      SupplierName,
      SupplyingOrProductionPlant
}
