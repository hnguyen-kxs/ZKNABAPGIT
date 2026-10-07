@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PlanningPeriod Schedule Line'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_PlanningPeriodScheduleLine
  as select from I_PlanningPeriodScheduleLine as _Line
    inner join   I_MRPPlanningPeriod          as _Header on  _Line.MRPPlanningCalendar = _Header.MRPPlanningCalendar
                                                         and _Line.MRPPlant            = _Header.MRPPlant

{
  key _Header.MRPPlant                     as MRPPlant,
  key _Header.MRPPlanningCalendar          as MRPPlanningCalendar,
  key _Line.PlngPerdScheduleLineEndDate    as PlngPerdScheduleLineEndDate,
  key _Line.PlngPerdScheduleLineStartDate  as PlngPerdScheduleLineStartDate,
      _Line.PlngPerdScheduleLineInternalID as PlngPerdScheduleLineInternalID,
      _Line.PlngPerdScheduleLineIsFixed    as PlngPerdScheduleLineIsFixed
}
where
  _Line.PlngPerdScheduleLineEndDate >= $session.system_date
