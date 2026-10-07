@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part Planning Calendar - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #CUSTOMIZING
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PartPlanningCalendar
  as select from ZI_PartPlanningCalendar
{
  key MRPPlant,
  key MRPPlanningCalendar,
  key PlngPerdScheduleLineEndDate,
  key PlngPerdScheduleLineStartDate,
      PlngPerdScheduleLineInternalID,
      PlngPerdScheduleLineIsFixed,
      ValidityStartDate,
      ValidityEndDate,
      CreationDate,
      MRPPlanningCalendarCalcRule
}
