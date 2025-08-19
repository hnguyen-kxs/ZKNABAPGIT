@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
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
       @Semantics.quantity.unitOfMeasure : 'BaseUnit'
  key  PlannedQuantity,
       PlndIndepRqmtVersion,
       Product,
       Plant,
       PlndIndepRqmtType,
       RequirementPlan,
       PlndIndepRqmtConsumptionStrgy,
       PlndIndepRqmtConsumptionAssgmt,
       BaseUnit
}
