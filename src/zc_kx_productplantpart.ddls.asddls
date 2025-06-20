@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProductPlant Part'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_KX_ProductPlantPart
  as select from ZI_KX_ProductPlantPart
{
  key  Product,
  key  Plant,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       FixedLotSizeQuantity,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       MaximumLotSizeQuantity,
       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
       MinimumLotSizeQuantity as MinimumLotSizeQuantity,
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
       PlanningStrategyGroup1,
       //BackwardCnsmpnPeriodInWorkDay1,
       //FwdConsumptionPeriodInWorkDay1,
       LotSizeType,
       PurchasingProcessingDuration,
       HasProductionVersion
}
