@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_Customer
  as select from I_Customer as _Customer
{
  key _Customer.Customer     as Customer,
      _Customer.CustomerName as CustomerName
}
where
  IsBusinessPurposeCompleted  <> 'X'
