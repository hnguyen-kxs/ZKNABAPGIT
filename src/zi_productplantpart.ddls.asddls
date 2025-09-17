@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProductPlant Part - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_ProductPlantPart
  as select from    I_ProductPlantSupplyPlanning as _SupPlan
    left outer join I_ProductDescription         as _MatDesc    on  _SupPlan.Product  = _MatDesc.Product
                                                                and _MatDesc.Language = 'E'
    left outer join I_ProductValuationBasic      as _ProductVal on  _SupPlan.Product = _ProductVal.Product
                                                                and _SupPlan.Plant   = _ProductVal.ValuationArea
    inner join      I_ProductPlantBasic          as _MatPlant   on  _SupPlan.Product = _MatPlant.Product
                                                                and _SupPlan.Plant   = _MatPlant.Plant
    inner join      I_Plant                      as _Plant      on _SupPlan.Plant = _Plant.Plant
    inner join      I_ProductStorage_2           as _Storage    on _SupPlan.Product = _Storage.Product
    inner join      I_Product                    as _Prod       on _SupPlan.Product = _Prod.Product
    left outer join I_MRPGroupControlParameter   as _MRPGroup   on  _SupPlan.MRPGroup = _MRPGroup.MRPGroup
                                                                and _SupPlan.Plant    = _MRPGroup.MRPPlant
    left outer join I_MRPLotSizingProcedure      as _MRPLotSize on _SupPlan.LotSizingProcedure = _MRPLotSize.MaterialLotSizingProcedure
    left outer join I_MRPPlantControlParameter   as _MRPPlant   on _SupPlan.Plant = _MRPPlant.MRPPlant
    left outer join I_ProductWorkScheduling      as _WorkSched  on  _SupPlan.Product = _WorkSched.Product
                                                                and _SupPlan.Plant   = _WorkSched.Plant

    left outer join I_MatlProcurementProfile     as _Prfl       on  _SupPlan.Plant              = _Prfl.Plant
                                                                and _SupPlan.ProcurementSubType = _Prfl.MaterialProcurementProfile

{
  key cast(_SupPlan.Product as abap.char(40))              as Product,
  key _SupPlan.Plant                                       as Plant,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.FixedLotSizeQuantity                        as FixedLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.MaximumLotSizeQuantity                      as MaximumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.MinimumLotSizeQuantity                      as MinimumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.LotSizeRoundingQuantity                     as LotSizeRoundingQuantity,
      _SupPlan.LotSizingProcedure                          as LotSizingProcedure,
      _SupPlan.MRPType                                     as MRPType,
      _MatPlant._MaterialLotSizingProcedure.MRPResponsible as MRPResponsible,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.SafetyStockQuantity                         as SafetyStockQuantity,
      _SupPlan.PlanningTimeFence                           as PlanningTimeFence,
      _SupPlan.ConsumptionValueCategory                    as ConsumptionValueCategory,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.ReorderThresholdQuantity                    as ReorderThresholdQuantity,
      _SupPlan.PlannedDeliveryDurationInDays               as PlannedDeliveryDurationInDays,
      _SupPlan.SafetySupplyDurationInDays                  as SafetySupplyDurationInDays,
      _SupPlan.PlanningStrategyGroup                       as PlanningStrategyGroup,
      _SupPlan.ProcurementType                             as ProcurementType,
      _SupPlan.ProcurementSubType                          as ProcurementSubType,
      _SupPlan.AssemblyScrapPercent                        as AssemblyScrapPercent,
      _SupPlan.GoodsReceiptDuration                        as GoodsReceiptDuration,
      _SupPlan.MRPGroup                                    as MRPGroup,
      _SupPlan.MRPPlanningCalendar                         as MRPPlanningCalendar,
      _SupPlan.ProdInhProdnDurationInWorkDays              as ProdInhProdnDurationInWorkDays,
      _SupPlan.MRPAvailabilityType                         as MRPAvailabilityType,
      _SupPlan.MRPPlanningCalendar                         as ProdnPlngAndControlCalendar,
      _SupPlan.FollowUpProduct                             as FollowUpProduct,
      _SupPlan.BackwardCnsmpnPeriodInWorkDays              as BackwardCnsmpnPeriodInWorkDays,
      _SupPlan.FwdConsumptionPeriodInWorkDays              as FwdConsumptionPeriodInWorkDays,
      _SupPlan.EffectiveOutDate                            as EffectiveOutDate,
      _SupPlan.ComponentScrapInPercent                     as ComponentScrapInPercent,
      _SupPlan._Product.BaseUnit                           as BaseUnit,

      _MatDesc.ProductDescription                          as ProductDescription,

      _ProductVal.Currency                                 as Currency,
      @Semantics.amount.currencyCode: 'Currency'
      _ProductVal.StandardPrice                            as StandardPrice,
      _ProductVal.PriceUnitQty                             as PriceUnitQty,
      _ProductVal.InventoryValuationProcedure              as InventoryValuationProcedure,
      @Semantics.amount.currencyCode: 'Currency'
      _ProductVal.MovingAveragePrice                       as MovingAveragePrice,

      _MatPlant.PurchasingGroup                            as PurchasingGroup,
      _MatPlant.IsMarkedForDeletion                        as IsMarkedForDeletion,
      _MatPlant.ConfigurableProduct                        as ConfigurableProduct,

      _Plant.FactoryCalendar                               as FactoryCalendar,

      _Storage.MinRemainingShelfLife                       as MinRemainingShelfLife,

      _Prod.IsMarkedForDeletion                            as IsMarkedForDeletionMara,
      _Prod.ProductGroup                                   as ProductGroup,
      _Prod.ItemCategoryGroup                              as ItemCategoryGroup,
      _Prod.Division                                       as Division,
      _Prod.LaboratoryOrDesignOffice                       as LaboratoryOrDesignOffice,

      _MRPGroup.PlanningStrategyGroup                      as MRPGroupPlanningStrategyGroup,
      _MRPGroup.BackwardCnsmpnPeriodInWorkDays             as BwdConsumptionPerMRPGroup,
      _MRPGroup.FwdConsumptionPeriodInWorkDays             as FwdConsumptionPerMRPGroup,

      _MRPLotSize.LotSizeType                              as LotSizeType,

      _MRPPlant.PurchasingProcessingDuration               as PurchasingProcessingDuration,

      _WorkSched.HasProductionVersion                      as HasProductionVersion,

      _Prfl.SupplyingOrProductionPlant                     as SupplyingOrProductionPlant

}
where
      _MatPlant.IsMarkedForDeletion = ' '
  and _Prod.IsMarkedForDeletion     = ' '
