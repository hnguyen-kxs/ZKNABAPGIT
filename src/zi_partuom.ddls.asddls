@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PartUOM - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_PartUoM
  as select from I_ProductUnitsOfMeasure      as _ProdUOM
    inner join   I_ProductPlantSupplyPlanning as _SupPlan on _ProdUOM.Product = _SupPlan.Product
    inner join   I_UnitOfMeasure              as _UOM     on _ProdUOM.AlternativeUnit = _UOM.UnitOfMeasure
{
  key _ProdUOM.Product                   as Product,
  key _ProdUOM.AlternativeUnit           as AlternativeUnit,
  key _SupPlan.Plant                     as Plant,
      _ProdUOM.QuantityNumerator         as QuantityNumerator,
      _ProdUOM.QuantityDenominator       as QuantityDenominator,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      _ProdUOM.GrossWeight               as GrossWeight,
      _ProdUOM.WeightUnit                as WeightUnit,
      _ProdUOM.GlobalTradeItemNumber     as GlobalTradeItemNumber,


      _UOM.UnitOfMeasureISOCode          as UnitOfMeasureISOCode,
      _UOM.IsPrimaryUnitForISOCode       as IsPrimaryUnitForISOCode,
      _UOM.UnitOfMeasureNumberOfDecimals as UnitOfMeasureNumberOfDecimals,
      _UOM.UnitOfMeasureIsCommercial     as UnitOfMeasureIsCommercial,
      _UOM.UnitOfMeasureDimension        as UnitOfMeasureDimension,
      _UOM.SIUnitCnvrsnRateNumerator     as SIUnitCnvrsnRateNumerator,
      _UOM.SIUnitCnvrsnRateDenominator   as SIUnitCnvrsnRateDenominator

}
