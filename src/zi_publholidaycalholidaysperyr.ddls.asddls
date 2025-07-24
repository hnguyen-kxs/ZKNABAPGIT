

@EndUserText.label: 'Public Holiday Calender Per Year'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_PUBLIC_HOL_CAL_PER_YEAR'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define custom entity ZI_PublHolidayCalHolidaysPerYr
{
  key ID   : int4;
      UUID : abap.char(32);
}
