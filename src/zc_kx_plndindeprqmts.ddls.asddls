@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Planned Independent Req - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PlndIndepRqmts
  as select from ZI_PlndIndepRqmts
{
  key  PlndIndepRqmtInternalID,
  key  WorkingDayDate,
       @Semantics.quantity.unitOfMeasure : 'BaseUnit'
       PlannedQuantity,
       PlndIndepRqmtVersion,
       Product,
       Plant,
       PlndIndepRqmtType,
       RequirementPlan,
       PlndIndepRqmtConsumptionStrgy,
       PlndIndepRqmtConsumptionAssgmt,
       BaseUnit
}
