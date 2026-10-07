@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Work center Composite View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_WorkCenter
  as select from    I_WorkCenter     as _Wc
    inner join      I_Capacity       as _Capacity on _Capacity.CapacityInternalID = _Wc.CapacityInternalID
    left outer join I_WorkCenterText as _WcText   on  _Wc.WorkCenterInternalID = _WcText.WorkCenterInternalID
                                                  and _Wc.WorkCenterTypeCode   = _WcText.WorkCenterTypeCode
                                                  and _WcText.Language         = $session.system_language
    inner join      I_Plant          as _Plant    on _Plant.Plant = _Wc.Plant
{
  key _Wc.WorkCenterInternalID                     as WorkCenterInternalID,
  key _Wc.WorkCenterTypeCode                       as WorkCenterTypeCode,
  key _Wc.CapacityInternalID                       as CapacityInternalID,
  key _Wc.Plant                                    as Plant,
      _Wc.WorkCenterLocation                       as WorkCenterLocation,
      _Wc.WorkCenter                               as WorkCenter,
      _Wc.WorkCenterResponsible                    as WorkCenterResponsible,
      _Wc.WorkCenterCategoryCode                   as WorkCenterCategoryCode,
      _WcText.WorkCenterText                       as WorkCenterText,
      _Wc._Plant.FactoryCalendar                   as FactoryCalendar,
      _Wc._Capacity.FactoryCalendar                as CapacityFactoryCalendar,
      _Wc._Capacity.CapacityBaseQtyUnit            as CapacityBaseQtyUnit,
      _Wc._Capacity.CapacityNumberOfCapacities     as CapacityNumberOfCapacities,
      _Wc._Capacity.CapacityPlanUtilizationPercent as CapacityPlanUtilizationPercent,
      _Wc._Capacity.CapacityStartTime              as CapacityStartTime,
      _Wc._Capacity.CapacityEndTime                as CapacityEndTime,
      _Wc._Capacity.CapacityBreakDuration          as CapacityBreakDuration,
      _Wc._Capacity.ShiftGroup                     as ShiftGroup
}
