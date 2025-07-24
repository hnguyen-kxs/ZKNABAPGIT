@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'UnitOfMeasure - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_UnitOfMeasure
  as select from I_UnitOfMeasure
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
