@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Work Center - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_WorkCenter
  as select from ZI_WorkCenter
{
  key     WorkCenterInternalID,
  key     WorkCenterTypeCode,
  key     CapacityInternalID,
  key     Plant,
          WorkCenterLocation,
          WorkCenter,
          WorkCenterResponsible,
          WorkCenterCategoryCode,
          WorkCenterText,
          FactoryCalendar,
          CapacityFactoryCalendar,
          CapacityBaseQtyUnit,
          CapacityNumberOfCapacities,
          CapacityPlanUtilizationPercent,
          CapacityStartTime,
          CapacityEndTime,
          CapacityBreakDuration,
          ShiftGroup
}
