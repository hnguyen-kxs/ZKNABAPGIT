@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_Suppliers
  as select from I_Supplier as _Supplier
{
  key _Supplier.Supplier      as Supplier,
      _Supplier.SupplierName  as SupplierName,
      _Supplier.Region        as Region,
      _Supplier.SupplierPlant as SupplierPlant
}
where _Supplier.IsBusinessPurposeCompleted = ''
