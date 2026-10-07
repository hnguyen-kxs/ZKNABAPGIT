@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Capacity Header - Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_KX_CapacityHeader
  as select from ZI_CapacityHeader
{
  key WorkCenterInternalID,
  key WorkCenterTypeCode,
  key CapacityInternalID,
  key Plant,
  key WorkCenterLocation,
  key CapacityID,
  key AvailableCapacityType,
  key ValidityEndDate,
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
      ShiftGroup,
      AvailableCapacityIntervalDurn,
      StdAvailableCapacityIsValid
}
