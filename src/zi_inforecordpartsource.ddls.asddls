@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'InfoRecord PartSource - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_InfoRecordPartSource
  as select from    I_PurgInfoRecdOrgPlntDataApi01 as _InfoRec
    inner join      I_PurchasingInfoRecordApi01    as _PurInfoRec on _InfoRec.PurchasingInfoRecord = _PurInfoRec.PurchasingInfoRecord
    inner join      I_ProductPlantSupplyPlanning   as _SupPlan    on  _InfoRec.Plant       = _SupPlan.Plant
                                                                  and _PurInfoRec.Material = _SupPlan.Product
    inner join      I_Plant                        as _Plant      on _InfoRec.Plant = _Plant.Plant
    left outer join I_ProductValuationBasic        as _ProductVal on  _PurInfoRec.Material = _ProductVal.Product
                                                                  and _InfoRec.Plant       = _ProductVal.ValuationArea
    left outer join I_Supplier                     as _Supplier   on _PurInfoRec.Supplier = _Supplier.Supplier
    left outer join I_MatlProcurementProfile       as _Prfl       on  _SupPlan.Plant           = _Prfl.Plant
                                                                  and _SupPlan.ProcurementSubType = _Prfl.MaterialProcurementProfile
{
  key _InfoRec.PurchasingInfoRecord           as PurchasingInfoRecord,
  key _InfoRec.PurchasingOrganization         as PurchasingOrganization,
  key _InfoRec.PurchasingInfoRecordCategory   as PurchasingInfoRecordCategory,
  key _InfoRec.Plant                          as Plant,
      _InfoRec.IsMarkedForDeletion            as IsMarkedForDeletion,
      _InfoRec.PurchasingGroup                as PurchasingGroup,
      _InfoRec.Currency                       as Currency,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderPriceUnit'
      _InfoRec.MinimumPurchaseOrderQuantity   as MinimumPurchaseOrderQuantity,
      _InfoRec.MaterialPlannedDeliveryDurn    as MaterialPlannedDeliveryDurn,
      @Semantics.amount.currencyCode: 'Currency'
      _InfoRec.NetPriceAmount                 as NetPriceAmount,
      _InfoRec.MaterialPriceUnitQty           as MaterialPriceUnitQty,
      _InfoRec.PurchaseOrderPriceUnit         as PurchaseOrderPriceUnit,
      _InfoRec.PriceValidityEndDate           as PriceValidityEndDate,
      _InfoRec.OrderPriceUnitToOrderUnitNmrtr as OrderPriceUnitToOrderUnitNmrtr,
      _InfoRec.OrdPriceUnitToOrderUnitDnmntr  as OrdPriceUnitToOrderUnitDnmntr,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderPriceUnit'
      _InfoRec.MaximumOrderQuantity           as MaximumOrderQuantity,
      _InfoRec.IsRelevantForAutomSrcg         as IsRelevantForAutomSrcg,
      _InfoRec.ShippingInstruction            as ShippingInstruction,

      _PurInfoRec.Supplier                    as Supplier,
      _PurInfoRec.Material                    as Material,
      _PurInfoRec.PurgDocOrderQuantityUnit    as PurgDocOrderQuantityUnit,
      _PurInfoRec.SupplierMaterialNumber      as SupplierMaterialNumber,
      _PurInfoRec.BaseUnit                    as BaseUnit,
      _PurInfoRec.IsDeleted                   as IsDeleted,

      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.FixedLotSizeQuantity           as FixedLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.MaximumLotSizeQuantity         as MaximumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.MinimumLotSizeQuantity         as MinimumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.LotSizeRoundingQuantity        as LotSizeRoundingQuantity,
      _SupPlan.LotSizingProcedure             as LotSizingProcedure,
      _SupPlan.PlanningTimeFence              as PlanningTimeFence,
      _SupPlan.ProcurementType                as ProcurementType,
      _SupPlan.ProcurementSubType             as ProcurementSubType,
      _SupPlan.AssemblyScrapPercent           as AssemblyScrapPercent,
      _SupPlan.GoodsReceiptDuration           as GoodsReceiptDuration,
      _SupPlan.ProdInhProdnDurationInWorkDays as ProdInhProdnDurationInWorkDays,
      _SupPlan.PlannedDeliveryDurationInDays  as PlannedDeliveryDurationInDays,

      _Plant.FactoryCalendar                  as FactoryCalendar,

      @Semantics.amount.currencyCode: 'Currency'
      _ProductVal.StandardPrice               as StandardPrice,
      _ProductVal.PriceUnitQty                as PriceUnitQty,
      _Supplier.SupplierName                  as SupplierName,
      _Prfl.SupplyingOrProductionPlant        as SupplyingOrProductionPlant

}
where
      _InfoRec.PriceValidityEndDate >= $session.system_date
  and _InfoRec.IsMarkedForDeletion  is initial
