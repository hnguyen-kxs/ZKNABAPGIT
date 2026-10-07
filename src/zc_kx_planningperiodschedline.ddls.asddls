@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Planning Period ScheduleLine'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_KX_PlanningPeriodSchedLine
  as select from ZI_PlanningPeriodScheduleLine
{
  key    MRPPlant,
  key    MRPPlanningCalendar,
  key    PlngPerdScheduleLineEndDate,
  key    PlngPerdScheduleLineStartDate,
         PlngPerdScheduleLineInternalID,
         PlngPerdScheduleLineIsFixed
}
