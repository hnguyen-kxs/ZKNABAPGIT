@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Planned Independent Req - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_PlndIndepRqmts
  as select from I_PlndIndepRqmtByIntKey     as _Header
    inner join   I_PlndIndepRqmtItemByIntKey as _Item on _Header.PlndIndepRqmtInternalID = _Item.PlndIndepRqmtInternalID
{
  key _Header.PlndIndepRqmtInternalID        as PlndIndepRqmtInternalID,
      @Semantics.quantity.unitOfMeasure : 'BaseUnit'
  key _Item.PlannedQuantity                  as PlannedQuantity,
      _Header.PlndIndepRqmtVersion           as PlndIndepRqmtVersion,
      cast(_Header.Product as abap.char(40)) as Product,
      _Header.Plant                          as Plant,
      _Header.PlndIndepRqmtType              as PlndIndepRqmtType,
      _Header.RequirementPlan                as RequirementPlan,
      _Header.PlndIndepRqmtConsumptionStrgy  as PlndIndepRqmtConsumptionStrgy,
      _Header.PlndIndepRqmtConsumptionAssgmt as PlndIndepRqmtConsumptionAssgmt,
      _Item.BaseUnit                         as BaseUnit,
      _Item.WorkingDayDate                   as WorkingDayDate
}
where
  _Item.PlannedQuantity > 0
