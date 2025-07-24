@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_Suppliers
  as select from I_Supplier as _Supplier
{
  key _Supplier.Supplier      as Supplier,
      _Supplier.SupplierName  as SupplierName,
      _Supplier.Region        as Region,
      _Supplier.SupplierPlant as SupplierPlant
}
