@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Source List - Composite View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SourceList
  as select from    I_MPPurchasingSourceItem as _SourceList
    left outer join I_SchedgAgrmtItmApi01    as _SchedgAgrmtItm on  _SourceList.PurchaseOutlineAgreement     = _SchedgAgrmtItm.SchedulingAgreement
                                                                and _SourceList.PurchaseOutlineAgreementItem = _SchedgAgrmtItm.SchedulingAgreementItem
{
  key cast( _SourceList.Material as abap.char(40)) as Material,
  key _SourceList.Plant                            as Plant,
  key _SourceList.SourceListRecord                 as SourceListRecord,
      _SourceList.MRPSourcingControl               as MRPSourcingControl,
      _SourceList.ValidityStartDate                as ValidityStartDate,
      _SourceList.ValidityEndDate                  as ValidityEndDate,
      _SourceList.PurchaseOutlineAgreement         as PurchaseOutlineAgreement,
      _SourceList.PurchaseOutlineAgreementItem     as PurchaseOutlineAgreementItem,
      _SourceList.PurchasingOrganization           as PurchasingOrganization,
      _SourceList.ManufacturerMaterial             as ManufacturerMaterial,
      _SourceList.PurOutlineAgreementIsFixed       as PurOutlineAgreementIsFixed,
      _SourceList.SupplierIsFixed                  as SupplierIsFixed,
      _SourceList.Supplier                         as Supplier,
      _SourceList.OrderQuantityUnit                as OrderQuantityUnit,
      _SourceList.SourceOfSupplyIsBlocked          as SourceOfSupplyIsBlocked,
      _SourceList.SupplyingPlant                   as SupplyingPlant,
      _SchedgAgrmtItm.SchedulingAgreement,
      _SchedgAgrmtItm.SchedulingAgreementItem,
      _SchedgAgrmtItm.RequirementTracking,
      _SchedgAgrmtItm.OrderPriceUnit,
      _SchedgAgrmtItm.OrdPriceUnitToOrderUnitDnmntr,
      _SchedgAgrmtItm.OrderPriceUnitToOrderUnitNmrtr,
      'L' as PurchasingDocumentCategory,
      _SchedgAgrmtItm.PurchasingInfoRecord

}
