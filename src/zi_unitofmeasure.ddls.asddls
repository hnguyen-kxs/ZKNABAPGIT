@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'UnitOfMeasure '
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

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
