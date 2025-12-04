@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bill of Material Sales - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_BillOfMaterialSalesBOM
  as select from I_BillOfMaterialItemBasic   as _BOMItem

    inner join   I_SalesOrderBOMLink         as _BOMLink   on  _BOMItem.BillOfMaterialCategory = _BOMLink.BillOfMaterialCategory
                                                           and _BOMItem.BillOfMaterial         = _BOMLink.BillOfMaterial

    inner join   I_BillOfMaterialHeaderDEX_2 as _BOMHeader on  _BOMLink.BillOfMaterialCategory = _BOMHeader.BillOfMaterialCategory
                                                           and _BOMLink.BillOfMaterial         = _BOMHeader.BillOfMaterial
                                                           and _BOMLink.BillOfMaterialVariant  = _BOMHeader.BillOfMaterialVariant

    inner join   I_SalesDocument             as _SalesDoc  on  _BOMLink.SalesOrder              =  _SalesDoc.SalesDocument
                                                           and _SalesDoc.OverallSDProcessStatus != 'C'
    inner join   I_SalesDocumentItem         as _SalesItem on  _BOMLink.SalesOrder        =  _SalesItem.SalesDocument
                                                           and _BOMLink.SalesOrderItem    =  _SalesItem.SalesDocumentItem
                                                           and _SalesItem.SDProcessStatus != 'C'
{
  key       _BOMItem.BillOfMaterialCategory                             as BillOfMaterialCategory,
  key       cast(_BOMItem.BillOfMaterial as abap.char(8))               as BillOfMaterial,
  key       cast(_BOMItem.BillOfMaterialItemNodeNumber as abap.char(8)) as BillOfMaterialItemNodeNumber,

  key       _BOMLink.BillOfMaterialVariant                              as BillOfMaterialVariant,
  key       cast(_BOMLink.Material as abap.char(40))                    as Material,
  key       _BOMLink.Plant                                              as Plant,
  key       _BOMLink.BillOfMaterialVariantUsage                         as BillOfMaterialVariantUsage,

  key       _SalesItem.SalesDocument                                    as SalesDocument,
  key       _SalesItem.SalesDocumentItem                                as SalesDocumentItem,

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
            _BOMHeader.BOMHeaderQuantityInBaseUnit
}
where
      _BOMItem.IsDeleted                     =  ''
  and _BOMItem.BillOfMaterialComponent       != ''
  and _BOMHeader.DeletionIndicator           =  ''
  and _BOMHeader.BOMIsArchivedForDeletion    =  ''
  and _BOMHeader.BOMHeaderQuantityInBaseUnit != 0
