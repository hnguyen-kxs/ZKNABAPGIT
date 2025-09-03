@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProductVersion PartSource - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_ProdVersionPartSource
  as select from ZI_ProdVersionPartSource
{
  key    Material,
  key    Plant,
  key    ProductionVersion,
         BillOfOperationsType,
         BillOfOperationsGroup,
         BillOfOperationsVariant,
         BillOfMaterialVariantUsage,
         BillOfMaterialVariant,
         ValidityStartDate,
         ValidityEndDate,
         ProductionVersionIsLocked,
         MaterialProcurementProfile,
         MaterialBaseUnit,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         MaterialMinLotSizeQuantity,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         MaterialMaxLotSizeQuantity,
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
         SupplyingOrProductionPlant
}
