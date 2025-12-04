@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product UOM - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_PartUoM
  as select from ZI_PartUoM
{
  key Product,
  key AlternativeUnit,
  key Plant,
      QuantityNumerator,
      QuantityDenominator,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      GrossWeight,
      WeightUnit,
      GlobalTradeItemNumber,
      UnitOfMeasureISOCode,
      IsPrimaryUnitForISOCode,
      UnitOfMeasureNumberOfDecimals,
      UnitOfMeasureIsCommercial,
      UnitOfMeasureDimension,
      SIUnitCnvrsnRateNumerator,
      SIUnitCnvrsnRateDenominator
}
