@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bill Of Material'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_BillOfMaterial
  as select from    I_BillOfMaterialItemBasic   as _BOMItem

    inner join      I_MaterialBOMLink           as _BOMLink   on  _BOMItem.BillOfMaterialCategory = _BOMLink.BillOfMaterialCategory
                                                              and _BOMItem.BillOfMaterial         = _BOMLink.BillOfMaterial

    inner join      I_BillOfMaterialHeaderDEX_2 as _BOMHeader on  _BOMLink.BillOfMaterialCategory = _BOMHeader.BillOfMaterialCategory
                                                              and _BOMLink.BillOfMaterial         = _BOMHeader.BillOfMaterial
                                                              and _BOMLink.BillOfMaterialVariant  = _BOMHeader.BillOfMaterialVariant

    left outer join ZI_PartUoM                  as _PartUOM   on  _BOMItem.BillOfMaterialComponent = _PartUOM.Product
                                                              and _BOMLink.Plant                   = _PartUOM.Plant
                                                              and _BOMItem.BillOfMaterialItemUnit  = _PartUOM.AlternativeUnit

    inner join      I_Product                   as _Prod      on _BOMLink.Material = _Prod.Product
    left outer join I_ProductionVersion         as _ProdVer   on  _BOMLink.Material                   = _ProdVer.Material
                                                              and _BOMLink.Plant                      = _ProdVer.Plant
                                                              and _BOMLink.BillOfMaterialVariantUsage = _ProdVer.BillOfMaterialVariantUsage
                                                              and _BOMLink.BillOfMaterialVariant      = _ProdVer.BillOfMaterialVariant
                                                              and _ProdVer.ValidityEndDate            >= $session.system_date

{
  key    _BOMItem.BillOfMaterialCategory                             as BillOfMaterialCategory,
  key    cast(_BOMItem.BillOfMaterial as abap.char(8))               as BillOfMaterial,
  key    cast(_BOMItem.BillOfMaterialItemNodeNumber as abap.char(8)) as BillOfMaterialItemNodeNumber,

  key    _BOMLink.BillOfMaterialVariant                              as BillOfMaterialVariant,
  key    cast(_BOMLink.Material as abap.char(40))                    as Material,
  key    _BOMLink.Plant                                              as Plant,
  key    _BOMLink.BillOfMaterialVariantUsage                         as BillOfMaterialVariantUsage,

         _BOMItem.ValidityStartDate                                  as ValidityStartDate,
         _BOMItem.ValidityEndDate                                    as ValidityEndDate,
         _BOMItem.EngineeringChangeDocument                          as EngineeringChangeDocument,
         _BOMItem.ChgToEngineeringChgDocument                        as ChgToEngineeringChgDocument,
         cast(_BOMItem.BillOfMaterialComponent as abap.char(40))     as BillOfMaterialComponent,
         cast(_BOMItem.BillOfMaterialItemNumber as abap.char(4))     as BillOfMaterialItemNumber,
         _BOMItem.BillOfMaterialItemUnit                             as BillOfMaterialItemUnit,
         @Semantics.quantity.unitOfMeasure: 'BillOfMaterialItemUnit'
         _BOMItem.BillOfMaterialItemQuantity                         as BillOfMaterialItemQuantity,
         _BOMItem.ComponentScrapInPercent                            as ComponentScrapInPercent,
         _BOMItem.IsBulkMaterial                                     as IsBulkMaterial,
         _BOMItem.SpecialProcurementType                             as SpecialProcurementType,
         _BOMItem.MaterialIsCoProduct                                as MaterialIsCoProduct,
         _BOMItem.LeadTimeOffset                                     as LeadTimeOffset,
         _BOMItem.AlternativeItemGroup                               as AlternativeItemGroup,
         _BOMItem. AlternativeItemPriority                           as AlternativeItemPriority,
         _BOMItem.UsageProbabilityPercent                            as UsageProbabilityPercent,

         _BOMHeader.BOMHeaderBaseUnit                                as BOMHeaderBaseUnit,
         @Semantics.quantity.unitOfMeasure: 'BOMHeaderBaseUnit'
         _BOMHeader.BOMHeaderQuantityInBaseUnit,

         _PartUOM.AlternativeUnit                                    as AlternativeUnit,
         _PartUOM.QuantityNumerator                                  as QuantityNumerator,
         _PartUOM.QuantityDenominator                                as QuantityDenominator,
         _PartUOM.SIUnitCnvrsnRateNumerator                          as SIUnitCnvrsnRateNumerator,
         _PartUOM.SIUnitCnvrsnRateDenominator                        as SIUnitCnvrsnRateDenominator,

         _Prod.BaseUnit                                              as BaseUnit,

         _ProdVer.ProductionVersion                                  as ProductionVersion,
         _ProdVer.ValidityStartDate                                  as ProdVerValidityStartDate,
         _ProdVer.ValidityEndDate                                    as ProdVerValidityEndDate,
         _ProdVer.ProductionVersionIsLocked                          as ProductionVersionIsLocked,
         _ProdVer.MaterialProcurementProfile                         as MaterialProcurementProfile,
         _ProdVer.MaterialBaseUnit                                   as MaterialBaseUnit,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _ProdVer.MaterialMinLotSizeQuantity                         as MaterialMinLotSizeQuantity,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         _ProdVer.MaterialMaxLotSizeQuantity                         as MaterialMaxLotSizeQuantity
}
where
      _BOMItem.IsDeleted                     =  ''
  and _BOMItem.BillOfMaterialComponent       != ''
  and _BOMLink.IsConfiguredMaterial          =  ''
  and _BOMHeader.DeletionIndicator           =  ''
  and _BOMHeader.BOMIsArchivedForDeletion    =  ''
  and _BOMHeader.BOMHeaderQuantityInBaseUnit != 0
