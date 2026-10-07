@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Constraint Unit of Measure'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_ConstraintUoM
  as select from I_UnitOfMeasure as _UoM
    inner join   I_Capacity      as _capacity on _UoM.UnitOfMeasure = _capacity.CapacityBaseQtyUnit
{
  key _UoM.UnitOfMeasure,
      max( _UoM.UnitOfMeasureISOCode ) as UnitOfMeasureISOCode
}
group by
  _UoM.UnitOfMeasure
