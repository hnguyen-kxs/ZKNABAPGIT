@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'BuyerCode - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
@DataIntegration.deltaReplication.intended: true

define view entity ZC_KX_BuyerCode
  as select from ZI_BuyerCode
{
  key PurchasingGroup,
      PurchasingGroupName
}
