@AbapCatalog.viewEnhancementCategory:[#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CapacityShift - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_CapacityShift
  with parameters
    p_months : int2
  as select from ZI_KX_CapacityShift( p_months: $parameters.p_months  )
{
  key          CapacityInternalID,
  key          AvailableCapacityType,
  key          ShiftDefinition,
  key          ShiftGrouping,
  key          ValidityEndDate,
  key          Plant,
               WorkCenterLocation,
               WorkCenter,
               WorkCenterCategoryCode,
               WorkCenterText,
               FactoryCalendar,
               CapacityFactoryCalendar,
               CapacityBaseQtyUnit,
               CapacityNumberOfCapacities,
               CapacityPlanUtilizationPercent,
               AvailableCapacityIntervalDurn,
               StdAvailableCapacityIsValid,
               AvailableCapacityShift,
               WeekDay,
               TotOperatingDurationInSeconds,
               CapacityNumberOfCapShift,
               CapacityPlanUtilPercentShift,
               OperatingDurationInSeconds,
               CapacityStartTimeID,
               CapacityEndTimeID,
               BreakDurationInSeconds
}
