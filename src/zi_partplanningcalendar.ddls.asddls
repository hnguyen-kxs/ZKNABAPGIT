@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Part Planning Calendar'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #CUSTOMIZING
}
@VDM.viewType: #COMPOSITE
define view entity ZI_PartPlanningCalendar
  as select from I_MRPPlanningPeriod          as _PlanningPeriod
    inner join   I_PlanningPeriodScheduleLine as _ScheduleLine on  _PlanningPeriod.MRPPlant            = _ScheduleLine.MRPPlant
                                                               and _PlanningPeriod.MRPPlanningCalendar = _ScheduleLine.MRPPlanningCalendar
{
  key _PlanningPeriod.MRPPlant                     as MRPPlant,
  key _PlanningPeriod.MRPPlanningCalendar          as MRPPlanningCalendar,
  key _ScheduleLine.PlngPerdScheduleLineEndDate    as PlngPerdScheduleLineEndDate,
  key _ScheduleLine.PlngPerdScheduleLineStartDate  as PlngPerdScheduleLineStartDate,
      _ScheduleLine.PlngPerdScheduleLineInternalID as PlngPerdScheduleLineInternalID,
      _ScheduleLine.PlngPerdScheduleLineIsFixed    as PlngPerdScheduleLineIsFixed,
      _PlanningPeriod.ValidityStartDate            as ValidityStartDate,
      _PlanningPeriod.ValidityEndDate              as ValidityEndDate,
      _PlanningPeriod.CreationDate                 as CreationDate,
      _PlanningPeriod.MRPPlanningCalendarCalcRule  as MRPPlanningCalendarCalcRule
}

where
  _ScheduleLine.PlngPerdScheduleLineEndDate >= $session.system_date
