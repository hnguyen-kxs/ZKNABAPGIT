@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ProductPlant Part - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_ProductPlantPart
  as select from ZI_ProductPlantPart
{
  key  Product,
  key  Plant,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       FixedLotSizeQuantity,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       MaximumLotSizeQuantity,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       MinimumLotSizeQuantity,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       LotSizeRoundingQuantity,
       LotSizingProcedure,
       MRPType,
       MRPResponsible,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       SafetyStockQuantity,
       PlanningTimeFence,
       ConsumptionValueCategory,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       ReorderThresholdQuantity,
       PlannedDeliveryDurationInDays,
       SafetySupplyDurationInDays,
       PlanningStrategyGroup,
       ProcurementType,
       ProcurementSubType,
       AssemblyScrapPercent,
       GoodsReceiptDuration,
       MRPGroup,
       MRPPlanningCalendar,
       ProdInhProdnDurationInWorkDays,
       MRPAvailabilityType,
       ProdnPlngAndControlCalendar,
       FollowUpProduct,
       BackwardCnsmpnPeriodInWorkDays,
       FwdConsumptionPeriodInWorkDays,
       EffectiveOutDate,
       ComponentScrapInPercent,
       BaseUnit,
       ProductDescription,
       Currency,
       @Semantics.amount.currencyCode: 'Currency'
       StandardPrice,
       PriceUnitQty,
       InventoryValuationProcedure,
       @Semantics.amount.currencyCode: 'Currency'
       MovingAveragePrice,
       PurchasingGroup,
       IsMarkedForDeletion,
       ConfigurableProduct,
       FactoryCalendar,
       MinRemainingShelfLife,
       IsMarkedForDeletionMara,
       ProductGroup,
       ItemCategoryGroup,
       Division,
       LaboratoryOrDesignOffice,
       MRPGroupPlanningStrategyGroup,
       BwdConsumptionPerMRPGroup,
       FwdConsumptionPerMRPGroup,
       LotSizeType,
       PurchasingProcessingDuration,
       HasProductionVersion,
       SupplyingOrProductionPlant
}
