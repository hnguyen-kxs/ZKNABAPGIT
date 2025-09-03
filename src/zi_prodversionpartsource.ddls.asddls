@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProductVersion PartSource - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_ProdVersionPartSource
  as select from    I_ProductionVersion          as _ProdVer
    inner join      I_ProductPlantSupplyPlanning as _SupPlan    on  _ProdVer.Material = _SupPlan.Product
                                                                and _ProdVer.Plant    = _SupPlan.Plant
    inner join      I_Plant                      as _Plant      on _ProdVer.Plant = _Plant.Plant
    left outer join I_ProductValuationBasic      as _ProductVal on  _ProdVer.Material = _ProductVal.Product
                                                                and _ProdVer.Plant    = _ProductVal.ValuationArea
    left outer join I_MatlProcurementProfile     as _Prfl       on  _SupPlan.Plant              = _Prfl.Plant
                                                                and _SupPlan.ProcurementSubType = _Prfl.MaterialProcurementProfile

{
  key _ProdVer.Material                       as Material,
  key _ProdVer.Plant                          as Plant,
  key _ProdVer.ProductionVersion              as ProductionVersion,
      _ProdVer.BillOfOperationsType           as BillOfOperationsType,
      _ProdVer.BillOfOperationsGroup          as BillOfOperationsGroup,
      _ProdVer.BillOfOperationsVariant        as BillOfOperationsVariant,

      _ProdVer.BillOfMaterialVariantUsage     as BillOfMaterialVariantUsage,
      _ProdVer.BillOfMaterialVariant          as BillOfMaterialVariant,
      _ProdVer.ValidityStartDate              as ValidityStartDate,
      _ProdVer.ValidityEndDate                as ValidityEndDate,
      _ProdVer.ProductionVersionIsLocked      as ProductionVersionIsLocked,
      _ProdVer.MaterialProcurementProfile     as MaterialProcurementProfile,
      _ProdVer.MaterialBaseUnit               as MaterialBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      _ProdVer.MaterialMinLotSizeQuantity     as MaterialMinLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      _ProdVer.MaterialMaxLotSizeQuantity     as MaterialMaxLotSizeQuantity,

      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      _SupPlan.FixedLotSizeQuantity           as FixedLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      _SupPlan.MaximumLotSizeQuantity         as MaximumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      _SupPlan.MinimumLotSizeQuantity         as MinimumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      _SupPlan.LotSizeRoundingQuantity        as LotSizeRoundingQuantity,
      _SupPlan.LotSizingProcedure             as LotSizingProcedure,
      _SupPlan.PlanningTimeFence              as PlanningTimeFence,
      _SupPlan.PlannedDeliveryDurationInDays  as PlannedDeliveryDurationInDays,
      _SupPlan.ProcurementType                as ProcurementType,
      _SupPlan.ProcurementSubType             as ProcurementSubType,
      _SupPlan.AssemblyScrapPercent           as AssemblyScrapPercent,
      _SupPlan.GoodsReceiptDuration           as GoodsReceiptDuration,
      _SupPlan.ProdInhProdnDurationInWorkDays as ProdInhProdnDurationInWorkDays,
      _Plant.FactoryCalendar                  as FactoryCalendar,

      _ProductVal.Currency                    as Currency,
      @Semantics.amount.currencyCode: 'Currency'
      _ProductVal.StandardPrice               as StandardPrice,
      _ProductVal.PriceUnitQty                as PriceUnitQty,
      
      _Prfl.SupplyingOrProductionPlant         as SupplyingOrProductionPlant
}
