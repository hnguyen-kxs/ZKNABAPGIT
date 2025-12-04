@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PlannerCode - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_PlannerCode
  as select from ZI_PlannerCode
{
  key Plant,
  key MRPController,
      MRPControllerName
}
