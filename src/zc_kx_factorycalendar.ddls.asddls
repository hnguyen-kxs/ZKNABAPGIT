@EndUserText.label: 'Working days in a Factory Calendar'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_KX_F_CAL_WORKING_DAYS_QRY'
define custom entity ZC_KX_FactoryCalendar
  with parameters
    p_fcid    : fhc_fcalid, // // Factory Calendar ID 
    p_offset1 : ZKX_OFFSET, // How many previous years to include
    p_offset2 : ZKX_OFFSET  // How many future years to include
{
  key fcid  : fhc_fcalid; // Factory Calendar ID
  key lfcid : fhc_legacy_fcalid; // Legacy Factory Calendar ID
  key wdt   : datum; // Working Day
}
