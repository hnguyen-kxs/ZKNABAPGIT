@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quota PartSource - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_QuotaPartSource
  as select from    I_PurgQuotaArrgmtAPI01       as _Quota
    inner join      I_PurgQuotaArrgmtItemAPI01   as _QuotaItem  on _Quota.QuotaArrangement = _QuotaItem.QuotaArrangement
    inner join      I_ProductPlantSupplyPlanning as _SupPlan    on  _Quota.Material = _SupPlan.Product
                                                                and _Quota.Plant    = _SupPlan.Plant
    left outer join I_ProductValuationBasic      as _ProductVal on  _Quota.Material = _ProductVal.Product
                                                                and _Quota.Plant    = _ProductVal.ValuationArea
    inner join      I_Plant                      as _Plant      on _Quota.Plant = _Plant.Plant
    left outer join I_Supplier                   as _Supplier   on _QuotaItem.Supplier = _Supplier.Supplier
    left outer join I_MatlProcurementProfile     as _Prfl       on  _SupPlan.Plant           = _Prfl.Plant
                                                                and _SupPlan.ProcurementSubType = _Prfl.MaterialProcurementProfile
{
  key    _Quota.QuotaArrangement                  as QuotaArrangement,
  key    _QuotaItem.QuotaArrangementItem          as QuotaArrangementItem,
         _Quota.Material                          as Material,
         _Quota.Plant                             as Plant,
         _Quota.ValidityEndDate                   as ValidityEndDate,
         _Quota.ValidityStartDate                 as ValidityStartDate,
         _Quota.MaterialBaseUnit                  as MaterialBaseUnit,
         _QuotaItem.MaterialProcurementCategory   as MaterialProcurementCategory,
         _QuotaItem.MaterialProcurementType       as MaterialProcurementType,
         _QuotaItem.Supplier                      as Supplier,
         _QuotaItem.SupplyingPlant                as SupplyingPlant,
         _QuotaItem.PurchasingSourceQuota         as PurchasingSourceQuota,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _QuotaItem.QuotaBaseQuantity             as QuotaBaseQuantity,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _QuotaItem.QuotaAllocatedQuantity        as QuotaAllocatedQuantity,
         _QuotaItem.ProductionVersion             as ProductionVersion,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _QuotaItem.MaterialMaxLotSizeQuantity    as MaterialMaxLotSizeQuantity,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _QuotaItem.MaterialMinLotSizeQuantity    as MaterialMinLotSizeQuantity,
         _QuotaItem.MaterialRoundingProfile       as MaterialRoundingProfile,
         _QuotaItem.SourceOfSupplyIsAssignedOnce  as SourceOfSupplyIsAssignedOnce,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _QuotaItem.MaximumReleaseQuantity        as MaximumReleaseQuantity,
         _QuotaItem.QuotaReleasePeriodType        as QuotaReleasePeriodType,
         _QuotaItem.QuotaDeterminationPriority    as QuotaDeterminationPriority,
         _QuotaItem.ManufacturerMaterial          as ManufacturerMaterial,
         _QuotaItem.PlannedDeliveryDurationInDays as QuotaPlannedDelDurInDays,

         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _SupPlan.FixedLotSizeQuantity            as FixedLotSizeQuantity,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _SupPlan.MaximumLotSizeQuantity          as MaximumLotSizeQuantity,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _SupPlan.MinimumLotSizeQuantity          as MinimumLotSizeQuantity,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _SupPlan.LotSizeRoundingQuantity         as LotSizeRoundingQuantity,
         _SupPlan.LotSizingProcedure              as LotSizingProcedure,
         _SupPlan.PlanningTimeFence               as PlanningTimeFence,
         _SupPlan.PlannedDeliveryDurationInDays   as PlannedDeliveryDurationInDays,
         _SupPlan.ProcurementType                 as ProcurementType,
         _SupPlan.ProcurementSubType              as ProcurementSubType,
         _SupPlan.AssemblyScrapPercent            as AssemblyScrapPercent,
         _SupPlan.GoodsReceiptDuration            as GoodsReceiptDuration,
         _SupPlan.ProdInhProdnDurationInWorkDays  as ProdInhProdnDurationInWorkDays,
         _Plant.FactoryCalendar                   as FactoryCalendar,

         _ProductVal.Currency                     as Currency,
         @Semantics.amount.currencyCode: 'Currency'
         _ProductVal.StandardPrice                as StandardPrice,
         _ProductVal.PriceUnitQty                 as PriceUnitQty,
         _Supplier.SupplierName                   as SupplierName,

         _Prfl.SupplyingOrProductionPlant         as SupplyingOrProductionPlant
}
where
  _Quota.ValidityEndDate >= $session.system_date
