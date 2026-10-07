@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Capacity Shift'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_CapacityShift
  with parameters
    p_months : int2
  as select from    ZI_CapacityHeader        as _Header
    inner join      I_AvailableCapacityShift as _ShiftPar on  _ShiftPar.CapacityInternalID    = _Header.CapacityID
                                                          and _ShiftPar.AvailableCapacityType = _Header.AvailableCapacityType
                                                          and _ShiftPar.ValidityEndDate       = _Header.ValidityEndDate
    left outer join I_ShiftDefinition        as _ShiftDef on  _Header.ShiftGroup        = _ShiftDef.ShiftGrouping
                                                          and _ShiftPar.ShiftDefinition = _ShiftDef.ShiftDefinition
{
  key          _ShiftPar.CapacityInternalID             as CapacityInternalID,
  key          _ShiftPar.AvailableCapacityType          as AvailableCapacityType,
  key          _ShiftDef.ShiftDefinition                as ShiftDefinition,
  key          _ShiftDef.ShiftGrouping                  as ShiftGrouping,
  key          _ShiftPar.ValidityEndDate                as ValidityEndDate,
  key          _Header.Plant                            as Plant,
               _Header.WorkCenterLocation               as WorkCenterLocation,
               _Header.WorkCenter                       as WorkCenter,
               _Header.WorkCenterCategoryCode           as WorkCenterCategoryCode,
               _Header.WorkCenterText                   as WorkCenterText,
               _Header.FactoryCalendar                  as FactoryCalendar,
               _Header.CapacityFactoryCalendar          as CapacityFactoryCalendar,
               _Header.CapacityBaseQtyUnit              as CapacityBaseQtyUnit,
               _Header.CapacityNumberOfCapacities       as CapacityNumberOfCapacities,
               _Header.CapacityPlanUtilizationPercent   as CapacityPlanUtilizationPercent,
               _Header.AvailableCapacityIntervalDurn    as AvailableCapacityIntervalDurn,
               _Header.StdAvailableCapacityIsValid      as StdAvailableCapacityIsValid,
               _ShiftPar.AvailableCapacityShift         as AvailableCapacityShift,
               _ShiftPar.WeekDay                        as WeekDay,
               _ShiftPar.TotOperatingDurationInSeconds  as TotOperatingDurationInSeconds,
               _ShiftPar.CapacityNumberOfCapacities     as CapacityNumberOfCapShift,
               _ShiftPar.CapacityPlanUtilizationPercent as CapacityPlanUtilPercentShift,
               _ShiftPar.OperatingDurationInSeconds     as OperatingDurationInSeconds,
               _ShiftPar.CapacityStartTimeID            as CapacityStartTimeID,
               _ShiftPar.CapacityEndTimeID              as CapacityEndTimeID,
               _ShiftPar.BreakDurationInSeconds         as BreakDurationInSeconds
}
where
  _ShiftPar.ValidityEndDate >=(dats_add_months($session.system_date, $parameters.p_months, 'FAIL'))
