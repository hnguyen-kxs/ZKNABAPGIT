@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Capacity Header'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_CapacityHeader
  as select from I_AvailableCapacityInterval as _CapInterval
    inner join   ZI_WorkCenter               as _WorkCenter on _CapInterval.CapacityInternalID = _WorkCenter.CapacityInternalID
{
  key  _WorkCenter.WorkCenterInternalID           as WorkCenterInternalID,
  key  _WorkCenter.WorkCenterTypeCode             as WorkCenterTypeCode,
  key  _WorkCenter.CapacityInternalID             as CapacityInternalID,
  key  _WorkCenter.Plant                          as Plant,
  key  _WorkCenter.WorkCenterLocation             as WorkCenterLocation,
  key  _CapInterval.CapacityInternalID            as CapacityID,
  key  _CapInterval.AvailableCapacityType         as AvailableCapacityType,
  key  _CapInterval.ValidityEndDate               as ValidityEndDate,
       _WorkCenter.WorkCenter                     as WorkCenter,
       _WorkCenter.WorkCenterResponsible          as WorkCenterResponsible,
       _WorkCenter.WorkCenterCategoryCode         as WorkCenterCategoryCode,
       _WorkCenter.WorkCenterText                 as WorkCenterText,
       _WorkCenter.FactoryCalendar                as FactoryCalendar,
       _WorkCenter.CapacityFactoryCalendar        as CapacityFactoryCalendar,
       _WorkCenter.CapacityBaseQtyUnit            as CapacityBaseQtyUnit,
       _WorkCenter.CapacityNumberOfCapacities     as CapacityNumberOfCapacities,
       _WorkCenter.CapacityPlanUtilizationPercent as CapacityPlanUtilizationPercent,
       _WorkCenter.CapacityStartTime              as CapacityStartTime,
       _WorkCenter.CapacityEndTime                as CapacityEndTime,
       _WorkCenter.CapacityBreakDuration          as CapacityBreakDuration,
       _WorkCenter.ShiftGroup                     as ShiftGroup,
       _CapInterval.AvailableCapacityIntervalDurn as AvailableCapacityIntervalDurn,
       _CapInterval.StdAvailableCapacityIsValid   as StdAvailableCapacityIsValid
}
