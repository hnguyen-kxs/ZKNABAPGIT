@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unit of Measure - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_UnitOfMeasure
  as select from ZI_UnitOfMeasure
{
  key UnitOfMeasure,
      UnitOfMeasureSAPCode,
      UnitOfMeasureISOCode,
      IsPrimaryUnitForISOCode,
      UnitOfMeasureNumberOfDecimals,
      UnitOfMeasureIsCommercial,
      UnitOfMeasureDimension,
      SIUnitCnvrsnRateNumerator,
      SIUnitCnvrsnRateDenominator,
      SIUnitCnvrsnRateExponent
}
